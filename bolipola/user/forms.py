from django import forms
from .models import UserBoli

class CustomUserForm(forms.ModelForm):
    '''
    Formulario de registro
    '''

    first_name = forms.CharField(
        label='Nombre',
        max_length=100, 
        min_length=2, 
        required=True,
        widget=forms.TextInput(attrs={'class':'formBox__inf-box-name-input'}),
    )

    phone = forms.CharField(
        label='Teléfono',
        max_length=10,
        widget=forms.TextInput(attrs={'pattern': '[0-9]{1,10}', 'class': 'formBox__inf-box-phone-input'}),
        required=True,
    )

    birthdate = forms.DateField(
        label='F. nacimiento',
        widget=forms.DateInput(attrs={'type': 'date', 'max': '2018-01-01', 'class': 'formBox__inf-box-date-input'}),
    )

    password1 = forms.CharField(
        label='Contraseña',
        min_length=6,
        max_length=254,
        widget=forms.PasswordInput(attrs={'class': 'formBox__inf-box-pass-input', 'id': 'pass1'}),
        required=True,
    )

    avatar = forms.ImageField(
        label='Avatar',
        required=False,
        widget=forms.FileInput(attrs={'class': 'formBox__inf-box-avatar-input',
        'id': 'colocadorImg'}),
    )

    last_name = forms.CharField(
        label='Apellido',
        widget=forms.TextInput(attrs={'class': 'formBox__inf-box-lastName-input'}), 
        max_length=100, 
        min_length=2, 
        required=True,
    )

    email = forms.EmailField(
        label='Correo',
        widget=forms.EmailInput(attrs={'class': 'formBox__inf-box-email-input'}),
        required=True,
    )

    GENDER_CHOICES = (
        ('', '...'),
        ('Masculino', 'Masculino'),
        ('Femenino', 'Femenino'),
        ('Otro', 'Otro'),
    )
    gender = forms.ChoiceField(
        label='Género',
        widget=forms.Select(attrs={'class': 'formBox__inf-box-gender-input'}),
        choices=GENDER_CHOICES,
        required=True,
    )

    password2 = forms.CharField(
        label='Confirmar contraseña',
        max_length=254,
        widget=forms.PasswordInput(attrs={'class': 'formBox__inf-box-pass-input', 'id': 'pass2'}),
    )

    password = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id': 'passwordConfirm', 'hidden': 'hidden'}),
    )

    username = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id': 'usernameConfirm', 'hidden': 'hidden'}),
    )

    class Meta:
        model = UserBoli
        fields = [
            'first_name',
            'phone',
            'birthdate',
            'avatar',
            'last_name',
            'email',
            'gender',
            'password1',
            'password2',
            'password',
            'username',
        ]