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
    image = models.ImageField(verbose_name='Imágen')
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
    product = models.ForeignKey(Product)

    def __str__(self):
        return self.product_quantity
    
    class Meta:
        verbose_name = 'Inventario'
        verbose_name_plural = 'Inventarios'
        db_table = 'inventario'
        ordering = ['id']