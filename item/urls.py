from django.conf.urls import url
from . import views


urlpatterns = [
    # #############################项目增删改查#############################
    url(r'^item/', views.item),

    url(r'^add_item/', views.add_item),

    url(r'^edit_item/', views.edit_item),

    url(r'^del_item/', views.del_item),
    # #############################项目增删改查#############################
    # #############################项目单位增删改查#############################
    url(r'^unit/', views.unit),

    url(r'^add_unit/', views.add_unit),

    url(r'^edit_unit/', views.edit_unit),

    url(r'^del_unit/', views.del_unit),
    # ############################项目单位增删改查#############################

]