from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from . import views
from .reserve_views import views as reserve_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('terms/', views.terms, name='terms'),
    path('', views.index, name='index'),
    path('comment/filter/<str:filter>/', views.comment_filter, name='comment_filter'),
    path('add_like/', views.add_like, name='add_like'),
    path('del_like/', views.del_like, name='del_like'),
    path('register/', views.register, name='register'),
    path('signin/', views.signin, name='signin'),
    path('signout/', views.signout, name='signout'),
    path('profile/', views.profile, name='profile'),
    path('reserve/', views.reserve, name='reserve'),
    path('reserve/bolirana/', reserve_views.bolirana, name='bolirana_form'),
    path('reserve/court/', reserve_views.court, name='court_form'),
    path('reserve/tables/', reserve_views.tables, name='tables_form'),
    path('tournament/', views.tournament, name='tournament'),
    path('tournament/filter/finished/', views.watch_finished_tournament_filter, name='tournament_filter_finished'),
    #path('tournament/inscription/', views.inscription, name='inscription'),
    path('tournament/team/', views.team, name='team'),
    path('tournament/cancel/<int:tournament_id>/', views.tournament_cancel, name='tournament_cancel'),
    path('tournament/teams/<int:tournament_id>/<str:filter>', views.tournament_teams, name='tournament_teams'),
    path('tournament/teams/filter/', views.tournament_teams_filter, name='tournament_teams_filter'),
    path('tournament/teams/<int:tournament_id>/<int:team_id>/', views.tournament_players, name='tournament_players'),
    path('tournament/team/<int:team_id>/', views.team_edit, name='team_edit'),
    path('tournament/player/', views.player, name='player'),
    path('tournament/player/<int:player_id>/', views.player_edit, name='player_edit'),
    path('store/', views.store, name='store'),
    path('store/add/', views.store_product_add, name="store_product_add"),
    path('store/del/', views.store_product_del, name="store_product_del"),
    path('profile/change_password/', views.change_password, name='change_password'),
    path('sale/<int:type_id>/<str:type_name>/', views.sale, name='sale'),
    path('sale/historic/', views.sale_historic, name='sale_historic'),
    path('sale/information/<int:sale_id>/', views.sale_information, name='sale_information'),
    path('sale/confirm/<int:sale_id>/', views.sale_confirm, name='sale_confirm'),
    path('sale/cancel/<int:sale_id>/', views.sale_cancel, name='sale_cancel'),
    path('cooldown/', views.ajax_for_cooldown, name='ajax_for_cooldown'),
    path('inventory/', views.inventory, name='inventory'),
    path('edit-product/<int:pk>/', views.edit_product, name='edit_product'),
    path('delete-product/<int:pk>/', views.delete_product, name='delete_product'),
    path('quantity-product/<int:pk>/<str:add>', views.quantity_product, name='quantity_product'),
    path('create-category/', views.create_category, name='create_category'),
    path('create-product/', views.create_product, name='create_product'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)