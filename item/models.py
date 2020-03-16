from django.db import models


# Create your models here.


class Unit(models.Model):
    unit_index = models.IntegerField(default=1001, verbose_name='单位编号', db_column='unit_index')
    unit_name = models.CharField(max_length=20, verbose_name='单位名称', db_column='unit_name')

    def __str__(self):
        return self.unit_name

    class Meta:
        ordering = ['unit_index']
        verbose_name = '项目单位'
        verbose_name_plural = verbose_name
        db_table = 'unit'


class Item(models.Model):
    item_index=models.IntegerField(default=10000, verbose_name='项目索引', db_column='item_number')
    item_chinese_name=models.CharField(max_length=20, verbose_name='项目中文名称', db_column='item_chinese_name')
    item_english_name=models.CharField(max_length=20, verbose_name='项目英文名称', db_column='item_english_name')
    item_method=models.CharField(max_length=20, verbose_name='检测方法', db_column='item_method')
    item_unit=models.ForeignKey(Unit, verbose_name='项目单位', db_column='item_unit')
    is_calc=models.BooleanField(default=False,verbose_name='是否计算项目',db_column='is_calc')
    is_use=models.BooleanField(default=False,verbose_name='是否使用',db_column='is_use')

    def __str__(self):
        return self.item_english_name

    class Meta:
        ordering = ['item_index']
        verbose_name = '项目信息'
        verbose_name_plural = verbose_name
        db_table = 'item'


class ItemRefference(models.Model):
    GENDER_CHOICES = (
        ('M', '男'),
        ('F', '女'),
    )
    AGE_UNIT = (
        ('1', '岁'),
        ('2', '月'),
        ('3', '天'),
    )
    item_id=models.ForeignKey(Item,verbose_name='项目ID',db_column='item_id')
    is_default=models.BooleanField(default=False,verbose_name='是否默认',db_column='is_default')
    gender=models.CharField(max_length=5,choices=GENDER_CHOICES,verbose_name='性别',db_column='gender',blank=True)
    start_age=models.IntegerField(verbose_name='开始年龄', db_column='start_age',blank=True,null=True)
    end_age=models.IntegerField(verbose_name='结束年龄', db_column='end_age',blank=True,null=True)
    age_unit=models.CharField(max_length=10,choices=AGE_UNIT,verbose_name='年龄类型',db_column='age_unit',blank=True)
    ref_low=models.DecimalField(max_digits=10,decimal_places=3,verbose_name='参考低限',db_column='ref_low',blank=True,null=True)
    ref_high=models.DecimalField(max_digits=10,decimal_places=3,verbose_name='参考高限',db_column='ref_high',blank=True,null=True)

    def __str__(self):
        return self.item_id.item_english_name

    class Meta:
        ordering = ['item_id']
        verbose_name = '项目参考值信息'
        verbose_name_plural = verbose_name
        db_table = 'itemrefference'
