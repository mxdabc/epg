from django.urls import path
from . import views
urlpatterns = [
    path('diyp/', views.diyp),
    path('web/', views.web_single_channel_epg),
    
    # status监控页，请到templates/status.html配置
    # 函数在web/views.py
    path('status/',views.statusepg), 
]
