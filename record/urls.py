from django.conf.urls import url
from . import views


urlpatterns = [
    # #############################记录增删改查#############################
    url(r'^record/', views.record),

    url(r'^add_record/', views.add_record),

    url(r'^edit_record/', views.edit_record),

    url(r'^del_record/', views.del_record),
    # #############################记录增删改查#############################
    # #############################样本类型增删改查#############################
    url(r'^specimentype/', views.specimentype),

    url(r'^add_specimentype/', views.add_specimentype),

    url(r'^edit_specimentype/', views.edit_specimentype),

    url(r'^del_specimentype/', views.del_specimentype),
    # #############################样本类型增删改查#############################
    # #############################原因代码增删改查#############################
    url(r'^reason_code/', views.reasoncode),

    url(r'^add_reasoncode/', views.add_reasoncode),

    url(r'^edit_reasoncode/', views.edit_reasoncode),

    url(r'^del_reasoncode/', views.del_reasoncode),
    # #############################原因代码增删改查#############################
    url(r'^excel/', views.excel),

]