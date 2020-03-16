from django.contrib import admin
from .models import User,ConfirmString
# 超级管理员账号：admin
# 邮箱：3168886316@qq.com
# 密码：gejinchen.com


class UserAdmin(admin.ModelAdmin):
    list_display = ['name','password','email','sex','c_time']
    list_filter = ['name','c_time']
    search_fields = ['name']
    list_per_page = 5


admin.site.register(User,UserAdmin)
admin.site.register(ConfirmString)