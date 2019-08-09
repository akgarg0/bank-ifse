from bankdetails.models import BankDetails
from bankdetails.serializers import BankDetailsSerializer
from bankdetails.apps import BankdetailsConfig
from rest_framework.response import Response
from rest_framework import generics
from bankdetails.Business_Logic import parseFile
from rest_framework.views import APIView
from rest_framework import status
from bankdetails.filters import BankDetailsIFSCFilter, BankDetailsBranchFilter


class BankDetailsViewSet(generics.GenericAPIView, APIView):
    """
    API endpoint that allows BankDetails to be viewed with offset and limit support
    """
    queryset = BankDetails.objects.using(BankdetailsConfig.using_db).all()
    serializer_class = BankDetailsSerializer

    def get(self, request, *args, **kwargs):
        limit = int(self.request.query_params.get('limit', 0))
        offset = int(self.request.query_params.get('offset', 0))
        print('limit: {}  Offset: {}'.format(limit, offset))

        if hasattr(self, 'filter_class'):
            for field in self.filter_class.Meta.fields:
                if self.request.query_params.get(field, None) is None:
                    return Response({'Error': 'Filters not specified', 'fields': self.filter_class.Meta.fields},
                                    status=status.HTTP_400_BAD_REQUEST)

        self.queryset = self.filter_queryset(self.get_queryset())

        if limit != 0:
            self.queryset = self.queryset[offset:offset+limit]

        page = self.paginate_queryset(self.queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(self.queryset, many=True)
        return Response(serializer.data)


class BankDetailsIFSCViewSet(BankDetailsViewSet):
    """
    API endpoint that allows BankDetails to be viewed with filter on IFSC code
    """
    filter_class = BankDetailsIFSCFilter


class BankDetailsBranchViewSet(BankDetailsViewSet):
    """
    API endpoint that allows BankDetails to be viewed with filter on Bank Name and City
    to get list branches.
    """
    filter_class = BankDetailsBranchFilter


class BankDetailsBulkCreate(generics.GenericAPIView, APIView):
    """
    API endpoint that allows BankDetails to be viewed with different filter sets
    """
    queryset = BankDetails.objects.using(BankdetailsConfig.using_db).all()
    serializer_class = BankDetailsSerializer

    def get(self, request, *args, **kwargs):
        cf = parseFile.CSVFile()
        data = cf.csv_to_obj()
        bulk_objs = []

        for row in data:
            obj = BankDetails(**row)
            bulk_objs.append(obj)

        BankDetails.objects.using(BankdetailsConfig.using_db).delete()
        msg = BankDetails.objects.using(BankdetailsConfig.using_db).bulk_create(bulk_objs)
        print(msg)
        return Response(data={'Message': msg}, status=status.HTTP_201_CREATED)

