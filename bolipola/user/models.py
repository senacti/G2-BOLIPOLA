from datetime import date
from email.policy import default
from django.db import models
from django.contrib.auth.models import AbstractUser

class UserBoli(AbstractUser):
    email = models.EmailField(unique=True)
    avatar = models.ImageField(null=True, blank=True, verbose_name='Avatar')
    birthdate = models.DateField(null=True, verbose_name='Fecha de nacimiento')
    phone = models.CharField(null=True, max_length=10, verbose_name='Teléfono')
    gender = models.CharField(default='Otro',max_length=50, verbose_name='Género', null=True)
    rango = models.PositiveIntegerField(default=0, verbose_name='Rango')
    
    @property
    def edad(self):
        if self.birthdate:
            today = date.today()
            age = today.year - self.birthdate.year - ((today.month, today.day) < (self.birthdate.month, self.birthdate.day))
            return age
        return None