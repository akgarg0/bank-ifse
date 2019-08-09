from django.db import models
from bankdetails.apps import BankdetailsConfig


class UserQuerySet(models.QuerySet):
    def create(self, **kwargs):
        obj = self.model(**kwargs)
        self._for_write = True
        obj.save(force_insert=True, using=BankdetailsConfig.using_db)
        return obj


class BankDetails(models.Model):
    objects = UserQuerySet.as_manager()
    ifsc = models.CharField(max_length=255, unique=True)
    bank_id = models.IntegerField(null=False)
    bank_name = models.CharField(max_length=255, null=False)
    branch = models.CharField(max_length=255, null=False)
    address = models.CharField(max_length=1023, null=False, default="")
    city = models.CharField(max_length=255, null=False)
    district = models.CharField(max_length=255, null=False)
    state = models.CharField(max_length=255, null=False)

    class Meta:
        managed = True
