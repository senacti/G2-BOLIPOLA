from django import forms
from .models import UserBoli
from django.contrib.auth.forms import AuthenticationForm, UsernameField

class CustomUserForm(forms.ModelForm):
    '''
    Formulario de registro
    '''

    first_name = forms.CharField(
        label='Nombre',
        max_length=20, 
        min_length=2, 
        required=True,
        widget=forms.TextInput(attrs={'class':'formBox__inf-box-name-input', 'pattern': '[A-Za-záéíóúüñÁÉÍÓÚÜÑ ]+'}),
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
        widget=forms.TextInput(attrs={'class': 'formBox__inf-box-lastName-input', 'pattern': '[A-Za-záéíóúüñÁÉÍÓÚÜÑ ]+'}), 
        max_length=20, 
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

class CustomSigninForm(AuthenticationForm):
    username = UsernameField(widget=forms.TextInput(attrs={'class': 'right__box-inputs-div-input', 'placeholder': 'Correo'}))
    password = forms.CharField(
        strip=False,
        widget=forms.PasswordInput(attrs={'class': 'right__box-inputs-div-input', 'placeholder': 'Contraseña'}),
    )

class EditProfileForm(forms.ModelForm):
    first_name = forms.CharField(
        max_length=20,
        min_length=2, 
        required=True,
        widget=forms.TextInput(attrs={
                'class':'box__name-input',
                'pattern': '[A-Za-záéíóúüñÁÉÍÓÚÜÑ ]+',
                'id': 'input_first_name',
                'value': '{{ user.first_name }}',
                'hidden': 'hidden',
                }),
    )

    last_name = forms.CharField(
        widget=forms.TextInput(attrs={
            'class': 'box__name-input',
            'id': 'input_last_name',
            'pattern': '[A-Za-záéíóúüñÁÉÍÓÚÜÑ ]+',
            'value': '{{ user.last_name }}',
            'hidden': 'hidden',
            }), 
        max_length=20, 
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
        widget=forms.Select(attrs={
            'class': 'box__left-box-inf-span-input',
            'id': 'selectInput',
            'disabled': 'disabled',
            'value': '{{ user.gender }}',
            }),
        choices=GENDER_CHOICES,
        required=True,
    )

    phone = forms.CharField(
        max_length=10,
        widget=forms.TextInput(attrs={
            'pattern': '[0-9]{1,10}', 
            'class': 'box__left-box-inf-span-input',
            'disabled': 'disabled',
            'value': '{{ user.phone }}',
            }),
        required=True,
    )

    email = forms.EmailField(
        widget=forms.EmailInput(attrs={
            'class': 'box__left-box-inf-span-input',
            'disabled': 'disabled',
            'value': '{{ user.email }}',
            }),
        required=True,
    )

    birthdate = forms.DateField(
        widget=forms.DateInput(attrs={
            'type': 'date', 'max': '2018-01-01', 
            'class': 'box__left-box-inf-span-input',
            'disabled': 'disabled',
            'id': 'birthdate',
            'value': '',
            }),
    )

    avatar = forms.ImageField(
        required=False,
        widget=forms.FileInput(attrs={
            'class': 'box__legend-input',
            'hidden': 'hidden',
            }),
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
        ]