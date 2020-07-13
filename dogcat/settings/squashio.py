from .base import *

DEBUG = False

ALLOWED_HOSTS = ['*']

env_path = Path('.env')
load_dotenv(dotenv_path=env_path)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'console_info': {
            'level': 'WARNING',
            'class': 'logging.StreamHandler',
            'formatter': 'django.server',
}
    },
    'formatters': {
        'django.server': {
            '()': 'django.utils.log.ServerFormatter',
            'format': '[{server_time}] {message}',
            'style': '{'
        }
    },
    'loggers': {
        'django': {
            'handlers': ['console_info'],
        }
    }
}
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': 'db.sqlite3',
    }

}
STATIC_ROOT = os.path.join(BASE_DIR, 'public')
STATIC_URL = 'static/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = 'media/'