from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import authenticate
from .models import *

def login_views(request):
    if request.method == 'GET':
        return render(request,'login.html',locals())

    else:
        personName = request.POST.get('uname')
        personPassword = request.POST.get('upwd')
        
        vuser = Person.objects.filter(personName=personName,personPassword=personPassword)
        if vuser:
            return HttpResponse('login successfully')
        return HttpResponse('login failed!')

