from django.urls import path
from . import views 

urlpatterns = [
    # path('',),
    path('getUsers/',views.getdataUsers),
    path('create/',views.createUser),
    path('update/<str:pk>/',views.updateUser),
    path('delete/<str:pk>/',views.deleteUser),
    path('getUsers/<str:pk>/',views.getdataUser),
    path('getUsers/<str:pk>/<str:pk1>/',views.getdataUserlogin),
]