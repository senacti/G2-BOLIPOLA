from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from reserve_views import views as reserve_views
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('register/', views.register, name='register'),
    path('signin/', views.signin, name='signin'),
    path('signout/', views.signout, name='signout'),
    path('profile/', views.profile, name='profile'),
    path('reserve/', views.reserve, name='reserve'),
    path('reserve/bolirana/', reserve_views.bolirana, name='bolirana_form'),
    path('reserve/court/', reserve_views.court, name='court_form'),
    path('reserve/tables/', reserve_views.tables, name='tables_form'),
    path('tournament/', views.tournament, name='tournament'),
    path('store/', views.store, name='store'),
    path('profile/change_password/', views.change_password, name='change_password')
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)