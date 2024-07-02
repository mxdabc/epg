import xml.etree.ElementTree as ET

# 打开并解析 XML 文件
tree = ET.parse('/mxdyeah/epg/epg_match.xml') #路径注意
root = tree.getroot()

arr = {}

# 遍历每个 epg 节点
for epg in root.findall('epg'):
    tvid = epg.find('tvid').text
    epgid = epg.find('epgid').text
    name = epg.find('name').text
    status = epg.find('status').text
    
    # 跳过状态不为1的条目
    if status != "1":
        continue
    
    # 处理 name 字段，根据逗号分割并添加到 arr 字典中
    arrData = name.split(',')
    for item in arrData:
        if item.strip() != '':
            arr[item.strip()] = {'tvid': tvid, 'epgid': epgid}
            
print(arr)