from django.db import models

# Create your models here.
from company.models import Employee, Company


class Instrument(models.Model):
    INSTRUMENT_CHOICES = (
        ('1', '正常'),
        ('2', '备用'),
        ('3', '故障'),
        ('4', '报废'),
    )
    instrument_index = models.CharField(max_length=50, verbose_name='设备编号', db_column='instrument_index', unique=True)
    instrument_name = models.CharField(max_length=50, verbose_name='设备名称', db_column='instrument_name')
    instrument_status = models.CharField(max_length=10,choices=INSTRUMENT_CHOICES, verbose_name='设备状态',db_column='instrument_status')
    instrument_manager = models.ForeignKey(Employee, verbose_name="管理人员", db_column='instrument_manager')
    instrument_start_date = models.DateField(auto_now_add=True, verbose_name='启用时间', db_column='instrument_start_date')
    instrument_company = models.ForeignKey(Company, verbose_name='设备公司', db_column='instrument_company')

    def __str__(self):
        return self.instrument_name

    class Meta:
        ordering = ['instrument_index']
        verbose_name = '设备编号'
        verbose_name_plural = verbose_name
        db_table = 'instrument'
