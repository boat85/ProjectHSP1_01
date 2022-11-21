from django.db import models

# Create your models here.
class Users(models.Model):
    fullname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    sex = models.IntegerField()
    birthday = models.DateField()
    email = models.EmailField(blank=True)
    tel = models.CharField(max_length=13)
    address = models.TextField(blank=True)
    blood_type = models.CharField(max_length=5)
    password = models.TextField(blank=True)

class BMI(models.Model):
    id_user = models.IntegerField()
    weight = models.FloatField()
    height = models.FloatField()
    bmi = models.FloatField()
    datetime = models.DateTimeField(auto_now=True)

class Pressure(models.Model):
    id_user = models.IntegerField()
    pressure = models.FloatField()
    datetime = models.DateTimeField(auto_now=True)


# congenital disease
class Congenital_Disease(models.Model):
    id_user = models.IntegerField()
    name_cd = models.TextField(blank=True)
    datetime = models.DateTimeField(auto_now=True)


# prediction results wait edit
# class Prediction_Results(models.Model):
#     id_user = models.IntegerField()
#     f1 = models.models.FloatField()
#     f2 = models.models.FloatField()
#     f3 = models.models.FloatField()
#     f4 = models.models.FloatField()
#     f5 = models.models.FloatField()
#     f6 = models.models.FloatField()
#     datetime = models.DateTimeField(auto_now=True, auto_now_add=True)
