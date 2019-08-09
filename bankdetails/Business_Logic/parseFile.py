import csv

DEFAULT_FIELDS = None
MAX_ROWS = 9999

class CSVFile:
    def __init__(self, path='bankdetails/Business_Logic/bank_branches.csv'):
        """
        Initialising CSV file object
        :param path:
        """
        csv_file = open(path, 'r')
        self.data_file = csv.DictReader(csv_file, delimiter=',')

    def csv_to_obj(self, fields=DEFAULT_FIELDS):
        """
        Required Data is converted to object
        :param fields:
        :return list:
        """
        data = []
        count = 0
        print(self.data_file)
        for row in self.data_file:
            new_row = {}
            for field in row:
                if fields is None:
                    new_row[field] = row[field]
                elif field in fields:
                    new_row[fields[field]] = row[field]
            data.append(new_row)
            count = count + 1
            if count == MAX_ROWS and MAX_ROWS > 0:
                break
        return data
