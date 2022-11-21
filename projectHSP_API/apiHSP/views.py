from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response

from .serializers import UsersSerializer
from .models import Users

# Create your views here.
@api_view(['GET'])
def getdataUsers(request):
    users1 = Users.objects.all()
    serializer = UsersSerializer(users1, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getdataUser(request, pk):
    user1 = Users.objects.get(id=pk)
    serializer = UsersSerializer(user1, many=False)
    return Response(serializer.data)


#login
@api_view(['GET'])
def getdataUserlogin(request, pk, pk1):
    user = Users.objects.all()
    for i in user:
        if i.email==pk or i.tel==pk:
            if i.password==pk1:
                id1 = i.id
                user1 = Users.objects.get(id=id1)
                serializer = UsersSerializer(user1, many=False)
                return Response(serializer.data)
            else:
                return Response('รหัสไม่ถูกต้อง')
        else:
            return Response('เบอร์หรืออีเมลไม่ถูกต้อง')






  


# @api_view(['GET'])
# def getdataUserlogin(request, pk, pk1):
#     username = request.POST['username']
#     password = request.POST['pass']
  
#   user=users.objects.all()
  
#   for i in user:
#     if i.email==username or i.username==username and i.password==password:
#       id = i.id
#       s = i.status_u
#       # img1 = i.images
    
#       # [id,username,fname,status]
#       # request.session['user']={'id':id,'user':username1,'fn':fname,'s':status}
      
#       request.session['id'] = id
#       request.session['sts'] = s
#       # request.session['img'] = img1
#       # request.session['user'] = username1
#       # request.session['fn'] = fname
#       # request.session['s'] = status
#       # # request.session['images'] = img
      
#       id1 = request.session['id']
#       sts = request.session['sts']
#       # img = request.session['img']
#       u=users.objects.raw('SELECT * FROM `pj1_users` WHERE id={}'.format(id1))
#       # u=users.objects.get(id=id)
#       products = Products.objects.all()
      
#       return render(request,'index.html',{
#       'u':u,
#       'pd':products,
#       'id':id,
#       'sts':sts,
#       # 'img':img
#       })
    
    
#   m.info(request,'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง')
#   return redirect('/loginto')






@api_view(['POST'])
def createUser(request):
    data = request.data
    emailc = data['email']
    telc = data['tel']
    if Users.objects.filter(email=emailc).exists():
        return Response('อีเมลนี้มีการลงทะเบียนแล้ว')
    elif Users.objects.filter(tel=telc).exists():
        return Response('เบอร์นี้มีการลงทะเบียนแล้ว')
    else:
        user = Users.objects.create(
            email = data['email'],
            sex = data['sex'],
            fullname = data['fullname'],
            lastname = data['lastname'],
            birthday = data['birthday'],
            tel = data['tel'],
            address = data['address'],
            blood_type = data['blood_type'],
            password = data['password']
        )
        serializer = UsersSerializer(user, many=False)
        return Response(serializer.data)

    


# def adduser(request):
#       ck = request.POST['ck']
#   if ck == '0':
#     form = FRegiter
#     if request.method == 'POST':
#       username = request.POST['username']
#       email = request.POST['email']
#       if users.objects.filter(username=username).exists():
#         m.info(request,'ชื่อผู้ใช้มีคนใช้แล้ว')
#         return redirect('/register')
#       elif users.objects.filter(email=email).exists():
#         m.info(request,'อีเมล์นี้มีคนใช้แล้ว')
#         return redirect('/register')
      
#       form = FRegiter(request.POST,request.FILES)
#       if form.is_valid():
#         form.save()
#         return redirect('/loginto')
#       return redirect('/register')
#     return redirect('/register')
#   else:
#     form = FRegiter
#     if request.method == 'POST':
#       username = request.POST['username']
#       email = request.POST['email']
#       if users.objects.filter(username=username).exists():
#         m.info(request,'ชื่อผู้ใช้มีคนใช้แล้ว')
#         return redirect('/register')
#       elif users.objects.filter(email=email).exists():
#         m.info(request,'อีเมล์นี้มีคนใช้แล้ว')
#         return redirect('/register')
      
#       form = FRegiter(request.POST,request.FILES)
#       if form.is_valid():
#         form.save()
#         return redirect('/showallusers')
#       return redirect('/register')
#     return redirect('/register')






@api_view(['PUT'])
def updateUser(request, pk):
    data = request.data
    user = Users.objects.get(id=pk)

    serializer = UsersSerializer(user, data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)



@api_view(['DELETE'])
def deleteUser(request, pk):
    user = Users.objects.get(id=pk)
    user.delete()
    return Response('ลบได้')
