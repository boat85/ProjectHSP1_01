from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response

from .serializers import Congenital_DiseaseSerializer
from .models import Congenital_Disease

@api_view(['GET'])
def getdataConDALL(request):
    ConD = Congenital_Disease.objects.all()
    serializer = Congenital_DiseaseSerializer(ConD, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getdataConDbyID(request, pk):
    ConD = Congenital_Disease.objects.get(id=pk)
    serializer = Congenital_DiseaseSerializer(ConD, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def createConD(request):
    data = request.data

    ConD = Congenital_Disease.objects.create(
            id_user = data['id_user'],
            name_cd = data['name_cd'],
            datetime = data['datetime'],
        )
    serializer = Congenital_DiseaseSerializer(ConD, many=False)
    return Response(serializer.data)