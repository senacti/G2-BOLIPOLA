from django.db import models
from user.models import UserBoli
from django.utils import timezone
import locale
locale.setlocale(locale.LC_ALL, '')

class Comment(models.Model):
    score = models.PositiveIntegerField(verbose_name='Puntuación')
    text = models.TextField(verbose_name='Texto')
    date = models.DateField(auto_now_add=True)
    user = models.ForeignKey(UserBoli, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.user.first_name} {self.text[:15]}...'
    
    class Meta:
        verbose_name = 'Comentario'
        verbose_name_plural = 'Comentarios'
        db_table = 'comentario'
        ordering = ['id']

class Category(models.Model):
    name = models.CharField(max_length=100, verbose_name='Nombre')
    forOlder = models.BooleanField(verbose_name='Para mayores')

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name = 'Categoría'
        verbose_name_plural = 'Categorías'
        db_table = 'categoria'
        ordering = ['id']

class Product(models.Model):
    name = models.CharField(max_length=100, verbose_name='Nombre')
    cost = models.FloatField(verbose_name='Costo')
    description = models.TextField(verbose_name='Descripción')
    image = models.ImageField(verbose_name='Imágen', upload_to='product/')
    due_date = models.DateField(verbose_name='Fecha de vencimiento')
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
    
    def sale_type(self):
        return 'Productos'

    def cost_to_money(self):
        money = locale.currency(self.cost, symbol=True, grouping=True)
        money = money[:-3]
        return money

    class Meta:
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'
        db_table = 'producto'
        ordering = ['id']

class Inventory(models.Model):
    entry_date = models.DateTimeField(default=timezone.now, verbose_name='Fecha de entrada')
    product_quantity = models.PositiveIntegerField(verbose_name='Cantidad de producto', default=0)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        return str(f'{self.product_quantity} - {self.product.name}')

    class Meta:
        verbose_name = 'Inventario'
        verbose_name_plural = 'Inventarios'
        db_table = 'inventario'
        ordering = ['id']

class Output(models.Model):
    output_date = models.DateTimeField(default=timezone.now, verbose_name='Fecha de salida')
    product_quantity_out = models.PositiveIntegerField(verbose_name='Cantidad de productos fuera')
    inventory = models.ForeignKey(Inventory, on_delete=models.CASCADE)

    def __str__(self):
        return str(f'{self.product_quantity_out}, {self.inventory.product.name}')
    
    class Meta:
        verbose_name = 'Salida'
        verbose_name_plural = 'Salidas'
        db_table = 'salida'
        ordering = ['id']
      
      
class Calendar(models.Model):
    date = models.DateField(verbose_name='Fecha del día')
    availability = models.BooleanField(verbose_name='Dia disponible (no lo marques para reconocer que no esta disponible el día establecido)', default=False)

    def __str__(self):
        return str(f'{self.availability} - {self.date}')
    
    class Meta:
        verbose_name = 'Calendario'
        verbose_name_plural = 'Calendarios'
        db_table = 'calendario'
        ordering = ['id']
        
  
class Reservation(models.Model):
    place = models.CharField(max_length=50, verbose_name='Lugar de la reserva')
    type = models.CharField(max_length=50, verbose_name='Tipo de reserva')
    date = models.DateField(verbose_name='Dia de reserva')
    start_time = models.TimeField(verbose_name='Hora de inicio')
    end_time = models.TimeField(verbose_name='Hora de finalización')
    cost = models.FloatField(verbose_name='Costo de la reserva')
    confirmed = models.BooleanField(verbose_name='Confirmado', default=False)

    def __str__(self):
        return str(f'{self.type}')
    
    def sale_type(self):
        return 'Reserva'
    
    def cost_to_money(self):
        money = locale.currency(self.cost, symbol=True, grouping=True)
        money = money[:-3]
        return money
    
    class Meta:
        verbose_name = 'Reserva'
        verbose_name_plural = 'Reservas'
        db_table = 'reserva'
        ordering = ['id']

class Event(models.Model):
    type = models.CharField(max_length=50, verbose_name='Tipo de evento')
    place = models.CharField(max_length=50, verbose_name='Lugar del evento')
    date = models.DateTimeField(verbose_name='Fecha del evento')
    cost = models.FloatField(verbose_name='Costo del evento')
    guests = models.PositiveIntegerField(verbose_name='Cantidad de invitados')
    description = models.TextField(verbose_name='Descripción', default='Fiesta')

    def sale_type(self):
        return 'Evento'

    def __str__(self):
        return self.type
    
    class Meta:
        verbose_name = 'Evento'
        verbose_name_plural = 'Eventos'
        db_table = 'evento'
        ordering = ['id']

class Team(models.Model):
    name = models.CharField(max_length=30, verbose_name='Nombre', null=False)
    color = models.CharField(max_length=20, verbose_name='Color', null=False)
    players_num = models.PositiveIntegerField(default=0, verbose_name='Número de jugadores')
    avatar = models.ImageField(default='group.png',verbose_name='Avatar', upload_to='team_avatar/')
    user = models.ForeignKey(UserBoli, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    def hexcolor(self):
        if (self.color == 'Azul'):
            return '#2980B9'
        if (self.color == 'Rojo'):
            return '#E74C3C'
        if (self.color == 'Amarillo'):
            return '#F1C40F'
        if (self.color == 'Verde'):
            return '#28B463'
        if (self.color == 'Morado'):
            return '#884EA0'
        if (self.color == 'Rosa'):
            return '#F03687'
        if (self.color == 'Negro'):
            return '#000000'
        if (self.color == 'Blanco'):
            return '#FFFFFF'

    class Meta:
        verbose_name = 'Equipo'
        verbose_name_plural = 'Equipos'
        db_table = 'equipo'
        ordering = ['id']

class Player(models.Model):
    name = models.CharField(max_length=100, verbose_name='Nombre', null=False)
    last_name = models.CharField(max_length=100, verbose_name='Apellido', null=False)
    dorsal = models.PositiveBigIntegerField(verbose_name='Número de dorsal', null=False)
    age = models.PositiveIntegerField(verbose_name='Edad', null=False)
    gender = models.CharField(max_length=50, verbose_name='Género', null=False)
    position = models.CharField(max_length=60, verbose_name='Posición', null=False)
    yellow_card = models.IntegerField(verbose_name='Tarjeta amarilla', default=0)
    blue_card = models.IntegerField(verbose_name='Tarjeta azul', default=0)
    red_card = models.IntegerField(verbose_name='Tarjeta roja', default=0)
    team = models.ForeignKey(Team, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.dorsal} - {self.name} {self.last_name} - {self.position}'
    
    def save_cards(self, yellow, blue, red):
        self.yellow_card = yellow
        self.blue_card = blue
        self.red_card = red
    
    class Meta:
        verbose_name = 'Jugador'
        verbose_name_plural = 'Jugadores'
        db_table = 'jugador'
        ordering = ['id']

class Tournament(models.Model):
    name = models.CharField(max_length=100, verbose_name='Nombre', null=True)
    number_teams = models.PositiveIntegerField(verbose_name='Cantidad de equipos permitidos', default=16)
    date = models.DateTimeField(verbose_name='Fecha de inicio del torneo')
    prize_payment = models.FloatField(verbose_name='Pago de premio')
    cost = models.FloatField(verbose_name='Costo de inscripción')
    active = models.BooleanField(verbose_name='Torneo activo (no mover)', default=True)
    team = models.ManyToManyField(Team, through='TournamentTeam')

    def __str__(self):
        return self.name
    
    def sale_type(self):
        return 'Torneo'

    def payment_to_money(self):
        money = locale.currency(self.prize_payment, symbol=True, grouping=True)
        money = money[:-3]
        return money

    def cost_to_money(self):
        money = locale.currency(self.cost, symbol=True, grouping=True)
        money = money[:-3]
        return money
    
    def registered_teams(self):
        total = 0
        intermediates = TournamentTeam.objects.all().filter(tournament_id=self.id)
        for registered in intermediates:
            total += 1

        return total

    class Meta:
        verbose_name = 'Torneo'
        verbose_name_plural = 'Torneos'
        db_table = 'torneo'
        ordering = ['id']

class TournamentTeam(models.Model):
    tournament = models.ForeignKey(Tournament, on_delete=models.CASCADE)
    team = models.ForeignKey(Team, on_delete=models.CASCADE)
    goals_for = models.IntegerField(verbose_name='Goles a favor', default=0)
    goals_against = models.IntegerField(verbose_name='Goles en contra', default=0)
    goals_diff = models.IntegerField(verbose_name='Diferencia de goles', default=0)
    games_tied = models.IntegerField(verbose_name='Partidos empatados', default=0)
    games_won = models.IntegerField(verbose_name='Partidos ganados', default=0)
    games_lost = models.IntegerField(verbose_name='Partidos perdidos', default=0)
    games_played = models.IntegerField(verbose_name='Partidos jugados', default=0)
    score = models.IntegerField(verbose_name='Puntaje', default=0)

    def __str__(self):
        return str(f'{self.tournament.name} - {self.team.name}')

    class Meta:
        verbose_name = 'Torneo y equipo'
        verbose_name_plural = 'Torneos y equipos'
        db_table = 'torneo_equipo'
        ordering = ['id']

class Sale(models.Model):
    total_cost = models.FloatField(verbose_name='Costo total')
    payment_type = models.CharField(max_length=50, verbose_name='Tipo de pago')
    status = models.CharField(max_length=50, verbose_name='Estado de venta', default='En proceso...')
    date = models.DateTimeField(default=timezone.now, verbose_name='Fecha')
    type = models.CharField(max_length=50, verbose_name='Tipo de venta')
    product_quantity = models.PositiveIntegerField(verbose_name='Cantidad de productos comprados')
    inventory = models.ManyToManyField(Inventory, through='SaleInventory')
    event = models.ManyToManyField(Event, through='SaleEvent')
    reservation = models.ManyToManyField(Reservation, through='SaleReservation')
    tournament = models.ManyToManyField(Tournament, through='SaleTournament')
    user = models.ForeignKey(UserBoli, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.user.first_name} - {self.date} - {self.type}'

    def cost_to_money(self):
        money = locale.currency(self.total_cost, symbol=True, grouping=True)
        money = money[:-3]
        return money

    def search_intermediate(self):
        listTables = [SaleTournament, SaleReservation, SaleInventory, SaleEvent]

        for table in listTables:
            intermediate = table.objects.filter(sale_id=self.id)
            if intermediate:
                the_table = intermediate.first()

        return the_table

    def status_number(self):
        if self.status == 'En proceso...':
            return 's1'
        if self.status == 'Comprado':
            return 's2'
        if self.status == 'Cancelado':
            return 's3'

    class Meta:
        verbose_name = 'Venta'
        verbose_name_plural = 'Ventas'
        db_table = 'venta'
        ordering = ['id']

class SaleTournament(models.Model):
    sale = models.ForeignKey(Sale, on_delete=models.CASCADE)
    tournament = models.ForeignKey(Tournament, on_delete=models.CASCADE)

    def __str__(self):
        return str(f'{self.sale.type} - {self.tournament.name}')

    class Meta:
        verbose_name = 'Venta y torneo'
        verbose_name_plural = 'Ventas y torneos'
        db_table = 'venta_torneo'
        ordering = ['id']

class SaleReservation(models.Model):
    sale = models.ForeignKey(Sale, on_delete=models.CASCADE)
    reservation = models.ForeignKey(Reservation, on_delete=models.CASCADE)

    def __str__(self):
        return str(f'{self.sale.type} - {self.reservation.type}')

    class Meta:
        verbose_name = 'Venta y reserva'
        verbose_name_plural = 'Ventas y reservas'
        db_table = 'venta_reserva'
        ordering = ['id']

class SaleInventory(models.Model):
    sale = models.ForeignKey(Sale, on_delete=models.CASCADE)
    inventory = models.ForeignKey(Inventory, on_delete=models.CASCADE)

    def __str__(self):
        return str(f'{self.sale.type} - {self.inventory.product.name}')

    class Meta:
        verbose_name = 'Venta e inventario'
        verbose_name_plural = 'Ventas e inventarios'
        db_table = 'venta_inventario'
        ordering = ['id']

class SaleEvent(models.Model):
    sale = models.ForeignKey(Sale, on_delete=models.CASCADE)
    event = models.ForeignKey(Event, on_delete=models.CASCADE)

    def __str__(self):
        return str(f'{self.sale.type} - {self.event.type}')

    class Meta:
        verbose_name = 'Venta y evento'
        verbose_name_plural = 'Ventas y eventos'
        db_table = 'venta_evento'
        ordering = ['id']