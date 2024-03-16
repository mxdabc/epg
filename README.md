# mxd's EPG
* 基于`python3`及`django4`的节目表数据抓取及发布系统
* 网站地址:[mxd's EPG](https://epg.imxd.top/)
* 失效请在 https://discuz.mxdyeah.top/mxdyeah_discuz_thread-63-1-1.html  反馈！
# [使用方法&教程汇总贴](https://discuz.mxdyeah.top/mxdyeah_discuz_thread-68-1-1.html)
## 下面是在Prefect Player运行的照片，完美适配我的CQYX
## 需要CQYX点击下方链接     
CQYX: https://discuz.mxdyeah.top/mxdyeah_discuz_thread-37-1-1.html       
        
![运行照片](https://discuz.mxdyeah.top/data/attachment/forum/202402/13/191525h7i6jaugzh7wgd6p.jpg)
## 配置要求：
- 服务器为Linux系统，需要安装Python，Python版本>=3.8
- 服务器具有公网IP
- 服务器需要放行8080端口（也可以改为别的，请看下文）
- 服务器配置不低于8H8G，否则可能无法流畅运行
## 主要功能  
- 从网上抓取各来源的节目表信息并生成[xmltv](http://wiki.xmltv.org/)格式文件，导入[Perfect Player]([http://niklabs.com/](https://blog.mxdyeah.top/mxdyeah_blog_post/29.html))等APP直接载入节目表信息。
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
### 第一步，克隆本仓库，需要服务器提前安装wget、git、pip（或pip3）、python命令，在此不多赘述。    
```
git clone https://github.com/mxdabc/epg/
```
### 第二步，导入数据库。   
#### 服务器需要安装MySQL数据库或Sqlite3数据库，如何安装请自行查找！
**推荐您使用MySQL，但是需要自己转换**    
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
如果您是Sqlite3，可以更改```'ENGINE': 'django.db.backends.mysql',```到```'ENGINE': 'django.db.backends.sqlite3',```           
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
### 第三步，程序配置。  
`util/general.py` 中有大部分配置  
`crawl_info`:需要采集的节目天数、生成xml的天数、是否需要换源等  
`dirs`:生成测试文件目录
`chuanliu_Authorization`:如果使用川流TV来源，需要提供此信息
### 第四步，运行python脚本前需要安装的依赖
```python
# pip(或pip3，看系统)执行以下语句：
pip install bs3
pip install dateutil
pip install pymysql
pip install mysql-connector-python
# 如果安装完这些依赖库，程序仍旧无法运行，请自行搜索！
# 实在没办法去本仓库上方Issues反馈！
```
### 第五步，抓取数据（运行web页面前必需）  
```python
python main.py  #抓取数据并存入数据库，可设置为定时任务
python main.py -channel #抓取所有来源的频道
python main.py -n CCTV1 #单独测试某一频道  
```
另：抓取的频道会加入Channel_list表，需要自己手动整理进Channel表中才可以抓取
### 第六步，启动Web及接口
#### 启动Web
```python
python manage.py runserver 0.0.0.0:80
```
**这里的0.0.0.0:80代表服务器运行在80端口，如果需要修改端口，请修改80为其他**     
**同时服务器需在防火墙放行相应端口，在此不多赘述**    
#### 访问  
浏览器访问http://ip地址:端口/  查看已有数据抓取情况。  
浏览器访问http://ip地址:端口/admin/ 打开后台
##### （默认用户名密码：`admin/admin`请一定更改！)  
- DIYP接口`http://127.0.0.1/api/diyp/` 需要提供参数 `?ch=CCTV1&date=20230309`
### 第七步，可选：配置Nginx反代、ssl加密证书（https）
#### 省略，大概步骤就是配置nginx代理127.0.0.1的某个端口，ssl也是nginx配置
