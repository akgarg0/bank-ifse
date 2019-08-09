from django.urls import path
from bankdetails.views import BankDetailsViewSet, BankDetailsIFSCViewSet, BankDetailsBranchViewSet, BankDetailsBulkCreate


urlpatterns = [
    path('details/', BankDetailsViewSet.as_view()),
    path('ifsc/', BankDetailsIFSCViewSet.as_view()),
    path('branch/', BankDetailsBranchViewSet.as_view()),
    path('bulkcreate/', BankDetailsBulkCreate.as_view())
]