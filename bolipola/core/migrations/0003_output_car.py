# Generated by Django 4.2.4 on 2023-10-30 14:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_remove_output_car'),
    ]

    operations = [
        migrations.AddField(
            model_name='output',
            name='car',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='core.car'),
        ),
    ]