
from django.shortcuts import render,redirect


# Create your views here.
from django.views.generic import View

from company.models import Company,Department,Employee,EmployeeDetail


# #############################单位增删改查#############################
def company(request):
    if not request.session.get('is_login', None):
        return redirect('/login/login')
    else:
        company_list = Company.objects.all()
        return render(request, 'company/company.html', locals())


# def add_company(request):
#     if request.method == 'GET':
#         last_company_info = Company.objects.last()
#         return render(request, 'company/add_company.html', locals())
#     else:
#         company_index = request.POST.get('company_index')
#         company_name = request.POST.get('company_name')
#         company_address = request.POST.get('company_address')
#         new_company = Company(company_index=int(company_index), company_name=company_name, company_address=company_address)
#         new_company.save()
#         return redirect('/company/company/')


class CompanyView(View):
    def get(self, request,*args,**kwargs):
        last_company_info = Company.objects.last()
        return render(request, 'company/add_company.html', locals())

    def post(self, request, *args,**kwargs):
        company_index = request.POST.get('company_index')
        company_name = request.POST.get('company_name')
        company_address = request.POST.get('company_address')
        new_company = Company(company_index=int(company_index), company_name=company_name,
                              company_address=company_address)
        new_company.save()
        return redirect('/company/company/')


def edit_company(request):
    if request.method == 'GET':
        nid = request.GET.get('nid')
        company_info = Company.objects.get(id=nid)
        return render(request, 'company/edit_company.html', locals())
    else:
        nid = request.GET.get('nid')
        company_index = request.POST.get('company_index')
        company_name = request.POST.get('company_name')
        company_address = request.POST.get('company_address')

        company_info = Company.objects.get(id=nid)
        company_info.company_index = company_index
        company_info.company_name = company_name
        company.company_address = company_address
        company_info.save()
        return redirect('/company/company/')


def del_company(request):
    nid = request.GET.get('nid')
    company_info = Company.objects.filter(id=nid)
    company_info.delete()
    return redirect('/company/company/')
# #############################单位增删改查#############################


# #############################部门增删改查#############################

def department(request):
    department_list = Department.objects.all()
    return render(request, 'company/department.html', locals())


def add_department(request):
    if request.method == 'GET':
        last_department_info = Department.objects.last()
        company_list=Company.objects.all()
        return render(request, 'company/add_department.html', locals())
    else:
        department_index = request.POST.get('department_index')
        department_name = request.POST.get('department_name')
        department_position = request.POST.get('department_position')
        belong_company=request.POST.get('belong_company')
        company_info=Company.objects.get(id=belong_company)
        new_department = Department(department_index=int(department_index), department_name=department_name,department_position=department_position,belong_company=company_info)
        new_department.save()
        return redirect('/company/department/')


def edit_department(request):
    if request.method == 'GET':
        nid=request.GET.get('nid')
        department_info = Department.objects.get(id=nid)
        company_list = Company.objects.all()
        return render(request, 'company/edit_department.html', locals())
    else:
        nid=request.GET.get('nid')
        department_index = request.POST.get('department_index')
        department_name = request.POST.get('department_name')
        department_position = request.POST.get('department_position')
        belong_company = request.POST.get('belong_company')

        company_info = Company.objects.get(id=belong_company)
        department_info=Department.objects.get(id=nid)
        department_info.department_index=department_index
        department_info.department_name=department_name
        department_info.department_position=department_position
        department_info.belong_company=company_info
        department_info.save()
        return redirect('/company/department/')


def del_department(request):
    nid = request.GET.get('nid')
    department_info = Department.objects.filter(id=nid)
    department_info.delete()
    return redirect('/company/department/')
# #############################部门增删改查#############################


# #############################员工增删改查#############################
def employee(request):
    employee_list = Employee.objects.all()
    return render(request, 'company/employee.html', locals())


def add_employee(request):
    if request.method == 'GET':
        last_employee_info = Employee.objects.last()
        company_list = Company.objects.all()
        department_list=Department.objects.all()
        return render(request, 'company/add_employee.html', locals())
    else:
        employee_index = request.POST.get('employee_index')
        employee_name = request.POST.get('employee_name')
        employee_gender = request.POST.get('employee_gender')
        employee_telephone = request.POST.get('employee_telephone')
        belong_department = request.POST.get('belong_department')

        department_info = Department.objects.get(id=belong_department)

        new_employee = Employee(employee_index=int(employee_index), employee_name=employee_name,
                                    employee_gender=employee_gender, employee_telephone=employee_telephone,
                                     belong_department=department_info)
        new_employee.save()
        return redirect('/company/employee/')


def edit_employee(request):
    if request.method == 'GET':
        nid = request.GET.get('nid')
        employee_info = Employee.objects.get(id=nid)
        company_list = Company.objects.all()
        department_list = Department.objects.all()
        return render(request, 'company/edit_employee.html', locals())
    else:
        employee_index = request.POST.get('employee_index')
        employee_name = request.POST.get('employee_name')
        employee_gender = request.POST.get('employee_gender')
        employee_telephone = request.POST.get('employee_telephone')
        belong_department = request.POST.get('belong_department')

        department_info = Department.objects.get(id=belong_department)
        employee_info=Employee.objects.get(employee_index=employee_index)
        employee_info.employee_name=employee_name
        employee_info.employee_gender=employee_gender
        employee_info.employee_telephone=employee_telephone
        employee_info.belong_department=department_info

        #
        # new_employee = Employee(employee_index=int(employee_index), employee_name=employee_name,
        #                         employee_gender=employee_gender, employee_telephone=employee_telephone,
        #                         belong_department=department_info)
        employee_info.save()
        return redirect('/company/employee/')


def del_employee(request):
    nid = request.GET.get('nid')
    employee_info = Employee.objects.filter(id=nid)
    employee_info.delete()
    return redirect('/company/employee/')
# #############################员工增删改查#############################