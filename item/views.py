from django.shortcuts import render, redirect


# Create your views here.
from item.models import Item, Unit


def str_to_bool(s):
    return True if s.lower() == 'true' else False


def item(request):
    if not request.session.get('is_login', None):
        return redirect('/item/item')
    else:
        item_list = Item.objects.all()
        return render(request, 'item/item.html', locals())


def add_item(request):
    if request.method == 'GET':
        last_item_info = Item.objects.last()
        unit_list=Unit.objects.all()
        return render(request, 'item/add_item.html', locals())
    else:
        item_index = request.POST.get('item_index')
        item_chinese_name = request.POST.get('item_chinese_name')
        item_english_name = request.POST.get('item_english_name')
        item_method = request.POST.get('item_method')
        item_unit = request.POST.get('item_unit')
        is_calc = request.POST.get('is_calc')
        is_use = request.POST.get('is_use')

        unit_info=Unit.objects.get(id=item_unit)
        new_item = Item(item_index=int(item_index), item_chinese_name=item_chinese_name,
                        item_english_name=item_english_name,item_method=item_method,item_unit=unit_info,is_calc=str_to_bool(is_calc),
                        is_use=str_to_bool(is_use))
        new_item.save()
        return redirect('/item/item/')


def edit_item(request):
    if request.method == 'GET':
        nid = request.GET.get('nid')
        item_info = Item.objects.get(id=nid)
        unit_list = Unit.objects.all()
        return render(request, 'item/edit_item.html', locals())
    else:
        nid = request.GET.get('nid')
        item_index = request.POST.get('item_index')
        item_chinese_name = request.POST.get('item_chinese_name')
        item_english_name = request.POST.get('item_english_name')
        item_method = request.POST.get('item_method')
        item_unit = request.POST.get('item_unit')
        is_calc = request.POST.get('is_calc')
        is_use = request.POST.get('is_use')

        unit_info = Unit.objects.get(id=item_unit)
        item_info = Item.objects.get(id=nid)
        item_info.item_index = item_index
        item_info.item_chinese_name = item_chinese_name
        item_info.item_english_name = item_english_name
        item_info.item_method = item_method
        item_info.item_unit = unit_info
        item_info.is_calc = str_to_bool(is_calc)

        item_info.is_use = str_to_bool(is_use)
        item_info.save()
        return redirect('/item/item/')


def del_item(request):
    nid = request.GET.get('nid')
    item_info = Unit.objects.filter(id=nid)
    item_info.delete()
    return redirect('/item/item/')


def unit(request):
    if not request.session.get('is_login', None):
        return redirect('/item/unit')
    else:
        unit_list = Unit.objects.all()
        return render(request, 'item/unit.html', locals())


def add_unit(request):
    if request.method == 'GET':
        last_unit_info = Unit.objects.last()
        return render(request, 'item/add_unit.html', locals())
    else:
        unit_index = request.POST.get('unit_index')
        unit_name = request.POST.get('unit_name')
        new_unit = Unit(unit_index=int(unit_index), unit_name=unit_name,)
        new_unit.save()
        return redirect('/item/unit/')


def edit_unit(request):
    if request.method == 'GET':
        nid = request.GET.get('nid')
        unit_info = Unit.objects.get(id=nid)
        return render(request, 'item/edit_unit.html', locals())
    else:
        nid = request.GET.get('nid')
        unit_index = request.POST.get('unit_index')
        unit_name = request.POST.get('unit_name')

        unit_info = Unit.objects.get(id=nid)
        unit_info.unit_index = unit_index
        unit_info.unit_name = unit_name

        unit_info.save()
        return redirect('/item/unit/')


def del_unit(request):
    nid = request.GET.get('nid')
    unit_info = Unit.objects.filter(id=nid)
    unit_info.delete()
    return redirect('/item/unit/')