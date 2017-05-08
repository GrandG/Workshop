from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.EditTask_Fm import Ui_ViewTask
import copy

class EditTask_P(QtWidgets.QDialog, Ui_ViewTask):
    def __init__(self, quit = None):
        super(EditTask_P, self).__init__()
        super().setupUi(self)
        self._quit = quit

        self.ConnectSign()
        self.ShowData(self.GetData())

    def ConnectSign(self):
        self.pushButtonDel.clicked.connect(self.DelClick)
        self.pushButtonCancel.clicked.connect(self.CancelClick)
        self.pushButtonSubmit.clicked.connect(self.SubmitClick)
        self.pushButtonQuit.clicked.connect(self.QuitClick)

    def QuitClick(self):
        self.close()
        if self._quit:
            self._quit()

    def DelClick(self):
        rowIndex = self.tableWidget.currentRow()
        if rowIndex <= 0: return False
        TaskName = self.tableWidget.item(rowIndex, 0).text()
        self.DelForTaskName(TaskName)

        self.tableWidget.removeRow(rowIndex)

    def DelForTaskName(self, TaskName):
        pass

    def CancelClick(self):
        self.Cancle()
        self.ShowData(self.GetData())

    def Cancle(self):
        pass

    def SubmitClick(self):
        self.Sumbit()

    # 提交
    def Sumbit(self):
        #逻辑层实现
        pass

    # 从数据库中获取任务数据
    def GetData(self):
        # 逻辑层实现
        pass

    def ShowData(self, data):
        if not data:
            return False
        self.tableWidget.setRowCount(len(data))
        self.tableWidget.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)

        self.tableWidget.setColumnWidth(0, 150)
        self.tableWidget.setColumnWidth(2, 80)
        self.tableWidget.setColumnWidth(3, 80)
        self.tableWidget.setColumnWidth(7, 70)
        for i in range(0, len(data)):
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskName']))
            self.tableWidget.setItem(i, 0, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskDescription']))
            self.tableWidget.setItem(i, 1, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskOwner']))
            self.tableWidget.setItem(i, 2, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskStartDate']))
            self.tableWidget.setItem(i, 3, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskEndDate']))
            self.tableWidget.setItem(i, 4, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskRealDate']))
            self.tableWidget.setItem(i, 5, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskStatus']))
            self.tableWidget.setItem(i, 6, item)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = EditTask_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())


