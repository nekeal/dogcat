from .base import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('POSTGRES_DB', 'dogcat'),
        'USER': os.environ.get('POSTGRES_USER', 'dogcat'),
        'PASSWORD': os.environ.get('POSTGRES_PASSWORD', 'dogcat'),
        'HOST': os.environ.get('POSTGRES_HOST', 'localhost'),
    }
}