from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.UserManager_Fm import Ui_UserManager
from model.EditUser import EditUser

class UserManager_P(QtWidgets.QDialog, Ui_UserManager):
    def __init__(self, quit = None):
        super(UserManager_P, self).__init__()
        super().setupUi(self)
        self._quit = quit

        self.ConnectSign()
        self.ShowData(self.GetData())

    def ConnectSign(self):
        self.pushButtonSubmit.clicked.connect(self.SubmitClick)
        self.pushButtonDel.clicked.connect(self.DelClick)
        self.pushButtonAdd.clicked.connect(self.AddClick)
        self.pushButtonCancle.clicked.connect(self.CancleClick)
        self.pushButtonQuit.clicked.connect(self.QuitClick)

    def QuitClick(self):
        self.close()
        if self._quit: self._quit()

    def SubmitClick(self):
        self.Submit()

    def Submit(self):
        pass

    def DelClick(self):
        rowIndex = self.tableWidget.currentRow()
        if rowIndex <= 0:return False
        UserName = self.tableWidget.item(rowIndex, 0).text()
        if UserName == 'Admin':
            QtWidgets.QMessageBox.information(self, '提示', '系统用户不能删除')
            return False
        if self.DelForName(UserName):
            self.tableWidget.removeRow(rowIndex)

    def CancleClick(self):
        self.Cancle()
        self.ShowData(self.GetData())

    def DelForName(self, UserName):
        pass

    def Cancle(self):
        pass

    def AddClick(self):
        view = EditUser()
        if not view.exec_(): return False

        data = view.GetData()
        self.AddDataToFm(data)
        self.AddDataToDB(data)


    # 从数据库中获取任务数据
    def GetData(self):
        # 逻辑层实现
        pass

    def ShowData(self, data):
        if not data: return False
        self.tableWidget.setRowCount(len(data))
        self.tableWidget.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)

        self.tableWidget.setColumnWidth(0, 60)
        self.tableWidget.setColumnWidth(1, 60)
        self.tableWidget.setColumnWidth(2, 50)
        self.tableWidget.setColumnWidth(3, 190)
        for i in range(0, len(data)):
            item = QtWidgets.QTableWidgetItem(str(data[i]['UserName']))
            self.tableWidget.setItem(i, 0, item)
            s = '*' * len(str(data[i]['UserPassword']))
            item = QtWidgets.QTableWidgetItem(s)
            self.tableWidget.setItem(i, 1, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['UserCaption']))
            self.tableWidget.setItem(i, 2, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['UserEmailAddress']))
            self.tableWidget.setItem(i, 3, item)
            s = '*' * len(str(data[i]['UserEmailPass']))
            item = QtWidgets.QTableWidgetItem(s)
            self.tableWidget.setItem(i, 4, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['WorkingID']))
            self.tableWidget.setItem(i, 5, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['WorkingDepartMent']))
            self.tableWidget.setItem(i, 6, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['RightName']))
            self.tableWidget.setItem(i, 7, item)

    def AddDataToFm(self, data):
        rowIndex = self.tableWidget.rowCount()
        self.tableWidget.setRowCount(rowIndex + 1)
        item = QtWidgets.QTableWidgetItem(str(data['UserName']))
        self.tableWidget.setItem(rowIndex, 0, item)
        s = '*' * len(str(data['UserPassword']))
        item = QtWidgets.QTableWidgetItem(s)
        self.tableWidget.setItem(rowIndex, 1, item)
        item = QtWidgets.QTableWidgetItem(str(data['UserCaption']))
        self.tableWidget.setItem(rowIndex, 2, item)
        item = QtWidgets.QTableWidgetItem(str(data['UserEmailAddress']))
        self.tableWidget.setItem(rowIndex, 3, item)
        s = '*' * len(str(data['UserEmailPass']))
        item = QtWidgets.QTableWidgetItem(s)
        self.tableWidget.setItem(rowIndex, 4, item)
        item = QtWidgets.QTableWidgetItem(str(data['WorkingID']))
        self.tableWidget.setItem(rowIndex, 5, item)
        item = QtWidgets.QTableWidgetItem(str(data['WorkingDepartMent']))
        self.tableWidget.setItem(rowIndex, 6, item)
        item = QtWidgets.QTableWidgetItem(str(data['RightName']))
        self.tableWidget.setItem(rowIndex, 7, item)

    def AddDataToDB(self, data):
        pass

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = Ui_UserManager(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())


