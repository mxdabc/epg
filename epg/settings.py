"""
pip3 安装Django需要 django>=4.2 !
目前变更为 Django 4.2,请各位参考文章时参考4.2
https://docs.djangoproject.com/zh-hans/4.2/
"""

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/zh-hans/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
# 请先随机生成!!!
SECRET_KEY = 'django-insecure-h+$18j4w!n3*9pk@wi3nb(oi&w=&*$c$dzw^7cgp5b4&14im&7'


# SECURITY WARNING: don't run with debug turned on in production!
"""
WARNING: 正式环境下面的True改为False!
"""
DEBUG = True

# 允许的域名
ALLOWED_HOSTS = ['https://epg.imxd.top', 'https://epg.mxdyeah.top'] 

# 建议禁止或注释
# DENY ：表示该页面不允许在 frame 中展示，即便是在相同域名的页面中嵌套也不允许
# SAMEORIGIN ：表示该页面可以在相同域名页面的 frame 中展示
# ALLOW-FROM uri ：表示该页面可以在指定来源的 frame 中展示
# X_FRAME_OPTIONS = 'SAMEORIGIN'

# 防止浏览器猜测资产的内容类型
SECURE_CONTENT_TYPE_NOSNIFF = False 

# 也是允许域名
CSRF_TRUSTED_ORIGINS = [ 'https://epg.imxd.top', 'https://epg.mxdyeah.top']

#如果要配置Nginx反向代理，这里需要修改为你的域名
CSRF_TRUSTED_ORIGINS = [ 'https://epg.imxd.top', ]

# Redis缓存，不需要的禁用
CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.redis.RedisCache",
        "LOCATION": "redis://default(用户名):password(密码)@127.0.0.1:6379",
        # Redis 默认用户名为default , 老版本除外
    }
}


INSTALLED_APPS = [
    'django.contrib.admin',
    #'django.contrib.sites',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'web',
]


MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.cache.FetchFromCacheMiddleware",#缓存
    "django.middleware.cache.UpdateCacheMiddleware",#缓存
]

ROOT_URLCONF = 'epg.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

## 显示SQL语句配置
WSGI_APPLICATION = 'epg.wsgi.application'



# 数据库
# https://docs.djangoproject.com/zh-hans/4.2/ref/settings/#databases
# ENGINE
# Default: '' (Empty string)
# 
# The database backend to use. The built-in database backends are:
# 
# 'django.db.backends.postgresql'
# 'django.db.backends.mysql'
# 'django.db.backends.sqlite3'
# 'django.db.backends.oracle'
# You can use a database backend that doesn’t ship with Django by setting ENGINE to a fully-qualified path (i.e. mypackage.backends.whatever).

# 教程
# https://blog.mxdyeah.top/
DATABASES = {
  'default': {
      'ENGINE': 'django.db.backends.sqlite3',
      'NAME': BASE_DIR / 'db.sqlite3',
  },
}

# For MySQL 数据库:
"""
DATABASES = {
  'default': {
      "ENGINE": "django.db.backends.mysql",
      "NAME": "epg",
      "USER": "epg",
      "PASSWORD": "Change ME",
      "HOST": "127.0.0.1",
      "PORT": "3306",
  },
}
"""


# Password validation
# https://docs.djangoproject.com/zh-hans/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/zh-hans/4.2/topics/i18n/

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# 静态文件需要在Nginx配置
STATIC_URL = '/static/'
STATICFILES_DIRS =[os.path.join(BASE_DIR,'static')]

# Default primary key field type
# https://docs.djangoproject.com/zh-hans/4.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
