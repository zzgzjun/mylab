from django.contrib import admin

# Register your models here.
from .models import Unit,Item,ItemRefference


class UnitAdmin(admin.ModelAdmin):
    list_display = ['pk','unit_index','unit_name']
    list_filter = ['unit_name']
    search_fields = ['unit_name']
    list_per_page = 5


class ItemAdmin(admin.ModelAdmin):
    list_display = ['pk','item_index','item_chinese_name','item_english_name','item_method','item_unit','is_calc','is_use']
    list_filter = ['item_chinese_name','item_english_name']
    search_fields = ['item_english_name']
    list_per_page = 5


class ItemRefferenceAdmin(admin.ModelAdmin):
    list_display = ['pk','item_id','is_default','gender','start_age','end_age','age_unit','ref_low','ref_high']
    list_filter = ['item_id']
    search_fields = ['item_id']
    list_per_page = 5


admin.site.register(Unit,UnitAdmin)
admin.site.register(Item,ItemAdmin)
admin.site.register(ItemRefference,ItemRefferenceAdmin)