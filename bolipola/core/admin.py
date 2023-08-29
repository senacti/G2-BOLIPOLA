from django.contrib import admin

from .models import Category, Product, Inventory, Output, Calendar, Reservation, Event, Team, Player, Tournament, TournamentTeam, Sale

admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Inventory)
admin.site.register(Output)
admin.site.register(Calendar)
admin.site.register(Reservation)
admin.site.register(Event)
admin.site.register(Team)
admin.site.register(Player)
admin.site.register(Tournament)
admin.site.register(TournamentTeam)
admin.site.register(Sale)