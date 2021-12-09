purl="from django.contrib import admin\nfrom django.urls import path, include\nurlpatterns = [\npath('admin/', admin.site.urls),\npath('', include('$3.urls'))\n]";

aurl="from django.contrib import admin\nfrom django.urls import path, include\nurlpatterns = [\npath('admin/', admin.site.urls),\npath(' ', views.index, name='index'),\n]";

appv="""from django.shortcuts import render\n# Create your views here.\ndef index(request):\n\treturn render(request, "index.html",)""";

settings="""from pathlib import Path\nimport os\n# Build paths inside the project like this: BASE_DIR / 'subdir'.\nBASE_DIR = Path(__file__).resolve().parent.parent\n# Quick-start development settings - unsuitable for production\n# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-u7rl+8swz&ewg)ua*2)+vswfaak_!j%75q4qmznswz4b9sck9l'\n\n# SECURITY WARNING: don't run with debug turned on in production!\n\nDEBUG = True\n\nALLOWED_HOSTS = []\n# Application definition\n\nINSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    "$3",
]\n\nMIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]\n\nROOT_URLCONF = 'proj.urls'\n\nTEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, "templates")],
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
]\n\nWSGI_APPLICATION = 'proj.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases\n\nDATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators\n\nAUTH_PASSWORD_VALIDATORS = [
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
# https://docs.djangoproject.com/en/3.2/topics/i18n/\n\nLANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.2/howto/static-files/

STATIC_URL = '/static/'

# Default primary key field type
# https://docs.djangoproject.com/en/3.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
""";

dpurls(){
        rm './$3/$3/urls.py';
        touch './$3/$3/urls.py';
        echo -e purl >> './$3/$3/urls.py';
};
dpapps(){                                rm './$3/$2/urls.py';            touch './$3/$2/urls.py';         echo -e aurl >> './$3/$2/urls.py';                        };

appview(){
        rm './$3/$2/views.py';            touch './$3/$2/views.py';         echo -e appv >> './$3/$2/views.py';
};
