from django.conf.urls import url
from . import views


urlpatterns = [
    # #############################单位增删改查#############################
    url(r'^instrument/', views.instrument),

    url(r'^add_instrument/', views.add_instrument),

    url(r'^edit_instrument/', views.edit_instrument),

    url(r'^del_instrument/', views.del_instrument),
    # #############################单位增删改查#############################

]