from view.add_on_Fm import Ui_UserSetDialog
from PyQt5.QtWidgets import QDialog, QApplication
from PyQt5 import QtWidgets, QtCore
import sys
from Top.module.MySql import MySQL
from model.AddUserDlg import *


class DataCracker_P(QtWidgets.QDialog, Ui_UserSetDialog):
    def __init__(self):

        # super().__init__()
        super(DataCracker_P, self).__init__()

        self.setupUi(self)

        self.exitBtn.clicked.connect(self.close)
        self.addRowBtn.clicked.connect(self.addRow)
        self.delRowBtn.clicked.connect(self.delRow)
        self.confirmBtn.clicked.connect(self.confirm)
        self.initial()
        # self.addRow()
        # print(self.get_data())

    def initial(self):
        self.showData_T(self.getData())


    def getData(self):
        """
        数据在model层获取
        :return: 
        """
        pass

    def modify_data(self):
        add_data, del_data = self.get_change()
        return self.add_quota(add_data), self.add_quota(del_data)

    def add_quota(self, data):
        for each in data:
            for k, v in each.items():
                each[k] = '"' + each[k] + '"'
        return data


    def addRow(self):
        list_ = [each[2] for each in self.getRightName()]
        dlg = AddUserDlg(list_)

        dlg.exec()
        result = dlg.getUserInfo()
        self.get_add(result)

        self.showData_D(result)

    def delRow(self):
        table = self.infoTable
        currentRow = table.currentRow()
        self.get_del()
        if currentRow != -1:
            table.removeRow(currentRow)
        else:
            table.removeRow(table.rowCount() - 1)

    def confirm(self):
        pass

    def close(self):
        self.close()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = DataCracker_P()
    window.show_data()
    window.show()
    sys.exit(app.exec_())
