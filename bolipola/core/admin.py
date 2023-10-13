from django.contrib import admin

from .models import Category, Product, Inventory, Output, Calendar, Reservation, Team, Player, Tournament, TournamentTeam, Sale

from user.models import UserBoli

admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Inventory)
admin.site.register(Output)
admin.site.register(Calendar)
admin.site.register(Reservation)
admin.site.register(Team)
admin.site.register(Player)
admin.site.register(Tournament)
admin.site.register(TournamentTeam)
admin.site.register(Sale)
admin.site.register(UserBoli)