from django import forms
from .models import Team, Player, Sale, Product, Inventory, Category


#Formulario de venta
class SaleForm(forms.ModelForm):

    total_cost = forms.FloatField(
        required=True,
        widget=forms.NumberInput(
            attrs={
                'id':'totalCost',
                'readonly':'readonly',
                'style':'display: none;'
            }
        )
    )

    PAYMENT_TYPE_CHOICES = (
        ('', '...'),
        ('Efectivo', 'Efectivo'),
        ('Nequi', 'Nequi'),
    )

    payment_type = forms.ChoiceField(
        required=True,
        choices=PAYMENT_TYPE_CHOICES,
        widget=forms.Select(),
    )

    type = forms.CharField(
        required=True,
        widget=forms.TextInput(
            attrs={
                'id':'typeSale',
                'readonly':'readonly',
                'class':'main__titleContainer-title',
            }
        )
    )

    product_quantity = forms.IntegerField(
        required=True,
        widget=forms.NumberInput(
            attrs={
                'readonly':'readonly',
                'value':'1',
            }
        )
    )

    class Meta:
        model = Sale
        fields = [
            'total_cost',
            'payment_type',
            'type',
            'product_quantity',
        ]

#Formulario de equipo
class TeamForm(forms.ModelForm):
    name = forms.CharField(
        max_length=20, 
        min_length=3,
        required=True,
        widget=forms.TextInput(
            attrs={
                'class':'box__pass-container-input',
                'placeholder':'Nombre del equipo',
                'group':'requeriment',
            }
        )
    )

    COLOR_CHOICES = (
        ('', 'Color del equipo...'),
        ('Azul', 'Azul'),
        ('Rojo', 'Rojo'),
        ('Amarillo', 'Amarillo'),
        ('Verde', 'Verde'),
        ('Morado', 'Morado'),
        ('Rosa', 'Rosa'),
        ('Negro', 'Negro'),
        ('Blanco', 'Blanco')
    )

    color = forms.ChoiceField(
        choices=COLOR_CHOICES,
        required=True,
        widget=forms.Select(
            attrs={
                'group':'requeriment',
            }
        )
    )

    avatar = forms.ImageField(
        required=False,
        widget=forms.FileInput(
            attrs={
                'class':'box__legend-input',
            }
        )
    )

    class Meta:
        model = Team
        fields = [
            'name',
            'color',
            'avatar',
        ]

#Formulario de jugador
class PlayerForm(forms.ModelForm):
    name = forms.CharField(
        max_length=15,
        min_length=2, 
        required=True,
        widget=forms.TextInput(attrs={'pattern':'[A-Za-záéíóúüñÁÉÍÓÚÜÑ ]+'}),
    )

    last_name = forms.CharField(
        widget=forms.TextInput(attrs={'pattern': '[A-Za-záéíóúüñÁÉÍÓÚÜÑ ]+'}), 
        max_length=15, 
        min_length=2, 
        required=True,
    )

    GENDER_CHOICES = (
        ('', '...'),
        ('Masculino', 'Masculino'),
        ('Femenino', 'Femenino'),
        ('Otro', 'Otro'),
    )

    gender = forms.ChoiceField(
        choices=GENDER_CHOICES,
        required=True,
    )
    
    age = forms.IntegerField(
        required=True,
        min_value=10,
    )

    POSITION_CHOICES = (
        ('', '...'),
        ('Portero', 'Portero'),
        ('Defensa', 'Defensa'),
        ('Centrocampista', 'Centrocampista'),
        ('Delantero', 'Delantero'),
    )

    position = forms.ChoiceField(
        choices=POSITION_CHOICES,
        required=True,
    )

    dorsal = forms.IntegerField(
        required=True,
        min_value=1,
        max_value=99,
    )

    class Meta:
        model = Player
        fields = [
            'name',
            'last_name',
            'dorsal',
            'age',
            'gender',
            'position',
        ]

class ProductForm(forms.ModelForm):
    name = forms.CharField(
        max_length=100,
        widget=forms.TextInput(
            attrs={
                'class':'form-control',
                'placeholder':'Nombre del producto'
            }
        )
        )
    cost = forms.FloatField(
        widget=forms.NumberInput(
            attrs={
                'class':'form-control',
                'placeholder':'Costo del producto'
            }
        )
    )
    description = forms.CharField(
        widget=forms.Textarea(
            attrs={
                'class':'form-control',
                'placeholder':'Descripción del producto'
            }
        )
    )
    image = forms.ImageField(
        widget=forms.FileInput(
            attrs={
                'class':'form-control',
            }
        )
    )
    due_date = forms.DateField(
        widget=forms.DateInput(
            attrs={
                'class':'form-control',
                'placeholder':'Fecha de vencimiento'
            }
        )
    )
    category = forms.ModelChoiceField(
        queryset=Category.objects.all(),
        widget=forms.Select(
            attrs={
                'class':'form-control',
            }
        )
    )
    class Meta:
        model = Product
        fields = [
            'name',
            'cost',
            'description',
            'image',
            'due_date',
            'category'
        ]
        
class InventoryForm(forms.ModelForm):
    class Meta:
        model = Inventory
        fields = [
            'entry_date',
            'product_quantity',
            'product'  
        ]

class CategoryForm(forms.ModelForm):
    name = forms.CharField(
        max_length=100,
        widget=forms.TextInput(
            attrs={
                'class':'form-control',
                'placeholder':'Nombre de la categoría'
            }
        )
    )
    forOlder = forms.BooleanField(
        widget=forms.CheckboxInput(
        )
    )
    class Meta:
        model = Category
        fields = [
            'name',
            'forOlder'
        ]