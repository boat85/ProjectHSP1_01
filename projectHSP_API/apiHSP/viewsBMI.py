from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response

from .serializers import BMISerializer
from .models import BMI

@api_view(['GET'])
def getdataBMIALL(request):
    bmi = BMI.objects.all()
    serializer = BMISerializer(bmi, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getdataBMIbyID(request, pk):
    bmi = BMI.objects.get(id=pk)
    serializer = BMISerializer(bmi, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def createBMI(request):
    data = request.data

    bmi = BMI.objects.create(
            id_user = data['id_user'],
            weight = data['weight'],
            height = data['height'],
            bmi = data['bmi'],
            datetime = data['datetime'],
        )
    serializer = BMISerializer(bmi, many=False)
    return Response(serializer.data)