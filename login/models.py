import os
import uuid
from django.db import models


# Create your models here.
def user_directory_path(instance, filename):
    ext=filename.split('.')[-1]
    filename='{}.{}'.format(uuid.uuid4().hex[:8], ext)
    sub_folder = 'file'
    if ext.lower() in ["jpg", "png", "gif"]:
        sub_folder = "avatar"
    if ext.lower() in ["pdf", "docx"]:
        sub_folder = "document"
    return os.path.join(instance.name, sub_folder,'touxiang', filename)


class User(models.Model):
    gender = (
        ('male', "男"),
        ('female', "女"),
    )
    name = models.CharField(max_length=128, verbose_name='用户名', db_column='name', unique=True)
    password = models.CharField(max_length=256,verbose_name='密码',db_column='password')
    email = models.EmailField(verbose_name='邮箱',db_column='email',unique=True)
    sex = models.CharField(max_length=32, choices=gender, default="男",verbose_name='性别',db_column='sex')
    c_time = models.DateTimeField(auto_now_add=True)
    has_confirmed=models.BooleanField(default=False,verbose_name='邮件确认',db_column='has_confirmed')
    user_img = models.ImageField(null=True, blank=True, upload_to=user_directory_path, verbose_name="头像",db_column='user_img')

    def __str__(self):
        return self.name

    class Meta:
        ordering = ["-c_time"]
        verbose_name = "用户"
        verbose_name_plural = "用户"


class ConfirmString(models.Model):
    code = models.CharField(max_length=256,verbose_name='注册码',db_column='code')
    user = models.OneToOneField('User',verbose_name='用户',db_column='user')
    c_time = models.DateTimeField(auto_now_add=True,verbose_name='注册时间',db_column='c_time')

    def __str__(self):
        return self.user.name + ":   " + self.code

    class Meta:
        ordering = ["-c_time"]
        verbose_name = "确认码"
        verbose_name_plural = "确认码"