# -*- coding: utf-8 -*-
from django.contrib import admin
from .models import *

# Register your models here.

admin.site.register(Person)
admin.site.register(Dynamic)
admin.site.register(Idea)
admin.site.register(Article)
admin.site.register(PersonFollow)
admin.site.register(DynamicComment)
admin.site.register(ArticleComment)


admin.site.register(ArticleThumbUp)
admin.site.register(DynamicThumbUp)
admin.site.register(IdeaThumbUp)
admin.site.register(ArticleRecommend)
admin.site.register(IdeaRecommend)
admin.site.register(IdeaCollection)
admin.site.register(ArticleCollection)
