from rest_framework.serializers import ModelSerializer
from .models import Users,BMI,Pressure,Congenital_Disease


class UsersSerializer(ModelSerializer):
    class Meta:
        model = Users
        fields = '__all__'

class BMISerializer(ModelSerializer):
    class Meta:
        model = BMI
        fields = '__all__'


class PressureSerializer(ModelSerializer):
    class Meta:
        model = Pressure
        fields = '__all__'

class Congenital_DiseaseSerializer(ModelSerializer):
    class Meta:
        model = Congenital_Disease
        fields = '__all__'
