import datetime

from django.shortcuts import render, redirect


# Create your views here.
from company.models import Company, Employee
from instrument.models import Instrument


def instrument(request):
    if not request.session.get('is_login', None):
        return redirect('/login/login')
    else:
        instrument_list = Instrument.objects.all()
        return render(request, 'instrument/instrument.html', locals())


def add_instrument(request):
    # return render(request, 'instrument/add_instrument.html')
    if request.method == 'GET':
        last_instrument_info=Instrument.objects.last()
        company_list = Company.objects.all()
        employee_list = Employee.objects.all()
        return render(request, 'instrument/add_instrument.html', locals())
    else:
        instrument_index = request.POST.get('instrument_index')
        instrument_name = request.POST.get('instrument_name')
        instrument_status = request.POST.get('instrument_status')

        instrument_manager = request.POST.get('instrument_manager')
        instrument_manager_info = Employee.objects.get(id=instrument_manager)

        date_str = request.POST.get('instrument_start_date')
        date_info=datetime.datetime.strptime(date_str,'%Y-%m-%d').date()

        instrument_company = request.POST.get('instrument_company')
        company_info=Company.objects.get(id=instrument_company)

        new_instrument = Instrument(instrument_index=int(instrument_index), instrument_name=instrument_name,instrument_status=instrument_status,instrument_manager=instrument_manager_info,instrument_start_date=date_info,instrument_company=company_info,)
        new_instrument.save()
        return redirect('/instrument/instrument/')


def edit_instrument(request):
    if request.method == 'GET':
        nid = request.GET.get('nid')
        instrument_info = Instrument.objects.get(id=nid)
        employee_list = Employee.objects.all()
        company_list = Company.objects.all()
        return render(request, 'instrument/edit_instrument.html', locals())
    else:
        nid = request.GET.get('nid')
        instrument_index = request.POST.get('instrument_index')
        instrument_name = request.POST.get('instrument_name')
        instrument_status = request.POST.get('instrument_status')

        instrument_manager = request.POST.get('instrument_manager')
        instrument_manager_info = Employee.objects.get(id=instrument_manager)

        date_str = request.POST.get('instrument_start_date')
        date_info = datetime.datetime.strptime(date_str, '%Y-%m-%d').date()

        instrument_company = request.POST.get('instrument_company')
        company_info = Company.objects.get(id=instrument_company)

        instrument_info = Instrument.objects.get(id=nid)
        instrument_info.instrument_index=instrument_index
        instrument_info.instrument_name=instrument_name
        instrument_info.instrument_status=instrument_status
        instrument_info.instrument_manager=instrument_manager_info
        instrument_info.instrument_start_date=date_info
        instrument_info.instrument_company=company_info

        instrument_info.save()
        return redirect('/instrument/instrument/')


def del_instrument(request):
    nid = request.GET.get('nid')
    instrument_info = Instrument.objects.filter(id=nid)
    instrument_info.delete()
    return redirect('/instrument/instrument/')