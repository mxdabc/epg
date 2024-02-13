# mxd's EPG
* 基于`python3`及`django4`的节目表数据抓取及发布系统
* 网站地址:[mxd's EPG](https://epg.imxd.top/)
## 配置要求：
- 服务器为Linux系统，需要安装Python，Python版本>=3.8
- 服务器具有公网IP
- 服务器需要放行8080端口（也可以改为别的，请看下文）
- 服务器配置不低于8H8G，否则可能无法流畅运行
## 主要功能  
- 从网上抓取各来源的节目表信息并生成[xmltv](http://wiki.xmltv.org/)格式文件，导入[Perfect Player](http://niklabs.com/)等APP直接载入节目表信息。
- 后台配置频道获取列表及抓取日志。
- 抓取失败时自动更换来源。
- 各数来源提供节目表的频道获取
- 提供向外发布的接口
- 使用nginx+uwsgi+MYSQL、普通办公电脑经长期测试，一天DIYP接口访问量可千万以上。  
## 节目表来源  
- 电视猫
- 搜视
- 央视
- 中数
- 台湾宽频
- 中华电信
- 香港有线宽频caletv
- 台湾四季电视
- 香港有线宽频i-cable
- 香港NOWTV
- 香港无线电视
- 北京卫视
- 广东卫视
- 香港卫视
- viutv
- 川流TV
- myTVSUPER  
## 需求  
- requests
- django
- BeautifulSoup
## 使用方法
第一步，克隆本仓库，需要服务器提前安装wget、git、pip（或pip3）、python命令，在此不多赘述。
```
git clone https://github.com/mxdabc/epg/
```
第二步，导入数据库。**推荐您使用MySQL，但是需要自己转换**    
**如果您是[Sqlite3](https://www.sqlite.org/)数据库，可以直接导入目录下的db.sqlite3文件。**    
**如果您是MySQL数据库，请手动转Sqlite3到MySQL**    
#### 更改数据库（推荐MySQL）    
`epg/settings.py`在此文件中修改配置如下：
```python
DATABASES = {
    'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': '数据库名称',
            'USER': '数据库用户名称',
            'PASSWORD': '数据库密码',
            'HOST': '127.0.0.1',
            'PORT': '3306',
    },
}
```
如果您是Sqlite3，可以更改```'ENGINE': 'django.db.backends.mysql',```      
epg目录下面的settings.py里面有每一段语法的使用方法，浏览器打开链接即可
#### SQlite3示例
```python
# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    },
}
```
