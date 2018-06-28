# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('articleID', models.AutoField(serialize=False, primary_key=True)),
                ('createData', models.DateField(auto_now_add=True)),
                ('contentURL', models.URLField()),
                ('articleTitle', models.CharField(max_length=30)),
                ('label', models.BinaryField(max_length=64)),
            ],
            options={
                'verbose_name_plural': '文章列表',
            },
        ),
        migrations.CreateModel(
            name='ArticleCollection',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('collectionArticle', models.ForeignKey(to='index.Article')),
            ],
        ),
        migrations.CreateModel(
            name='ArticleComment',
            fields=[
                ('articleCommentID', models.AutoField(serialize=False, primary_key=True)),
                ('commentContent', models.CharField(max_length=466)),
                ('commentTime', models.DateField()),
                ('commentArticle', models.ForeignKey(to='index.Article')),
            ],
            options={
                'verbose_name_plural': '文章评论表',
            },
        ),
        migrations.CreateModel(
            name='ArticleRecommend',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('recommendArticle', models.ForeignKey(to='index.Article')),
            ],
        ),
        migrations.CreateModel(
            name='ArticleThumbUp',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('likeArticle', models.ForeignKey(to='index.Article')),
            ],
        ),
        migrations.CreateModel(
            name='Dynamic',
            fields=[
                ('dynamicID', models.AutoField(serialize=False, primary_key=True)),
                ('content', models.TextField()),
                ('createData', models.DateField(auto_now_add=True)),
            ],
            options={
                'verbose_name_plural': '动态列表',
            },
        ),
        migrations.CreateModel(
            name='DynamicComment',
            fields=[
                ('dynamicCommentID', models.AutoField(serialize=False, primary_key=True)),
                ('commentContent', models.CharField(max_length=466)),
                ('commentTime', models.DateField()),
                ('commentDynamic', models.ForeignKey(to='index.Article')),
            ],
            options={
                'verbose_name_plural': '动态评论表',
            },
        ),
        migrations.CreateModel(
            name='DynamicThumbUp',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('likeDynamic', models.ForeignKey(to='index.Dynamic')),
            ],
        ),
        migrations.CreateModel(
            name='Idea',
            fields=[
                ('ideaID', models.AutoField(serialize=False, primary_key=True)),
                ('content', models.TextField()),
                ('createData', models.DateField()),
                ('label', models.BinaryField(max_length=64)),
            ],
            options={
                'verbose_name_plural': '想法列表',
            },
        ),
        migrations.CreateModel(
            name='IdeaCollection',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('collectionIdea', models.ForeignKey(to='index.Idea')),
            ],
        ),
        migrations.CreateModel(
            name='IdeaRecommend',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('recommendIdea', models.ForeignKey(to='index.Idea')),
            ],
        ),
        migrations.CreateModel(
            name='IdeaThumbUp',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('likeIdea', models.ForeignKey(to='index.Idea')),
            ],
        ),
        migrations.CreateModel(
            name='Person',
            fields=[
                ('personID', models.AutoField(serialize=False, primary_key=True)),
                ('personName', models.CharField(max_length=30)),
                ('personPassword', models.CharField(max_length=20)),
                ('personMobile', models.CharField(max_length=20)),
                ('personEmail', models.EmailField(max_length=50)),
                ('isActive', models.BooleanField(default=True)),
                ('enrollDate', models.DateField(auto_now_add=True)),
            ],
            options={
                'verbose_name_plural': '用户列表',
            },
        ),
        migrations.CreateModel(
            name='PersonFollow',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('followee', models.ForeignKey(related_name='followee_person', to='index.Person')),
                ('follower', models.ForeignKey(related_name='follower_person', to='index.Person')),
            ],
            options={
                'verbose_name_plural': '关注列表',
            },
        ),
        migrations.AddField(
            model_name='ideathumbup',
            name='likeUser',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='idearecommend',
            name='recommendrecommendUser',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='ideacollection',
            name='collectionUser',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='idea',
            name='sender',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='dynamicthumbup',
            name='likeUser',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='dynamiccomment',
            name='commentUser',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='dynamic',
            name='sender',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='articlethumbup',
            name='likeUser',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='articlerecommend',
            name='recommendtUser',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='articlecomment',
            name='commentUser',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='articlecollection',
            name='collectionUser',
            field=models.ForeignKey(to='index.Person'),
        ),
        migrations.AddField(
            model_name='article',
            name='sender',
            field=models.ForeignKey(to='index.Person'),
        ),
    ]
