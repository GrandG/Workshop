from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.RuleQuery_Fm import Ui_RuleQuery
import copy

class RuleQuery_P(QtWidgets.QDialog, Ui_RuleQuery):
    def __init__(self, quit = None):
        super(RuleQuery_P, self).__init__()
        super().setupUi(self)
        self._quit = quit

        self.ConnectSign()
        self.ShowData()

    def ConnectSign(self):
        self.pushButtonFilter.clicked.connect(self.FilterClick)
        self.pushButtonQuit.clicked.connect(self.QuitClick)

    def QuitClick(self):
        self.close()
        if self._quit: self._quit()

    def FilterClick(self):
        pass

    # 从数据库中获取任务数据
    def GetData(self):
        # 逻辑层实现
        pass
    def ShowData(self):
        data = self.GetData()
        if not data: return False
        self.tableWidget.setRowCount(len(data))
        self.tableWidget.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)

        self.tableWidget.setColumnWidth(0, 150)
        self.tableWidget.setColumnWidth(1, 60)
        self.tableWidget.setColumnWidth(7, 120)
        for i in range(0, len(data)):
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskName']))
            self.tableWidget.setItem(i, 0, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskDescription']))
            self.tableWidget.setItem(i, 1, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskResult']))
            self.tableWidget.setItem(i, 2, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskOwner']))
            self.tableWidget.setItem(i, 3, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskName']))
            self.tableWidget.setItem(i, 4, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskStartDate']))
            self.tableWidget.setItem(i, 5, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskEndDate']))
            self.tableWidget.setItem(i, 6, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskRealDate']))
            self.tableWidget.setItem(i, 7, item)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = RuleQuery_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())


