# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2018-07-06 10:24
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0002_auto_20180705_1509'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dynamiccomment',
            name='commentDynamic',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='index.Dynamic'),
        ),
    ]
