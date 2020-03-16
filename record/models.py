from django.db import models

# Create your models here.
from company.models import Department, Employee


class SpecimenType(models.Model):
    specimen_type_index = models.IntegerField(default=12, verbose_name='样本类型编号', db_column='specimen_type_index')
    specimen_type_name = models.CharField(max_length=50, verbose_name='样本类型名称', db_column='specimen_type_name')

    def __str__(self):
        return self.specimen_type_name

    class Meta:
        ordering = ['specimen_type_index']
        verbose_name = '样本类型'
        verbose_name_plural = verbose_name
        db_table = 'specimen_type'


class ReasonCode(models.Model):
    reason_code = models.IntegerField(default=12, verbose_name='原因代码', db_column='reason_code')
    reason_name = models.CharField(max_length=50, verbose_name='原因名称', db_column='reason_name')

    def __str__(self):
        return self.reason_code

    class Meta:
        ordering = ['reason_code']
        verbose_name = '原因名称'
        verbose_name_plural = verbose_name
        db_table = 'reason_code'


class UnqualifiedSpecimen(models.Model):
    unqualified_specimen_date = models.DateTimeField(auto_now_add=True, verbose_name='日期-时间', db_column='unqualified_specimen_date')
    unqualified_specimen_name=models.CharField(max_length=10, verbose_name='患者姓名', db_column='unqualified_specimen_name')
    medical_record_number=models.CharField(max_length=10, verbose_name='病历号', db_column='medical_record_no')
    serial_number=models.CharField(max_length=15, verbose_name='流水号', db_column='serial_number')
    department_name=models.ForeignKey(Department, verbose_name='科室',db_column='department_name',blank=True, null=True)
    bed_number = models.CharField(max_length=5, verbose_name='床号', db_column='bed_number',blank=True,null=True)
    specimen_type=models.ForeignKey(SpecimenType, verbose_name='标本类型',db_column='specimen_type',blank=True,null=True)
    inspection_item = models.CharField(max_length=15, verbose_name='检查项目', db_column='inspection_item', blank=True, null=True)
    reason_code = models.ForeignKey(ReasonCode, verbose_name='原因代码',db_column='reason_code')
    reason_description = models.CharField(max_length=20, verbose_name='原因描述', db_column='reason_description', blank=True, null=True)
    reporter= models.ForeignKey(Employee, verbose_name='报告者',db_column='reporter',related_name='reporter')
    recorder= models.ForeignKey(Employee, verbose_name='记录者',db_column='recorder',related_name='recorder')
    remarks= models.CharField(max_length=50,verbose_name='备注',db_column='remarks',blank=True,null=True)

    def __str__(self):
        return self.unqualified_specimen_date

    class Meta:
        ordering=['unqualified_specimen_date']
        verbose_name = '不合格标本登记表'
        verbose_name_plural = verbose_name
        db_table = 'unqualified_specimen'
