from django import forms
from .models import Team

class TeamForm(forms.ModelForm):
    name = forms.CharField(
        max_length=30, 
        min_length=3,
        required=True,
        widget=forms.TextInput(
            attrs={
                'class':'box__pass-container-input',
                'placeholder':'Nombre del equipo',
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
        widget=forms.Select()
    )

    avatar = forms.ImageField(
        required=False,
        widget=forms.FileInput(
            attrs={
                'class':'box__legend-input'
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