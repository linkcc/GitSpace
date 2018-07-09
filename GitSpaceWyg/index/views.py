# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from datetime import datetime
from django.contrib.auth import authenticate
from django.contrib.auth.hashers import make_password, check_password
from .models import *
from django.contrib import messages
import os
import json


def publishDynamicViews(request): 
    dynamicContent = request.POST['dynamicContent']
    person = Person.objects.get(personID=request.session.get('personID'))
    Dynamic.objects.create(sender=person,content=dynamicContent,createDate=datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    return HttpResponseRedirect('/indexAfterLogin/')


def publishIdeaViews(request):

    ideaContent = request.POST['ideaContent']
    label1 = request.POST['label1']
    label2 = request.POST['label2'].encode('utf-8')
    print ('label:',label1,':',label2)
    dic1 = {
    'java':1,
    'c':2,
    'c++':4,
    'python':8
    }
    dic2 = {
    '大数据':16,
    '人工智能':32,
    '游戏开发':64,
    '编程学习':128
    }
    person = Person.objects.get(personID=request.session.get('personID'))
    Idea.objects.create(
        sender=person,
        content=ideaContent,
        createDate=datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
        label=(dic1[label1]|dic2[label2]),
    )    
    return HttpResponseRedirect('/indexAfterLogin')


def indexHotViews(request):
    if 'personID' in request.session:
        person = Person.objects.get(personID=request.session.get('personID'))
        dynamicList = Dynamic.objects.all()
        ideaList = Idea.objects.all()
        articleLsit = Article.objects.all()

        articleCommentList = ArticleComment.objects.all()[::-1]
        num = len(articleCommentList)
    return render(request,'indexHot.html',locals())

def indexLikeViews(request):
    if 'personID' in request.session:
        person = Person.objects.get(personID=request.session.get('personID'))
    return render(request,'indexLike.html',locals())

def indexRecommendViews(request):
    if 'personID' in request.session:
        person = Person.objects.get(personID=request.session.get('personID'))
    return render(request,'indexRecommend.html',locals())

def indexAfterLoginViews(request):
        return HttpResponseRedirect('/indexHot/')

def loginViews(request):
    if request.method == 'GET':
        return render(request,'login.html')

    else:
        personName = request.POST.get('uname')
        personPassword = request.POST.get('upwd') 

        vuser = Person.objects.filter(personName=personName)

        if vuser:
            if check_password(personPassword, vuser[0].personPassword):
                request.session['personID']=vuser[0].personID
                # print(request.session.get('personID'))
                if request.POST.get('isSave'):
                    request.COOKIES['uname'] = personName
                    request.COOKIES['upwd'] = personPassword
                return HttpResponseRedirect('/indexAfterLogin')
        messages.add_message(request,messages.ERROR,'用户名或密码不正确')
        return HttpResponseRedirect('/login')

def registerViews(request):
    if request.method == 'GET':
        return render(request, 'register.html')
    else:
        personName = request.POST.get('uname')
        personPassword = request.POST.get('upwd')
        checkPassword = request.POST.get('upwd2')
        finalPassword = make_password(personPassword)
        personMobile = request.POST.get('umobile')
        personEmail = request.POST.get('uemail')
        
        vuser = Person.objects.filter(personName=personName)
        if vuser:
            messages.add_message(request,messages.ERROR,'Repeat of user name')
            return HttpResponseRedirect('/register/')
        if personPassword == "":
            messages.add_message(request,messages.ERROR,'Valid Password!')
            return HttpResponseRedirect('/register/')
        if len(personPassword) < 6:
            messages.add_message(request,messages.ERROR,'Password is less than 6 characters!')
            return HttpResponseRedirect('/register/')
        else:
            if personPassword != checkPassword:
                messages.add_message(request,messages.ERROR,'Wrong Check Password!')
                return HttpResponseRedirect('/register/')
            else:
                newuser = Person.objects.create(personName=personName,personPassword=finalPassword,personMobile=personMobile,personEmail=personEmail,isActive=True,personInfo='我是古天乐。',personImage='/imgs/head.png')
                request.session['personID'] = newuser.personID
                return HttpResponseRedirect('/indexAfterLogin')

def protocolViews(request):
    return render(request,'protocol.html')

def discussViews(request,ideaID):
    if request.method == 'GET':
        return render(request,'discuss.html')
    else:
        return render(request,'discuss.html')
# 以下是更新的内容

def indexPersonTrendsViews(request):
    if 'personID' in request.session:
        personID=request.session.get('personID')
        person = Person.objects.get(personID = personID)
        dynamicList = Dynamic.objects.filter(sender=person)

        # dynamicID = request.POST.get('dynamicID')
        dynamicCommentList = DynamicComment.objects.all()[::-1]
        num = len(dynamicCommentList)
        return render(request,'person/indexPersonTrends.html',locals())
    else:
        return HttpResponseRedirect('/indexHot')

def indexPersonIdeaViews(request):
    if 'personID' in request.session:
        personID=request.session.get('personID')
        person = Person.objects.get(personID=personID)
        ideaList = Idea.objects.filter(sender=personID)
        return render(request,'person/indexPersonIdea.html',locals())
    else:
        return HttpResponseRedirect('/indexHot')

def indexPersonCollectionViews(request):
    if 'personID' in request.session:
        person = Person.objects.get(personID=request.session.get('personID'))
        ideaCollectionList = IdeaCollection.objects.filter(collectionUser=person)
        return render(request,'person/indexPersonCollection.html',locals())
    else:
        return HttpResponseRedirect('/indexHot')

def indexPersonArticleViews(request):
    if 'personID' in request.session:
        person = Person.objects.get(personID=request.session.get('personID'))
        return render(request,'person/indexPersonArticle.html',{'person':person})
    else:
        return HttpResponseRedirect('/indexHot')

def indexPersonFollowViews(request):
    if 'personID' in request.session:
        follower = Person.objects.get(personID=request.session.get('personID'))
        presonFollowList = PersonFollow.objects.filter(follower=follower)
        return render(request,'person/indexPersonFollow.html',{'presonFollowList':presonFollowList,'person':follower})
    else:
        return HttpResponseRedirect('/indexHot')

def personRecommend(request):

    if 'personID' in request.session:
        personID=request.session.get('personID')
        person = Person.objects.get(personID = personID)
        print person
        dynamicList = Dynamic.objects.filter(sender=person)
        print dynamicList
        return render(request,'person/indexPersonRecommend.html',locals())
    else:
        return HttpResponseRedirect('/indexHot')

def logOutViews(request):
    del request.session['personID']
    return HttpResponseRedirect('/indexHot')


def followViews(request):
    return render(request,'person/follow.html')

def editPersonViews(request):
    if 'personID' in request.session:
    # print(request.session.get('personID'))
        person = Person.objects.get(personID=request.session.get('personID'))
        if request.method == 'GET':
            return render(request,'person/editPerson.html',locals())
        else:
            person.sex = request.POST.get('userSex')
            person.personMobile = request.POST.get('userMobile')
            person.personEmail = request.POST.get('userEmail')
            obj = request.FILES['userImage']
            f = open(os.getcwd()+'/index/static/imgs'+obj.name,'wb+')
            for chunk in obj.chunks():
                f.write(chunk)
            f.close()
            person.personImage = '/imgs'+obj.name
            person.personInfo = request.POST.get('userInfo')
            person.save()
            return HttpResponseRedirect('/person/indexPerson/')
    else:
        return HttpResponseRedirect('/indexHot')

def indexPerson(request):
    if 'personID' in request.session:
        person = Person.objects.get(personID=request.session.get('personID'))
        return render(request,'person/indexPerson.html',{'person':person})
    else:
        return HttpResponseRedirect('/indexHot')

def likePerson(request):
    return render(request,'person/likePerson.html')


    

def cancelFollowViews(request,followeeID):
    follower = Person.objects.get(personID=request.session.get('personID'))
    followee = Person.objects.get(personID=followeeID)
    PersonFollow.objects.get(follower=follower,followee=followee).delete()
    return HttpResponseRedirect('/person/personFollow/')

def ideaCollectionViews(request,ideaID):
    if 'personID' in request.session:
        user = Person.objects.get(personID=request.session.get('personID'))
        idea = Idea.objects.get(ideaID = ideaID)
        # print('23333')
        if user.personID != idea.sender.personID:
            IdeaCollection.objects.create(collectionUser=user,collectionIdea=idea)
        return HttpResponseRedirect('/indexAfterLogin')
    else:
        return HttpResponseRedirect('/indexAfterLogin')
def articleCollectionViews(request,articleID):
    if 'personID' in request.session:
        user = Person.objects.get(personID=request.session.get('personID'))
        article = Article.objects.get(articleID = articleID)
        if user.personID != article.sender.personID:
            IdeaCollection.objects.create(collectionUser=user,collectionArticle=article)
        return render(request,'/indexAfterLogin')
    else:
        return HttpResponseRedirect('/login/')    


def indexComment_views(request):
    switch = request.POST.get('switch')

    if 1==2:
        # 文章评论
        articleCommentList = ArticleComment.objects.all()[::-1]
        num = len(articleCommentList)

        person = Person.objects.get(personID=request.session.get('personID'))
        ucommentArticle = Article.objects.get(articleID=ID)
        upcomment = request.POST.get('ucomment')
        ucommentTime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        ArticleComment.objects.create(
                commentUser=person,
                commentArticle=ucommentArticle,
                commentContent=upcomment,
                commentTime=ucommentTime)
        return HttpResponseRedirect('/indexHot/')
    elif switch=='dynamicComment':
        # 动态评论
        dynamicID = request.POST.get('dynamicID')
        print dynamicID
        dynamic = Dynamic.objects.get(dynamicID=dynamicID)

        person = Person.objects.get(personID=request.session.get('personID')) 
        upcomment = request.POST.get('ucomment')
        ucommentTime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        DynamicComment.objects.create(
            commentContent = upcomment,
            commentUser = person,
            commentDynamic = dynamic,
            commentTime = ucommentTime
            )
        result = 1
        return HttpResponse(json.dumps({
                "result": result
            }))
        # return HttpResponseRedirect('/person/personTrends/')

def getComment_views(request):
    
    ucommentDynamic = Dynamic.objects.get(dynamicID=dynamicID)
    DynamicCommentList = DynamicComment.objects.filter(commentDynamic=ucommentDynamic)[::-1]
    num = len(DynamicCommentList)
    return HttpResponseRedirect('/person/personTrends/')

def switch_views(request):
    
    switch = request.POST.get('switch')


    # ----------------------------动态点赞------------------------------------
    if switch == 'dynamicThumUp':

        # 判断动态是否已点赞
        result = 0

        dynamicID = request.POST.get('dynamicID')
        person = Person.objects.get(personID=request.session.get('personID')) 

        dynamic = Dynamic.objects.get(dynamicID = dynamicID)
        sender = dynamic.sender.personName

        try :
            dynamicThumbUp = DynamicThumbUp.objects.filter(likeDynamic=dynamic)
            for user in dynamicThumbUp:
                if user.likeUser == person : 
                    result = 1
        except: 
            result = 0

        if result == 0:
            # 没有点赞过就完成点赞
            DynamicThumbUp.objects.create(
                    likeUser = person,
                    likeDynamic = dynamic
                    )
        
        # result 0:点赞成功;1：已点赞
        return HttpResponse(json.dumps({
                "result": result
            }))
        
    # ----------------------------文章点赞------------------------------------
    elif switch == 'articleThumbUp':
       # 判断文章是否已点赞
        result = 0

        articleID = request.POST.get('articleID')
        person = Person.objects.get(personID=request.session.get('personID')) 

        article = Article.objects.get(articleID = articleID)
        sender = article.sender.personName

        try :
            articleThumbUp = ArticleThumbUp.objects.filter(likeArticle=article)
            for user in articleThumbUp:
                if user.likeUser == person : 
                    result = 1
        except: 
            result = 0

        if result == 0:
            # 没有点赞过就完成点赞
            ArticleThumbUp.objects.create(
                    likeUser = person,
                    likeArticle = article
                    )
        # result 0:点赞成功;1：已点赞
        return HttpResponse(json.dumps({
                "result": result
            }))
        

    # ----------------------------想法点赞------------------------------------
    elif switch == 'ideaThumbUp':
        # 判断想法是否已点赞
        result = 0

        ideaID = request.POST.get('ideaID')
        person = Person.objects.get(personID=request.session.get('personID')) 

        idea = Idea.objects.get(ideaID = ideaID)
        sender = Idea.sender.personName

        try :
            ideaThumbUp = IdeaThumbUp.objects.filter(likeIdea=idea)
            for user in ideaThumbUp:
                if user.likeUser == person : 
                    result = 1
        except: 
            result = 0

        if result == 0:
            # 没有点赞过就完成点赞
            IdeaThumbUp.objects.create(
                    likeUser = person,
                    likeIdea = idea
                    )
        # result 0:点赞成功;1：已点赞
        return HttpResponse(json.dumps({
                "result": result
            }))

    # ----------------------------文章收藏------------------------------------
    elif switch == 'articleCollection':
        # 判断文章是否已收藏
        result = 0

        articleID = request.POST.get('articleID')
        person = Person.objects.get(personID=request.session.get('personID')) 

        article = Article.objects.get(articleID = articleID)
        sender = article.sender.personName

        try :
            articleCollection = ArticleCollection.objects.filter(collectionArticle=article)
            for user in articleCollection:
                if user.collectionUser == person : 
                    result = 1
        except: 
            result = 0

        if result == 0:
            # 没有收藏过就完成收藏
            ArticleCollection.objects.create(
                    collectionUser = person,
                    collectionArticle = article
                    )
        # result 0:收藏成功;1：已收藏
        return HttpResponse(json.dumps({
                "result": result
            }))

    # ----------------------------想法收藏------------------------------------
    elif switch == 'ideaCollection':
        # 判断想法是否已收藏
        result = 0

        ideaID = request.POST.get('ideaID')
        person = Person.objects.get(personID=request.session.get('personID')) 

        idea = Idea.objects.get(ideaID = ideaID)
        sender = Idea.sender.personName

        try :
            ideaCollection = IdeaCollection.objects.filter(collectionIdea=idea)
            for user in ideaCollection:
                if user.collectionUser == person : 
                    result = 1
        except: 
            result = 0

        if result == 0:
            # 没有收藏过就完成收藏
            IdeaThumbUp.objects.create(
                    collectionUser = person,
                    collectionIdea = idea
                    )
        # result 0:收藏成功;1：已收藏
        return HttpResponse(json.dumps({
                "result": result
            }))

    # ----------------------------动态评论------------------------------------
    elif switch == 'dynamicComment':
        # 动态评论
        dynamicID = request.POST.get('dynamicID')
        dynamic = Dynamic.objects.get(dynamicID=dynamicID)
        dynamicCommentList = DynamicComment.objects.filter(commentDynamic=dynamic)[::-1]
        num = len(dynamicCommentList)
        

        if num>0:

            dynamicComment = []
            for tem in range(num):
                dic = {}
                dic['commentUser'] = dynamicCommentList[tem].commentUser.personName
                dic['commentContent'] = dynamicCommentList[tem].commentContent 
                dic['commentTime'] = dynamicCommentList[tem].commentTime.strftime('%Y-%m-%d %H:%M:%S')

                dynamicComment.append(dic)
            
        else:
            dynamicComment = []



        return HttpResponse(json.dumps({
                "dynamicComment":dynamicComment,
                "num":num
            }))
    else:
        return HttpResponse('error')

