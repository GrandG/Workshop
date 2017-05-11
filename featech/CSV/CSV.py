import csv


class CSV:
    def __init__(self, pos):
        self._pos = pos

    def read(self):
        with open(self._pos, 'r') as f:
            f_csv = csv.DictReader(f)
            return [row for row in f_csv]

    def read_header(self):
        with open(self._pos, 'r') as f:
            return csv.DictReader(f).fieldnames


if __name__ == '__main__':
    ex = CSV('B_Mat.csv')
    print(ex.read())
