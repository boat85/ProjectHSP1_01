from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response

from .serializers import PressureSerializer
from .models import Pressure

@api_view(['GET'])
def getdataPressureALL(request):
    pressure = Pressure.objects.all()
    serializer = PressureSerializer(pressure, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getdataPressurebyID(request, pk):
    pressure = Pressure.objects.get(id=pk)
    serializer = PressureSerializer(pressure, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def createPressure(request):
    data = request.data

    pressure = Pressure.objects.create(
            id_user = data['id_user'],
            pressure = data['pressure'],
            datetime = data['datetime'],
        )
    serializer = PressureSerializer(pressure, many=False)
    return Response(serializer.data)