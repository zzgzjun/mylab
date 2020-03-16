import xlrd
from django.shortcuts import render, redirect


# Create your views here.
# #############################样本类型增删改查#############################
from record.models import SpecimenType, ReasonCode


def specimentype(request):
    if not request.session.get('is_login', None):
        return redirect('/login/login')
    else:
        specimentype_list = SpecimenType.objects.all()
        return render(request, 'record/specimentype.html', locals())


def add_specimentype(request):
    if request.method == 'GET':
        last_specimentype_info = SpecimenType.objects.last()
        return render(request, 'record/add_specimentype.html', locals())
    else:
        specimen_type_index = request.POST.get('specimentype_index')
        specimen_type_name = request.POST.get('specimentype_name')

        new_specimentype = SpecimenType(specimen_type_index=specimen_type_index, specimen_type_name=specimen_type_name)
        new_specimentype.save()
        return redirect('/record/specimentype/')


def edit_specimentype(request):
    if request.method == 'GET':
        nid = request.GET.get('nid')
        specimentype_info = SpecimenType.objects.get(id=nid)
        return render(request, 'record/edit_specimentype.html', locals())
    else:
        nid = request.GET.get('nid')
        specimen_type_index = request.POST.get('specimen_type_index')
        specimen_type_name = request.POST.get('specimen_type_name')

        specimentype_info = SpecimenType.objects.get(id=nid)
        specimentype_info.specimen_type_index = specimen_type_index
        specimentype_info.specimen_type_name = specimen_type_name

        specimentype_info.save()
        return redirect('/record/specimentype/')


def del_specimentype(request):
    nid = request.GET.get('nid')
    specimentype_info = SpecimenType.objects.filter(id=nid)
    specimentype_info.delete()
    return redirect('/record/specimentype/')
# #############################样本类型增删改查##############################
# #############################原因代码增删改查#############################


def reasoncode(request):
    if not request.session.get('is_login', None):
        return redirect('/login/login')
    else:
        resoncode_list = ReasonCode.objects.all()
        return render(request, 'record/reasoncode.html', locals())


def add_reasoncode(request):
    if request.method == 'GET':
        last_reasoncode_info = SpecimenType.objects.last()
        return render(request, 'record/add_reasoncode.html', locals())
    else:
        reason_code = request.POST.get('reason_code')
        reason_name = request.POST.get('reason_name')

        new_reasoncode = SpecimenType(reason_code=reason_code, reasoncode_name=reason_name)
        new_reasoncode.save()
        return redirect('/record/reasoncode/')


def edit_reasoncode(request):
    if request.method == 'GET':
        nid = request.GET.get('nid')
        reasoncode_info = ReasonCode.objects.get(id=nid)
        return render(request, 'record/edit_reasoncode.html', locals())
    else:
        nid = request.GET.get('nid')
        reason_code = request.POST.get('reason_code')
        reason_name = request.POST.get('reason_name')

        reasoncode_info = SpecimenType.objects.get(id=nid)
        reasoncode_info.reason_code = reason_code
        reasoncode_info.reason_name = reason_name

        reasoncode_info.save()
        return redirect('/record/reasoncode/')


def del_reasoncode(request):
    nid = request.GET.get('nid')
    reasoncode_info = ReasonCode.objects.filter(id=nid)
    reasoncode_info.delete()
    return redirect('/record/reasoncode/')
# #############################原因代码增删改查#############################
# #############################不合格标本增删改查#############################


def record(request):
    return None


def add_record(request):
    return None


def edit_record(request):
    return None


def del_record(request):
    return None
# #############################不合格标本增删改查#############################
def excel(request):
    file1=request.POST.get('file1')
    xlsl=xlrd.open_workbook(file1)
    table=xlsl.sheet_by_index(0)
    print(table.cell_value(1,1))