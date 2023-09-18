from django import forms
from .models import Team, Player

#Formulario de equipo
class TeamForm(forms.ModelForm):
    name = forms.CharField(
        max_length=30, 
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