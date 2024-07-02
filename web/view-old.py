from django.shortcuts import render
from django.http import HttpResponse,FileResponse
from web.models import Channel,Epg
from utils.general import noepgjson,crawl_info,root_dir
from utils.aboutdb import get_html_info
import datetime,re,json,os
from dateutil import tz
import json

import xml.etree.ElementTree as ET
from urllib.parse import parse_qsl, unquote_plus, urlencode,parse_qs
tz_sh = tz.gettz('Asia/Shanghai')


# status监控页，请到templates/status.html配置
# 相关配置一个在epg文件夹的urls.py,一个在web文件夹下的urls.py
def statusepg(request):
    return render(request,'status.html')

def index(request):
    crawl_days = crawl_info['gen_xml_days']
    start_date = datetime.datetime.now().strftime(u'%Y{y}%m{m}%d{d}').format(y='年', m='月', d='日')
    start_date_no = datetime.datetime.now().strftime(u'%Y%m%d')
    end_date_date = datetime.datetime.now() + datetime.timedelta(days=crawl_days - 1)
    end_date = (end_date_date).strftime(u'%Y{y}%m{m}%d{d}').format(y='年', m='月', d='日')
    info = get_html_info(end_date_date.date())
    channel_no = info['channels'].count()
    epg_no = info['epg_no']

    ret = {'channel_no':channel_no,
           'crawl_day':crawl_days,
           'epg_no':epg_no,
           'start_date':start_date,
           'start_date_no':start_date_no,
           'end_date':end_date,
           'channels':info['channels'],
           'root_dir':root_dir,
           'n':0,}
    return render(request,"index.html",context = ret)
def download(requests,title):
    file = open(os.path.join(root_dir,title),'rb')
    response = FileResponse(file)
    response['Content-Type']='application/octet-stream'
    return response
def diyp(request):
    
    tvg_names = request.GET['ch']
               # 1. 获取原始的查询字符串
   # 1. 获取原始的查询字符串
    query_string = request.META['QUERY_STRING']
     # 2. 使用正则表达式进行处理，保留正确的格式
    # 使用正则表达式进行替换和处理
    query_string = re.sub(r'CCTV(\d+)\++', r'CCTV-\1+', query_string)
    query_string = re.sub(r'\+', '%2B', query_string)  # 将剩余的+替换为%2B
    
    # 3. 手动解析查询字符串，保留特殊字符（包括 '+'）
    query_params = parse_qs(query_string, keep_blank_values=True)
            # 4. 标准化 'ch' 参数
    if 'ch' in query_params:
        tvg_name = query_params['ch'][0]  # 获取 'ch' 参数的第一个值
        tvg_name = standardize_channel_name(tvg_name)  # 假设有一个标准化函数
        query_params['ch'] = [tvg_name]  # 更新 'ch' 参数值为标准化后的值
    # 5. 使用更新后的查询参数重新构建查询字符串
    new_query_string = urlencode(query_params, doseq=True)
    
    # 6. 更新 request.GET 和 request.META['QUERY_STRING']
    request.GET = request.GET.copy()  # 复制原始的 GET 参数
    if 'ch' in query_params:
        request.GET['ch'] = query_params['ch'][0]  # 更新 'ch' 参数的值
    request.META['QUERY_STRING'] = new_query_string  # 更新查询字符串
    tvg_name = request.GET['ch']
    tvg_date = request.GET['date']
    ret = single_channel_epg(request)
    ret_epgs = ret['epgs']
    datas = []
    if len(ret['epgs']) == 0:
        ret_epgs = noepgjson('name', 'id', datetime.datetime.now().date())

    for epg in ret_epgs:
        epg1 = {
            'start':epg['starttime'],
            'end':epg['endtime'],
            'title':epg['title'],
            'desc':epg['descr'],
        }
        datas.append(epg1)

    ret1 = {
        "tvg_name":tvg_names,
        "tvg_date":tvg_date,
        "channel_name":ret['channel'],
        "date": ret['epg_date'].strftime('%Y-%m-%d'),
        "epg_data":datas,
    }
    try:
        j = json.dumps(ret1,ensure_ascii=False)
    except Exception as e:
        print(e,datas)
        j = 'abc'
    return HttpResponse(j,content_type='application/json') #
#WEB查询某频道信息接口
def web_single_channel_epg(request):
    ret = single_channel_epg(request)
    ret_epgs = ret['epgs']
    if len(ret_epgs) == 0:
        epg = {
            'start': '',
            'end': '',
            'title': '没有此日期节目信息--%s'%ret['msg'],
            'desc': '',
        }
        ret_epgs = [epg]
    title = '%s -- %s'%(ret['channel'],ret['epg_date'].strftime('%Y-%m-%d'))

    tomorrow_date = (ret['epg_date'] + datetime.timedelta(days = 1)).strftime('%Y-%m-%d')
    tomorrow_url = '?ch=%s&date=%s'%(ret['tvg_name'],tomorrow_date)
    yesterday_date = (ret['epg_date'] - datetime.timedelta(days = 1)).strftime('%Y-%m-%d')
    yesterday_url = '?ch=%s&date=%s'%(ret['tvg_name'],yesterday_date)
    source = ret['source']
    ret = {
        'title':title,
        'tomorrow_url':tomorrow_url,
        'yesterday_url':yesterday_url,
        'epgs':ret_epgs,
        'source':source,
    }
    return render(request,'single_channel_epgs.html',context=ret)


#请求某个频道数据的通用接口
def single_channel_epg(request):
    tvg_name = ''
    success = 0
    epgs = []
    need_date = datetime.datetime.now().date() #没有提供时间，则使用当天
    msg = ''
    if request.method == "GET" and 'ch' in request.GET and 'date' in request.GET:
        tvg_name = request.GET['ch']
        if tvg_name in ["CCTV5 ","IPTV5 ","IPTV6 ","IPTV3 "]:
            tvg_name = tvg_name.strip() + '+'
        date_re = re.search(r'(\d{4})(?:\D?)(\d{2})(?:\D?)(\d{2})', request.GET['date'])
        if date_re:
            need_date = datetime.date(int(date_re.group(1)), int(date_re.group(2)), int(date_re.group(3)))
        channels = Channel.get_spec_channel_strict(Channel,tvg_name)
        if channels.count() == 0:
            msg = '没有此频道'
            channel_name = tvg_name
            source = ''
        else:
            channel = channels.first()
            channel_name = channel.name
            epgs = Epg.get_single_epg(Epg,channel,need_date)
            source = channel.source


            if len(epgs) > 0:
                success = 1
    else:
        msg = '参数错误'
        channel_name = '未提供'
    ret = {
        'success':success,
        'msg':msg,
        'epgs':epgs,
        'channel':channel_name,
        'tvg_name':tvg_name,
        'epg_date':need_date,
        'source':source,
    }
    return ret

def standardize_channel_name(channel):
        
    tid = channel.upper()
    # 第一轮清理，移除特定格式的标识符
    re_patterns = r'\[.*?\]|[0-9\.]+M|[0-9]{3,4}[pP]?|[0-9\.]+FPS'
    tid = re.sub(re_patterns, '', tid)
    tid = tid.strip()
    # 第二轮清理，移除特定的词汇和结尾标识符
    re_patterns = r'超高清|超清|高清|高清$|蓝光|频道|频道$|标清|FHD|HD|HD$|HEVC|HDR|-|\s+'
    tid = re.sub(re_patterns, '', tid)
    tid = tid.strip()

    # 处理特定的 CCTV 格式
    if 'CCTV0' in tid:
        tid = re.sub(r'CCTV0+(\d+)', r'CCTV\1', tid)
    # 对包含 CCTV 但不包含特定子字符串的情况进行处理
    if 'CCTV' in tid and 'CCTV4K' not in tid and 'CCTV5+' not in tid:
        re_pattern = r'CCTV[0-9+]{1,2}[48]?K?'
        matches = re.findall(re_pattern, tid)
        if matches:
            tid = tid.replace('4K', '', 1)
        else:
            re_pattern = r'CCTV[^0-9]+'
            matches = re.findall(re_pattern, tid)
            if matches:
                tid = tid.replace('CCTV', '', 1)
    # 特定替换
    tid = tid.replace('BTV', '北京')
    return tid
    
