# mxd's EPG
* 基于`Python3`及`django4`的节目表数据抓取及发布系统
* 网站地址:[mxd's EPG](https://epg.imxd.top/)
* 有问题请在[Here!](https://imxd.top/d/10-epgbu-shu-jiao-cheng-ji-he)反馈！
* 您也可以新建Issues！

# ✨部署戳这里→[部署教程、常见问题](https://imxd.top/d/10-epgbu-shu-jiao-cheng-ji-he)

# ⚠紧急更新！⚠
## 请在部署之前运行
```
pip3 install pymysql django==4.2.11 mysql-connector-python -i https://pypi.tuna.tsinghua.edu.cn/simple
```
注意`django==4.2.11`，pip默认会使用django5.x！一定是`django==4.2.11`才可以运行！[原Issues](https://github.com/mxdabc/epg/issues/1)

# 效果图
- 下面是在Prefect Player运行的照片，完美适配我的CQYX     
- 需要CQYX点击下方链接↓   
> CQYX: https://discuz.mxdyeah.top/mxdyeah_discuz_thread-37-1-1.html       
![运行照片](https://discuz.mxdyeah.top/data/attachment/forum/202402/13/191525h7i6jaugzh7wgd6p.jpg)
# 配置要求：
- 服务器为Linux系统，需要安装Python，Python版本>=3.8
- 服务器具有公网IP
- 服务器需要放行8080端口（也可以改为别的，请看下文）
- 服务器配置不低于8H8G，否则可能无法流畅运行
# 主要功能
- 从网上抓取各来源的节目表信息并生成[xmltv](http://wiki.xmltv.org/)格式文件，导入[Perfect Player](https://blog.mxdyeah.top/mxdyeah_blog_post/29.html)等APP直接载入节目表信息。
- 后台配置频道获取列表及抓取日志。
- 抓取失败时自动更换来源。
- 各数来源提供节目表的频道获取
- 提供向外发布的接口
- 使用nginx+uwsgi+MYSQL、普通办公电脑经长期测试，一天DIYP接口访问量可千万以上。  
# 节目表来源
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
# 需求
- requests
- django
- BeautifulSoup
