from django.conf.urls import url
from . import views


urlpatterns = [
    # #############################单位增删改查#############################
    # url(r'^company/', views.company),
    url(r'^company/', views.company),

    # url(r'^add_company/', views.add_company),
    url(r'^add_company/', views.CompanyView.as_view()),

    url(r'^edit_company/', views.edit_company),

    url(r'^del_company/', views.del_company),
    # #############################单位增删改查#############################
    # #############################部门增删改查#############################
    url(r'^department/', views.department),
    url(r'^add_department/', views.add_department),
    url(r'^edit_department/', views.edit_department),
    url(r'^del_department/', views.del_department),
    # #############################部门增删改查#############################
    # #############################员工增删改查#############################
    url(r'^employee/', views.employee),
    url(r'^add_employee/', views.add_employee),
    url(r'^edit_employee/', views.edit_employee),
    url(r'^del_employee/', views.del_employee),
    # #############################员工增删改查#############################

]