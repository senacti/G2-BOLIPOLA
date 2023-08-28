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

class Venta(models.Model):
    total_cost = models.FloatField(verbose_name='Costo total')
    payment_type = models.CharField(max_length=50, verbose_name='Tipo de pago')
    discount = models.BooleanField(verbose_name='Aplica descuento')
    total_discount = models.FloatField(verbose_name='Total descuento')
    status = models.CharField(max_length=50, verbose_name='Estado de venta')
    date = models.DateTimeField(auto_now=True, verbose_name='Fecha')
    type = models.CharField(max_length=50, verbose_name='Tipo de venta')
    product_quantity = models.PositiveIntegerField(verbose_name='Cantidad de productos comprados')
    inventory = models.ManyToManyField(Inventory)

    def __str__(self):
        return self.payment_type
    
    class Meta:
        verbose_name = 'Venta'
        verbose_name_plural = 'Ventas'
        db_table = 'venta'
        ordering = ['id']