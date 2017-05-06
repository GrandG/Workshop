from Top.module.g_Top import g_DB
from controler.add_on_P import DataCracker_P
from PyQt5.QtWidgets import QApplication
import sys


class DataCracker(DataCracker_P):
    def __init__(self):
        # super().__init__()
        super(DataCracker, self).__init__()

    def getData(self):
        g_DB.connect(host='localhost', user='root', password='616311401', db='test')

        if g_DB.GetConnectState():
            g_DB.Execute('SELECT * FROM u_user ORDER BY ID')
            return g_DB.fetchAll()
        else:
            return None

    def getRightName(self):
        g_DB.Execute('select * from general_info where type="U_RIGHT"')
        return g_DB.fetchAll()

    def confirm(self):
        add_data, del_data = self.modify_data()
        for each in add_data:
            g_DB.insert('u_user', each)
        for each in del_data:
            g_DB.delete('u_user', 'UserName={}'.format(each['UserName']))
        self.clear_commit()



if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = DataCracker()
    window.show()
    sys.exit(app.exec_())
