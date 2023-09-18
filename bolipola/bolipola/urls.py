from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from . import views
from .reserve_views import views as reserve_views

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
    path('tournament/inscription/', views.inscription, name='inscription'),
    path('tournament/team/', views.team, name='team'),
    path('tournament/team/<int:team_id>/', views.team_edit, name='team_edit'),
    path('tournament/player/', views.player, name='player'),
    path('tournament/player/<int:player_id>/', views.player_edit, name='player_edit'),
    path('store/', views.store, name='store'),
    path('profile/change_password/', views.change_password, name='change_password'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)