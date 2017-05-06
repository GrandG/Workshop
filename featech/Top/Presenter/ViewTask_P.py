from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.ViewTask_Fm import Ui_ViewTask
import datetime

class ViewTask_P(QtWidgets.QDialog, Ui_ViewTask):
    def __init__(self, isAll = False, quit = None):
        super(ViewTask_P, self).__init__()
        super().setupUi(self)
        self._quit = quit

        self.ConnectSign()
        if isAll:
            self.ShowDataIsAll()
        else: self.ShowData()

    def ConnectSign(self):
        self.pushButtonGetSubTask.clicked.connect(self.GetSubTaskClick)
        self.pushButtonQuit.clicked.connect(self.QuitClick)

    def QuitClick(self):
        self.close()
        if self._quit: self._quit()

    # 从数据库中获取任务数据
    def GetData(self):
        # 逻辑层实现
        pass

    def GetDataIsAll(self):
        pass

    def ShowData(self):
        data = self.GetData()
        if not data: return False
        self.tableWidget.setRowCount(len(data))
        self.tableWidget.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)

        for i in range(0, len(data)):
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskName']))
            self.tableWidget.setItem(i, 0, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskDescription']))
            self.tableWidget.setItem(i, 1, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskName']))
            self.tableWidget.setItem(i, 2, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskStatus']))
            self.tableWidget.setItem(i, 3, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskOwner']))
            self.tableWidget.setItem(i, 4, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskStartDate']))
            self.tableWidget.setItem(i, 5, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskEndDate']))
            self.tableWidget.setItem(i, 6, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskRealDate']))
            self.tableWidget.setItem(i, 7, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['SubTaskResult']))
            self.tableWidget.setItem(i, 8, item)

    def ShowDataIsAll(self):
        data = self.GetDataIsAll()
        if not data: return False
        self.tableWidget.setRowCount(len(data))
        self.tableWidget.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)
        self.tableWidget.clear()
        self.tableWidget.setColumnCount(4)

        self.tableWidget.setHorizontalHeaderLabels(['任务名', '责任人', '延期警告', '任务进度显示'])
        self.tableWidget.setColumnWidth(0, 160)
        self.tableWidget.setColumnWidth(3, 400)
        now = datetime.datetime.now()
        for i in range(0, len(data)):
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskName']))
            self.tableWidget.setItem(i, 0, item)
            item = QtWidgets.QTableWidgetItem(str(data[i]['TaskOwner']))
            self.tableWidget.setItem(i, 1, item)
            if data[i]['TaskStatus'] <= 8:
                dayDiff = (now - data[i]['TaskEndDate']).days
                if dayDiff > 2 and dayDiff < 5:
                    color = QtGui.QColor(255,255,0) #黄色
                elif dayDiff >= 5:
                    color = QtGui.QColor(255, 0, 0)  # 红色
                else:
                    color = QtGui.QColor(0, 255, 0)  # 绿色

            item = QtWidgets.QTableWidgetItem('')
            item.setBackground(QtGui.QBrush(color))
            self.tableWidget.setItem(i, 2, item)

            progressBar = QtWidgets.QProgressBar()
            progressBar.setProperty("value", int(data[i]['TaskStatus'] / 9 * 100))

            self.tableWidget.setCellWidget(i, 3, progressBar)

    def GetSubTaskClick(self):
        data = self.GetData()
        if not data:
            QtWidgets.QMessageBox.information(self, '提示', '没有任务数据')
            return False

        filename, ok2 = QtWidgets.QFileDialog.getSaveFileName(self,
                                    "文件保存",
                                    "C:/",
                                    "All Files (*);;Text Files (*.txt)")
        if not filename: return False

        f = open(filename, 'w')
        s = ''
        for d in data:
            s = s.join(d['SubTaskResult'], '\n')

        f.write(s)
        f.close()

        QtWidgets.QMessageBox.information(self, '提示', '提取完成')


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = ViewTask_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())


