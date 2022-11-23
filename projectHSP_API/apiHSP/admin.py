from django.contrib import admin
from .models import Users,BMI,Pressure,Congenital_Disease

# Register your models here.
admin.site.register(Users)
admin.site.register(BMI)
admin.site.register(Pressure)
admin.site.register(Congenital_Disease)

