# -*- coding: utf-8 -*-
from django.conf.urls import url
from .views import *

urlpatterns = [

    # 发布动态
    url(r'^publishDynamic/$',publishDynamicViews),
    url(r'^publishIdea/$',publishIdeaViews),

    # 初始的主页
    url(r'^indexHot$',indexHotViews),
    url(r'^indexLike/$',indexLikeViews),
    url(r'^indexRecommend/$',indexRecommendViews),
    # 登录后的主页
    url(r'^indexAfterLogin/$',indexAfterLoginViews),
    # 登录
    url(r'^login/$',loginViews),
    # 注册
    url(r'^register/$',registerViews),
    #用户协议
    url(r'^protocol/$', protocolViews),
    url(r'^discuss/(\d+)/$',discussViews,name='discuss'),
    # 退出
    url(r'^logOut/$',logOutViews),
    # 取消关注
    url(r'^cancelFollow/(\d+)/$',cancelFollowViews),
    #想法收藏
    url(r'^ideaCollection/(\d+)/$',ideaCollectionViews,name='ideaCollection'),
    # 以下新添加
    url(r'^person/personTrends/$',indexPersonTrendsViews),
    url(r'^person/personIdea/$',indexPersonIdeaViews),
    url(r'^person/personCollection/$',indexPersonCollectionViews),
    url(r'^person/personArticle/$',indexPersonArticleViews),
    url(r'^person/personFollow/$',indexPersonFollowViews),
    url(r'^person/editPerson/$',editPersonViews),
    url(r'^person/indexPerson/$',indexPerson),
    url(r'^person/likePerson/$',likePerson),
    url(r'^person/personRecommend/$',personRecommend),
]

urlpatterns +=[
    url(r'^indexComment/$',indexComment_views),
    url(r'^getComment/$',getComment_views),
    url(r'^switch/$',switch_views),
]