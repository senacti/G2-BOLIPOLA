from datetime import date
from email.policy import default
from django.db import models
from django.contrib.auth.models import AbstractUser

class UserBoli(AbstractUser):
    email = models.EmailField(unique=True)
    avatar = models.ImageField(default='exampleUser.png', null=False, verbose_name='Avatar', upload_to='avatar/')
    birthdate = models.DateField(null=True, verbose_name='Fecha de nacimiento')
    phone = models.CharField(null=True, max_length=10, verbose_name='Teléfono')
    gender = models.CharField(default='Otro',max_length=50, verbose_name='Género', null=True)
    range = models.PositiveIntegerField(default=0, verbose_name='Rango')
    
    @property
    def age(self):
        if self.birthdate:
            today = date.today()
            age = today.year - self.birthdate.year - ((today.month, today.day) < (self.birthdate.month, self.birthdate.day))
            return age
        return None
    
    def rangeAlias(self):
        if self.is_superuser == 1:
            return ['#CB4335', 'Admin']

        #Estableciendo nombres según puntos de rango
        if self.range == 0:
            return ['#3d2f2c', 'Principiante 😁']
        elif self.range >= 1 and self.range <= 100:
            return ['#c1826a', 'Primeras compras 🛒']
        elif self.range > 100 and self.range <= 500:
            return ['#555b5e', 'Comprador común 🤝']
        elif self.range > 500 and self.range <= 1000:
            return ['#ce9f68', 'Comprador ocasional 🎯']
        elif self.range > 1000 and self.range <= 2000:
            return ['#207db4', 'Comprador fanático 💯']
        elif self.range > 1000 and self.range <= 2000:
            return ['#1fb052', 'Comprador leal 🚀']
        elif self.range > 2000 and self.range <= 4000:
            return ['#4b2fa2', 'Comprador experto 🥇']
        elif self.range > 4000 and self.range <= 5000:
            return ['#b55ce5', 'Super comprador 🌌']
        elif self.range > 5000 and self.range <= 6500:
            return ['#df6742', 'Comprador estrella ⭐']
        else:
            return ['#57b6bd', 'Maestro en compras 👑']