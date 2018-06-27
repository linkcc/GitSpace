from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import authenticate
from django.contrib.auth.hashers import make_password, check_password
from .models import *

def login_views(request):
    if request.method == 'GET':
        return render(request,'login2.html',locals())

    else:
        personName = request.POST.get('uname')
        personPassword = request.POST.get('upwd')
        
        vuser = Person.objects.filter(personName=personName,personPassword=personPassword)
        if vuser:
            return HttpResponse('login successfully')
        return HttpResponse('login failed!')

def register_views(request):
    if request.method == 'GET':
        return render(request, 'register.html', locals())
    else:
        personName = request.POST.get('uname')
        personPassword = request.POST.get('upwd')
        checkPassword = request.POST.get('upwd2')
        finalPassword = make_password(personPassword)
        personMobile = request.POST.get('umob')
        personEmail = request.POST.get('umail')
        
        if personPassword == "":
            return HttpResponse("Valid Password!")
        else:
            if personPassword != checkPassword:
                return HttpResponse("Wrong Check Password!")
            else:
                newuser = Person.objects.create(personName=personName,personPassword=finalPassword,personMobile=personMobile,personEmail=personEmail,isActive=1)
                return HttpResponse("register successfully!")
        


