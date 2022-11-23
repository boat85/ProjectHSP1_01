from django.urls import path
from .import views,viewsBMI,viewsConD,viewsPressure

urlpatterns = [
    # users,
    path('getUsers/',views.getdataUsers),
    path('create/',views.createUser),
    path('update/<str:pk>/',views.updateUser),
    path('delete/<str:pk>/',views.deleteUser),
    path('getUsers/<str:pk>/',views.getdataUser),
    path('getUsers/<str:pk>/<str:pk1>/',views.getdataUserlogin),
    #BMI
    path('getdataBMIALL/',viewsBMI.getdataBMIALL),
    path('getdataBMIbyID/<str:pk>/',viewsBMI.getdataBMIbyID),
    path('createBMI/',viewsBMI.createBMI),
    #Congenital_Disease
    path('getdataConDALL/',viewsConD.getdataConDALL),
    path('getdataConDbyID/<str:pk>/',viewsConD.getdataConDbyID),
    path('createConD/',viewsConD.createConD),
    #Pressure
    path('getdataPressureALL/',viewsPressure.getdataPressureALL),
    path('getdataPressurebyID/<str:pk>/',viewsPressure.getdataPressurebyID),
    path('createPressure/',viewsPressure.createPressure),
    


]