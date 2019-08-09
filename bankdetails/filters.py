from django_filters import FilterSet
from bankdetails.models import BankDetails


class BankDetailsIFSCFilter(FilterSet):
    class Meta:
        model = BankDetails
        fields = [
            'ifsc',
        ]


class BankDetailsBranchFilter(FilterSet):
    class Meta:
        model = BankDetails
        fields = [
            'bank_name',
            'city',
        ]
