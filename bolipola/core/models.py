from django.db import models

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
    image = models.ImageField(verbose_name='Imágen') #Puede tener un cambio por el tema de imágen
    due_date = models.DateField(verbose_name='Fecha de vencimiento')
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'
        db_table = 'producto'
        ordering = ['id']

class Inventory(models.Model):
    entry_date = models.DateTimeField(auto_now=True, verbose_name='Fecha de entrada')
    product_quantity = models.PositiveIntegerField(verbose_name='Cantidad de producto')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    def __str__(self):
        return self.product_quantity
    
    class Meta:
        verbose_name = 'Inventario'
        verbose_name_plural = 'Inventarios'
        db_table = 'inventario'
        ordering = ['id']

class Output(models.Model):
    output_date = models.DateTimeField(auto_now=True, verbose_name='Fecha de salida')
    product_quantity_out = models.PositiveIntegerField(verbose_name='Cantidad de productos fuera')
    inventory = models.ForeignKey(Inventory, on_delete=models.CASCADE)

    def __str__(self):
        return self.product_quantity_out
    
    class Meta:
        verbose_name = 'Salida'
        verbose_name_plural = 'Salidas'
        db_table = 'salida'
        ordering = ['id']
      
      
class Calendar(models.Model):
    date = models.DateTimeField(verbose_name='Fecha')
    Availability = models.BooleanField(verbose_name='Disponibilidad', default=True)

    def __str__(self):
        return self.Availability
    
    class Meta:
        verbose_name = 'Calendario'
        verbose_name_plural = 'Calendarios'
        db_table = 'calendario'
        ordering = ['id']
        
  
class Reservation(models.Model):
    availability = models.BooleanField(verbose_name='Disponibilidad', default=True)
    place = models.CharField(max_length=50, verbose_name='Lugar de la reserva')
    type = models.CharField(max_length=50, verbose_name='Tipo de reserva')
    start_time = models.DateTimeField(verbose_name='Hora de inicio')
    end_time = models.DateTimeField(verbose_name='Hora de finalización')
    cost = models.FloatField(verbose_name='Costo de la reserva')
    Calendar = models.ForeignKey(Calendar, on_delete=models.CASCADE)

    def __str__(self):
        return self.availability
    
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

    def __str__(self):
        return self.type
    
    class Meta:
        verbose_name = 'Evento'
        verbose_name_plural = 'Eventos'
        db_table = 'evento'
        ordering = ['id']

class Tournament(models.Model):
    number_teams = models.PositiveIntegerField(verbose_name='Cantidad de equipos')
    registered_teams = models.PositiveIntegerField(verbose_name='Equipos registrados')
    date = models.DateTimeField(verbose_name='Fecha del torneo')
    prize_payment = models.FloatField(verbose_name='Pago de premio')
    registration_cost = models.FloatField(verbose_name='Costo de inscripción')

    def __str__(self):
        return self.number_teams
    
    class Meta:
        verbose_name = 'Torneo'
        verbose_name_plural = 'Torneos'
        db_table = 'torneo'
        ordering = ['id']


class Sale(models.Model):
    total_cost = models.FloatField(verbose_name='Costo total')
    payment_type = models.CharField(max_length=50, verbose_name='Tipo de pago')
    discount = models.BooleanField(verbose_name='Aplica descuento')
    total_discount = models.FloatField(verbose_name='Total descuento')
    status = models.CharField(max_length=50, verbose_name='Estado de venta')
    date = models.DateTimeField(auto_now=True, verbose_name='Fecha')
    type = models.CharField(max_length=50, verbose_name='Tipo de venta')
    product_quantity = models.PositiveIntegerField(verbose_name='Cantidad de productos comprados')
    inventory = models.ManyToManyField(Inventory)
    Event = models.ManyToManyField(Event, verbose_name='Venta_evento')
    Reservation = models.ManyToManyField(Reservation, verbose_name='Venta_reserva')
    Tournament = models.ManyToManyField(Tournament, verbose_name='Venta_torneo')

    def __str__(self):
        return self.payment_type
    
    class Meta:
        verbose_name = 'Venta'
        verbose_name_plural = 'Ventas'
        db_table = 'venta'
        ordering = ['id']