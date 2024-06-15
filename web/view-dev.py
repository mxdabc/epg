from django.shortcuts import render
from django.http import HttpResponse, FileResponse
from web.models import Channel, Epg
from utils.general import noepgjson, crawl_info, root_dir
from utils.aboutdb import get_html_info
import datetime, re, json, os
from dateutil import tz

tz_sh = tz.gettz('Asia/Shanghai') # 设置时区为中国时区,防止出现Linux时区错误问题

def index(request):
    crawl_days = crawl_info['gen_xml_days']
    start_date = datetime.datetime.now().strftime(u'%Y{y}%m{m}%d{d}').format(y='年', m='月', d='日')
    start_date_no = datetime.datetime.now().strftime(u'%Y%m%d')
    end_date_date = datetime.datetime.now() + datetime.timedelta(days=crawl_days - 1)
    end_date = (end_date_date).strftime(u'%Y{y}%m{m}%d{d}').format(y='年', m='月', d='日')
    info = get_html_info(end_date_date.date())
    channel_no = info['channels'].count()
    epg_no = info['epg_no']
    ret = {'channel_no': channel_no,
           'crawl_day': crawl_days,
           'epg_no': epg_no,
           'start_date': start_date,
           'start_date_no': start_date_no,
           'end_date': end_date,
           'channels': info['channels'],
           'root_dir': root_dir,
           'n': 0,}
    return render(request, "epg.html", context=ret)

def download(requests, title):
    file = open(os.path.join(root_dir, title), 'rb')
    response = FileResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    return response

def standardize_channel_name(tvg_name):
    
    # 特殊处理 CCTV-5+HD 到 CCTV5+ 的情况
    if 'CCTV-5+HD' in tvg_name:
        tvg_name = 'CCTV5+'
        
    # 特殊处理 CCTV-5+HD 到 CCTV5+ 的情况
    if 'CCTV-5+' in tvg_name:
        tvg_name = 'CCTV5+'
        
    # 去除非字母数字汉字字符，并转换为大写
    tvg_name = re.sub(r'[^a-zA-Z0-9\u4e00-\u9fa5]', '', tvg_name).upper()
    
    # 处理类似 CCTV-5+ 到 CCTV5+ 的情况
    tvg_name = re.sub(r'CCTV-(\d+)\+', r'CCTV\1+', tvg_name)
    
    # 处理类似 CCTV-1-HD 到 CCTV1 的情况
    tvg_name = re.sub(r'([A-Z]+)(\d+).*', r'\1\2', tvg_name)

    # 处理类似 CCTV-5 高清 的情况，先处理数字
    tvg_name = re.sub(r'([A-Z]+)(\d+).*', r'\1\2', tvg_name)
    
    # 处理类似 cctv-3高清 到 CCTV3 的情况
    tvg_name = re.sub(r'cctv-(\d+).*', r'CCTV\1', tvg_name)
    
    # 处理类似 abcXX卫视def 的情况，去掉后面的部分
    match = re.match(r'.*?([\u4e00-\u9fa5]+卫视).*', tvg_name)
    if match:
        tvg_name = match.group(1)
    
    return tvg_name

def diyp(request):
    # 标准化频道名称
    if request.method == "GET" and 'ch' in request.GET:
        tvg_name = request.GET['ch']
        tvg_name = standardize_channel_name(tvg_name)
        request.GET = request.GET.copy()
        request.GET['ch'] = tvg_name

    ret = single_channel_epg(request)
    ret_epgs = ret['epgs']
    datas = []
    if len(ret['epgs']) == 0:
        ret_epgs = noepgjson('name', 'id', datetime.datetime.now().date())
    for epg in ret_epgs:
        epg1 = {
            'start': epg['starttime'],
            'end': epg['endtime'],
            'title': epg['title'],
            'desc': epg['descr'],
        }
        datas.append(epg1)
    ret1 = {
        "channel_name": ret['channel'],
        "date": ret['epg_date'].strftime('%Y-%m-%d'),
        "epg_data": datas,
    }
    try:
        j = json.dumps(ret1, ensure_ascii=False)
    except Exception as e:
        print(e, datas)
        j = 'abc'
    return HttpResponse(j, content_type='application/json')

def mxdepg(request):
    # 标准化频道名称
    if request.method == "GET" and 'ch' in request.GET:
        tvg_name = request.GET['ch']
        tvg_name = standardize_channel_name(tvg_name)
        request.GET = request.GET.copy()
        request.GET['ch'] = tvg_name

    ret = single_channel_epg(request)
    ret_epgs = ret['epgs']
    datas = []
    if len(ret['epgs']) == 0:
        ret_epgs = noepgjson('name', 'id', datetime.datetime.now().date())
    for epg in ret_epgs:
        epg1 = {
            'start': epg['starttime'],
            'end': epg['endtime'],
            'title': epg['title'],
            'desc': epg['descr'],
        }
        datas.append(epg1)
    ret1 = {
        "epg_name": ret['channel'],
        "epg_date": ret['epg_date'].strftime('%Y-%m-%d'),
        "epg_data": datas,
    }
    try:
        j = json.dumps(ret1, ensure_ascii=False)
    except Exception as e:
        print(e, datas)
        j = 'abc'
    return HttpResponse(j, content_type='application/json')

# WEB查询某频道信息接口
def web_single_channel_epg(request):
    # 标准化频道名称
    if request.method == "GET" and 'ch' in request.GET:
        tvg_name = request.GET['ch']
        tvg_name = standardize_channel_name(tvg_name)
        request.GET = request.GET.copy()
        request.GET['ch'] = tvg_name

    ret = single_channel_epg(request)
    ret_epgs = ret['epgs']
    if len(ret_epgs) == 0:
        epg = {
            'start': '',
            'end': '',
            'title': '没有此日期节目信息-%s' % ret['msg'],
            'desc': '',
        }
        ret_epgs = [epg]
    title = '%s -- %s' % (ret['channel'], ret['epg_date'].strftime('%Y-%m-%d'))

    tomorrow_date = (ret['epg_date'] + datetime.timedelta(days=1)).strftime('%Y-%m-%d')
    tomorrow_url = '?ch=%s&date=%s' % (ret['tvg_name'], tomorrow_date)
    yesterday_date = (ret['epg_date'] - datetime.timedelta(days=1)).strftime('%Y-%m-%d')
    yesterday_url = '?ch=%s&date=%s' % (ret['tvg_name'], yesterday_date)
    source = ret['source']
    ret = {
        'title': title,
        'tomorrow_url': tomorrow_url,
        'yesterday_url': yesterday_url,
        'epgs': ret_epgs,
        'source': source,
    }
    return render(request, 'web_epg.html', context=ret)

# 请求某个频道数据的通用接口
def single_channel_epg(request):
    tvg_name = ''
    success = 0
    epgs = []
    need_date = datetime.datetime.now().date() # 没有提供时间，则使用当天
    msg = ''
    if request.method == "GET" and 'ch' in request.GET and 'date' in request.GET:
        tvg_name = request.GET['ch']
        date_re = re.search(r'(\d{4})\D(\d+)\D(\d+)', request.GET['date'])
        if date_re:
            need_date = datetime.date(int(date_re.group(1)), int(date_re.group(2)), int(date_re.group(3)))
        channels = Channel.get_spec_channel_strict(Channel, tvg_name)
        if channels.count() == 0:
            msg = '没有此频道'
            channel_name = tvg_name
            source = ''
        else:
            channel = channels.first()
            channel_name = channel.name
            epgs = Epg.get_single_epg(Epg, channel, need_date)
            source = channel.source
            if len(epgs) > 0:
                success = 1
    else:
        msg = '参数错误'
        channel_name = '未提供'
    ret = {
        'success': success,
        'msg': msg,
        'epgs': epgs,
        'channel': channel_name,
        'tvg_name': tvg_name,
        'epg_date': need_date,
        'source': source,
    }
    return ret
