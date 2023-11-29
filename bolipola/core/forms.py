from django import forms
from .models import Team, Player, Sale, Product, Inventory, Category, TournamentTeam, Tournament, Reservation, Calendar, Comment
from datetime import datetime, timedelta

fecha_hoy = datetime.now()
fecha_hoy_str = fecha_hoy.strftime('%Y-%m-%d')
mas_2_dias = fecha_hoy + timedelta(days=2)
mas_2_dias_str = mas_2_dias.strftime('%Y-%m-%d')
mas_1_semana = fecha_hoy + timedelta(days=7)
mas_1_semana_str = mas_1_semana.strftime('%Y-%m-%d')
mas_6_meses = fecha_hoy + timedelta(days=30*6)
mas_6_meses_str = mas_6_meses.strftime('%Y-%m-%d')

#Formulario para validar comentario
class CommentForm(forms.ModelForm):
    text = forms.CharField(
        widget=forms.TextInput(
            attrs={
                'id': 'comment-send',
                'minlength': '10',
                'maxlength': '150',
                'placeholder': 'Escribe tu comentario...',
                'autocomplete': 'off'
            }
        )
    )

    class Meta:
        model = Comment
        fields = [
            'text'
        ]

#Formulario de venta
class SaleForm(forms.ModelForm):

    total_cost = forms.FloatField(
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

#Formulario de reserva
class ReservationForm(forms.ModelForm):
    the_date = forms.DateField(
        required=True,
        widget=forms.DateInput(
            attrs={
                'type':'date',
                'min':fecha_hoy_str,
                'max':mas_6_meses_str,
            }
        )
    )

    class Meta:
        model = Reservation
        fields = []

# Formulario calendario de reserva
class ReserveCalendarForm(forms.ModelForm):
    date = forms.DateField(
        required=True,
        widget=forms.DateInput(
            attrs={
                'type':'date',
                'group': 'form',
                'value':fecha_hoy_str,
            }
        )
    )

    class Meta:
        model = Calendar
        fields = [
            'date',
        ]
        
#Formulario crear torneo
class TournamentCreateForm(forms.ModelForm):
    name = forms.CharField(
        max_length=30, 
        min_length=5,
        required=True,
        widget=forms.TextInput(
            attrs={
                'id':'registerName',
            }
        )
    )

    number_teams = forms.IntegerField(
        required=True,
        min_value=2,
        widget=forms.NumberInput(
            attrs={
                'value':'16',
            }
        )
    )

    date = forms.DateTimeField(
        required=True,
        widget=forms.DateTimeInput(
            attrs={
                'type':'datetime-local',
                'min':mas_2_dias_str + 'T12:00',
                'value':mas_2_dias_str + 'T12:00',
            }
        )
    )

    prize_payment = forms.IntegerField(
        required=True,
        min_value=2000,
        widget=forms.NumberInput(
            attrs={
                'value':'1000000',
            }
        )
    )

    cost = forms.IntegerField(
        required=True,
        min_value=100,
        widget=forms.NumberInput(
            attrs={
                'value':'50000',
            }
        )
    )

    class Meta:
        model = Tournament
        fields = [
            'name',
            'number_teams',
            'date',
            'prize_payment',
            'cost',
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
        
class TournamentTeamForm(forms.ModelForm):
    goals_for = forms.IntegerField(
        required=True,
        min_value=0,
        widget=forms.NumberInput(
            attrs={
                'class':'inf',
            }
        )
    )

    goals_against = forms.IntegerField(
        required=True,
        min_value=0,
        widget=forms.NumberInput(
            attrs={
                'class':'inf',
            }
        )
    )

    games_tied = forms.IntegerField(
        required=True,
        min_value=0,
        widget=forms.NumberInput(
            attrs={
                'class':'inf',
            }
        )
    )

    games_won = forms.IntegerField(
        required=True,
        min_value=0,
        widget=forms.NumberInput(
            attrs={
                'class':'inf',
            }
        )
    )

    games_lost = forms.IntegerField(
        required=True,
        min_value=0,
        widget=forms.NumberInput(
            attrs={
                'class':'inf',
            }
        )
    )

    class Meta:
        model = TournamentTeam
        fields = [
            'goals_for',
            'goals_against',
            'games_tied',
            'games_won',
            'games_lost',
        ]

#Formulario de jugador
class PlayerForm(forms.ModelForm):
    name = forms.CharField(
        min_length=2,
        max_length=15,
        required=True,
        widget=forms.TextInput(attrs={'pattern':'[A-Za-záéíóúüñÁÉÍÓÚÜÑ ]+'}),
    )

    last_name = forms.CharField(
        widget=forms.TextInput(attrs={'pattern': '[A-Za-záéíóúüñÁÉÍÓÚÜÑ ]+'}), 
        min_length=2,
        max_length=15, 
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
        max_value=99,
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
        min_value=0
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
class CardPlayerForm(forms.ModelForm):

    yellow_card = forms.IntegerField(
        required=True,
        min_value=0,
        widget=forms.NumberInput(
            attrs={
                'class':'inf',
            }
        )
    )

    red_card = forms.IntegerField(
        required=True,
        min_value=0,
        widget=forms.NumberInput(
            attrs={
                'class':'inf',
            }
        )
    )

    blue_card = forms.IntegerField(
        required=True,
        min_value=0,
        widget=forms.NumberInput(
            attrs={
                'class':'inf',
            }
        )
    )

    class Meta:
        model = Player
        fields = [
            'yellow_card',
            'red_card',
            'blue_card',
        ]


#Formulario de producto
class ProductForm(forms.ModelForm):
    name = forms.CharField(
        required=True,
        max_length=100,
        widget=forms.TextInput(
            attrs={
                'class':'form-control',
                'placeholder':'Nombre del producto',
                }
            )
        )
    
    cost = forms.FloatField(
        required=True,
        widget=forms.NumberInput(
            attrs={
                'class':'form-control',
                'placeholder':'Costo del producto',
                'min':'0'
            }
        )
    )

    description = forms.CharField(
        required=True,
        max_length=250,
        widget=forms.Textarea(
            attrs={
                'class':'form-control',
                'placeholder':'Descripción del producto'
            }
        )
    )

    image = forms.ImageField(
        required=False,
        widget=forms.FileInput(
            attrs={
                'class':'form-control',
            }
        )
    )

    due_date = forms.DateField(
        required=True,
        widget=forms.DateInput(
            attrs={
                'class':'form-control',
                'placeholder':'Fecha de vencimiento',
                'type':'date',
                'min': mas_1_semana_str,
            }
        )
    )

    category = forms.ModelChoiceField(
        queryset=Category.objects.all(),
        required=True,
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
        
class EditProductForm(forms.ModelForm):
    name = forms.CharField(
        required=True,
        max_length=100,
        widget=forms.TextInput(
            attrs={
                'class':'form-control',
                'placeholder':'Nombre del producto',
                'readonly':'readonly',
                }
            )
        )
    
    cost = forms.FloatField(
        required=True,
        widget=forms.NumberInput(
            attrs={
                'class':'form-control',
                'placeholder':'Costo del producto',
                'min':'0',
                'readonly':'readonly'
            }
        )
    )

    description = forms.CharField(
        required=True,
        max_length=250,
        widget=forms.Textarea(
            attrs={
                'class':'form-control',
                'placeholder':'Descripción del producto'
            }
        )
    )

    image = forms.ImageField(
        required=False,
        widget=forms.FileInput(
            attrs={
                'class':'form-control',
            }
        )
    )

    due_date = forms.DateField(
        required=True,
        widget=forms.DateInput(
            attrs={
                'class':'form-control',
                'placeholder':'Fecha de vencimiento',
                'type':'date',
                'min': mas_1_semana_str,
            }
        )
    )

    category = forms.ModelChoiceField(
        queryset=Category.objects.all(),
        required=True,
        widget=forms.Select(
            attrs={
                'class':'form-control',
                'readonly':'readonly'
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

#Formulario de inventario
class InventoryForm(forms.ModelForm):
    product_quantity = forms.IntegerField(
        required=True,
        widget=forms.NumberInput(
            attrs={
                'class':'form-control',
                'min':'1',
            }
        )
    )
    
    class Meta:
        model = Inventory
        fields = [
            'product_quantity',
        ]

#-----------Categorias-----------------#
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
        required=False,
        widget=forms.CheckboxInput(
        )
    )

    class Meta:
        model = Category
        fields = [
            'name',
            'forOlder'
        ]