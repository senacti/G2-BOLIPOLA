# Generated by Django 4.2.4 on 2023-11-01 20:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0007_remove_entry_individual_cost'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='entry',
            name='cost',
        ),
    ]