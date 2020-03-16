import os
import uuid

from django.db import models
from django.db.models import BooleanField as _BooleanField

# Create your models here.


class BooleanField(_BooleanField):
    def get_prep_value(self, value):
        if value in ("0", "false", "False"):
            return False
        elif value in ("1", "true", "True"):
            return True
        else:
            return super(BooleanField, self).get_prep_value(value)


# 单位信息表
class Company(models.Model):
    company_index = models.IntegerField(default=12, verbose_name='单位编号', db_column='company_index')
    company_name=models.CharField(max_length=50,verbose_name='单位名称',db_column='company_name', unique=True)
    company_address=models.CharField(max_length=50,verbose_name='单位地址',db_column='company_address')

    def __str__(self):
        return self.company_name

    class Meta:
        ordering=['company_index']
        verbose_name='单位名称'
        verbose_name_plural=verbose_name
        db_table='company'


# 部门信息表
class Department(models.Model):
    department_index=models.IntegerField(default=12,verbose_name='部门编号',db_column='department_index')
    department_name = models.CharField(max_length=50, verbose_name='部门名称', db_column='department_name')
    department_position = models.CharField(max_length=50, verbose_name='部门位置', db_column='department_position')
    belong_company = models.ForeignKey(Company,verbose_name='单位名称',db_column='belong_company')

    def __str__(self):
        return self.department_name

    class Meta:
        ordering=['department_index']
        verbose_name = '部门名称'
        verbose_name_plural = verbose_name
        db_table = 'department'


# 员工信息表
class Employee(models.Model):
    GENDER_CHOICES = (
        ('M', '男'),
        ('F', '女'),
        ('U', '不详'),
    )
    employee_index = models.CharField(max_length=20, verbose_name='员工编号', db_column='employee_index',unique=True)
    employee_name = models.CharField(max_length=10, verbose_name='员工姓名', db_column='employee_name')
    employee_gender = models.CharField(max_length=10,choices=GENDER_CHOICES, db_column='employee_gender', verbose_name='员工姓别')
    employee_telephone = models.CharField(max_length=20, verbose_name='联系电话', db_column='employee_telephone')
    belong_department = models.ForeignKey(Department,verbose_name='所属部门',db_column='belong_department', blank=True, null=True)

    def __str__(self):
        return self.employee_name

    class Meta:
        ordering = ['employee_index']
        verbose_name = '员工信息'
        verbose_name_plural = verbose_name
        db_table = 'employee'


# 专业名称
class Professional(models.Model):
    professional_name=models.CharField(max_length=50,verbose_name='专业名称',db_column='pro_name')

    def __str__(self):
        return self.professional_name

    class Meta:
        verbose_name = '专业名称'
        verbose_name_plural = verbose_name
        db_table = 'professional'


# 专业职称
class ProfessionalTitle(models.Model):
    professional_title_name = models.CharField(max_length=50, verbose_name='专业职称', db_column='pro_title_name')

    def __str__(self):
        return self.professional_title_name

    class Meta:
        verbose_name = '专业职称'
        verbose_name_plural = verbose_name
        db_table = 'professionaltitle'


# 领导职务
class LeadershipPosition(models.Model):
    leadership_positon_name = models.CharField(max_length=50, verbose_name='领导职务', db_column='pro_title_name')

    def __str__(self):
        return self.leadership_positon_name

    class Meta:
        verbose_name = '领导职务'
        verbose_name_plural = verbose_name
        db_table = 'leadershipposition'


# 获取用户目录
def user_directory_path(instance, filename):
    ext=filename.split('.')[-1]
    filename='{}.{}'.format(uuid.uuid4().hex[:8], ext)
    sub_folder = 'file'
    if ext.lower() in ["jpg", "png", "gif"]:
        sub_folder = "avatar"
    if ext.lower() in ["pdf", 'doc', "docx"]:
        sub_folder = "document"
    return os.path.join(str(instance.emp_id.id), sub_folder, filename)


# 员工详细信息表
class EmployeeDetail(models.Model):
    employee_index = models.OneToOneField(Employee,verbose_name='员工编号',db_column='employee_index')
    # emp_img = models.ImageField(null=True, blank=True, upload_to='avatars/%Y/%m/%d',verbose_name="头像",db_column='emp_img')
    belong_professional=models.OneToOneField(Professional, verbose_name='专业名称',db_column='belong_professional')
    belong_professional_title=models.OneToOneField(ProfessionalTitle, verbose_name='专业职称',db_column='belong_professional_title')
    belong_leadership_position=models.ForeignKey(LeadershipPosition, verbose_name='领导职务',db_column='belong_leadership_position',blank=True, null=True)
    employee_img = models.ImageField(null=True, blank=True, upload_to=user_directory_path, verbose_name="头像",db_column='employee_img')
    employee_hire_date = models.DateTimeField(auto_now_add=True, verbose_name='入职时间', db_column='employee_hire_date')
    is_delete = models.BooleanField(default=False,verbose_name='是否离职',db_column='is_delete')

    def __str__(self):
        return self.employee_index.employee_name

    class Meta:
        ordering=['employee_index']
        verbose_name = '员工详细信息'
        verbose_name_plural = verbose_name
        db_table = 'employee_detail'

