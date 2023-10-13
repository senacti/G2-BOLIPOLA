from django import forms
from .models import UserBoli
from django.contrib.auth.forms import AuthenticationForm, UsernameField

class CustomEmailField(forms.EmailField):
    def clean(self, value):
        # Llama al método clean de la clase padre para validar el correo electrónico
        value = super().clean(value)

        # No elimines espacios en blanco al principio y al final
        return value
    
class CustomUserForm(forms.ModelForm):
    '''
    Formulario de registro
    '''
    first_name = forms.CharField(
        label='Nombre',
        max_length=15, 
        min_length=2, 
        required=True,
        widget=forms.TextInput(
            attrs={'class':'formBox__inf-box-name-input', 
                    'pattern': '^(?! )[\p{L}áéíóúüÁÉÍÓÚÜñÑ]+(?:\s[\p{L}áéíóúüÁÉÍÓÚÜñÑ]+)*(?! )$',
                    'title': 'Verifica que no tengas espacios en blanco al principio, al final o más de dos en medio',
                    }
                ),
    )

    phone = forms.CharField(
        label='Teléfono',
        max_length=10,
        min_length=10,
        widget=forms.TextInput(attrs={'pattern':'[0-9]{1,10}', 'class':'formBox__inf-box-phone-input', 'title':'Verifica que sean números y no haya espacios en blanco',}),
        required=True,
    )

    birthdate = forms.DateField(
        label='F. nacimiento',
        required=True,
        widget=forms.DateInput(attrs={'type': 'date', 'max': '2018-01-01', 'min':'1900-01-01', 'class':'formBox__inf-box-date-input'}),
    )

    password1 = forms.CharField(
        label='Contraseña',
        min_length=6,
        max_length=40,
        widget=forms.PasswordInput(attrs={'class': 'formBox__inf-box-pass-input', 'id': 'pass1', 'pattern':'^(?!.*\s)(.{6,})$', 'title':'No puedes poner espacios en blanco al principio o al final ni en medio',}),
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
        widget=forms.TextInput(attrs={'class': 'formBox__inf-box-lastName-input', 
                                      'pattern':'^(?! )[\p{L}áéíóúüÁÉÍÓÚÜñÑ]+(?:\s[\p{L}áéíóúüÁÉÍÓÚÜñÑ]+)*(?! )$',
                                      'title': 'Verifica que no tengas espacios en blanco al principio, al final o más de dos en medio',}), 
        max_length=15, 
        min_length=2, 
        required=True,
    )

    email = CustomEmailField(
        label='Correo',
        widget=forms.EmailInput(attrs={
            'class': 'formBox__inf-box-email-input', 'pattern':'^(?!.*\s)[\w\s]*[\w]+@(?:[\w]+\.)+[a-zA-Z]{2,}$', 'title':'Quita los espacios en blanco al principio, al final o en medio'}),
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
        max_length=40,
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
        max_length=15,
        min_length=2, 
        required=True,
        widget=forms.TextInput(attrs={
                'class':'box__name-input',
                'pattern': '^(?! )[\p{L}áéíóúüÁÉÍÓÚÜñÑ]+(?:\s[\p{L}áéíóúüÁÉÍÓÚÜñÑ]+)*(?! )$',
                'title': 'Verifica que no tengas espacios en blanco al principio, al final o más de dos en medio',
                'id': 'input_first_name',
                'value': '{{ user.first_name }}',
                'hidden': 'hidden',
                }),
    )

    last_name = forms.CharField(
        widget=forms.TextInput(attrs={
            'class': 'box__name-input',
            'id': 'input_last_name',
            'pattern': '^(?! )[\p{L}áéíóúüÁÉÍÓÚÜñÑ]+(?:\s[\p{L}áéíóúüÁÉÍÓÚÜñÑ]+)*(?! )$',
            'title': 'Verifica que no tengas espacios en blanco al principio, al final o más de dos en medio',
            'value': '{{ user.last_name }}',
            'hidden': 'hidden',
            }), 
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
        min_length=10,
        widget=forms.TextInput(attrs={
            'pattern': '[0-9]{1,10}', 
            'class': 'box__left-box-inf-span-input',
            'disabled': 'disabled',
            'value': '{{ user.phone }}',
            }),
        required=True,
    )

    birthdate = forms.DateField(
        widget=forms.DateInput(attrs={
            'type': 'date',
            'max': '2018-01-01',
            'min': '1900-01-01',
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
            'gender',
        ]

class ChangePasswordForm(forms.ModelForm):

    old_password = forms.CharField(
        max_length=254,
        widget=forms.PasswordInput(attrs={
            'class': 'box__pass-container-input',
            'id': 'oldpass',
        }),
        required=True,
    )

    password = forms.CharField(
        min_length=6,
        max_length=40,
        widget=forms.PasswordInput(attrs={
            'class': 'box__pass-container-input',
            'id': 'pass1',
            'pattern':'^(?!.*\s)(.{6,})$', 
            'title':'No puedes poner espacios en blanco al principio o al final ni en medio',
        }),
        required=True,
    )

    password2 = forms.CharField(
        max_length=40,
        widget=forms.PasswordInput(attrs={
            'class': 'box__pass-container-input',
            'id': 'pass2',
        }),
        required=True,
    )

    class Meta:
        model = UserBoli
        fields = [
            'password',
        ]