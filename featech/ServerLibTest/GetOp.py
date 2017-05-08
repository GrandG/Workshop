import xlrd

def get_op():
    # FileName = self.GetBOMFileName()
    # if not FileName: return False
    # if not os.path.exists(FileName): return False

    file_name = r'OP_Mo.csv'  # 目前只做测试用

    f = xlrd.open_workbook(file_name)
    print('here')
    table = f.sheets()[0]

    n_rows = table.nrows
    n_cols = table.ncols
    data = []


    for i in range(n_rows):
        d = []
        for j in range(n_cols):
            s = table.cell(i, j).value
            if not isinstance(s, str):
                s = str(int(s))

            d.append(s.strip())
        data.append(d)
    return data

if __name__ == '__main__':
    # print('here')
    res = get_op()
    print(res)
