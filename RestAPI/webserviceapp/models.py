# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Carrito(models.Model):
    juegoid = models.ForeignKey('Juegos', models.DO_NOTHING, db_column='juegoId', blank=True, null=True)  # Field name made lowercase.
    userid = models.ForeignKey('Users', models.DO_NOTHING, db_column='userId', blank=True, null=True)  # Field name made lowercase.
    cantidad = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'carrito'


class Comentariosjuegos(models.Model):
    comentario = models.CharField(max_length=500, blank=True, null=True)
    juegoid = models.ForeignKey('Juegos', models.DO_NOTHING, db_column='juegoId', blank=True, null=True)  # Field name made lowercase.
    userid = models.ForeignKey('Users', models.DO_NOTHING, db_column='userId', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'comentariosJuegos'


class Favoritos(models.Model):
    juegoid = models.ForeignKey('Juegos', models.DO_NOTHING, db_column='juegoId', blank=True, null=True)  # Field name made lowercase.
    userid = models.ForeignKey('Users', models.DO_NOTHING, db_column='userId', blank=True, null=True)  # Field name made lowercase.
    esfavorito = models.IntegerField(db_column='esFavorito', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'favoritos'


class Juegos(models.Model):
    nombre = models.CharField(max_length=50, blank=True, null=True)
    genero = models.CharField(max_length=200, blank=True, null=True)
    fechasalida = models.TextField(db_column='fechaSalida', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    consola = models.CharField(max_length=200, blank=True, null=True)
    descripcion = models.CharField(max_length=1000, blank=True, null=True)
    urlimagen = models.CharField(db_column='urlImagen', max_length=200, blank=True, null=True)  # Field name made lowercase.
    compañia = models.CharField(max_length=1000, blank=True, null=True)
    valoracion = models.IntegerField(blank=True, null=True)
    alias = models.CharField(max_length=50, blank=True, null=True)
    precio = models.DecimalField(max_digits=4, decimal_places=2, blank=True, null=True)
    rebaja = models.IntegerField(blank=True, null=True)
    comentarioid = models.ForeignKey(Comentariosjuegos, models.DO_NOTHING, db_column='comentarioId', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'juegos'


class Plataformasjuegos(models.Model):
    nombre = models.CharField(max_length=100, blank=True, null=True)
    juegoid = models.ForeignKey(Juegos, models.DO_NOTHING, db_column='juegoId', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'plataformasJuegos'


class Users(models.Model):
    nombre = models.CharField(max_length=50, blank=True, null=True)
    apellidos = models.CharField(max_length=50, blank=True, null=True)
    contraseña = models.CharField(max_length=200, blank=True, null=True)
    telefono = models.CharField(max_length=9, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    juegofavoritoid = models.ForeignKey(Favoritos, models.DO_NOTHING, db_column='juegoFavoritoId', blank=True, null=True)  # Field name made lowercase.
    comentariojuegoid = models.ForeignKey(Comentariosjuegos, models.DO_NOTHING, db_column='comentarioJuegoId', blank=True, null=True)  # Field name made lowercase.
    sessiontoken = models.CharField(db_column='sessionToken', max_length=500, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'users'
