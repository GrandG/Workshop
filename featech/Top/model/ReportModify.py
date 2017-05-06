from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.ReportModify_P import ReportModify_P

class ReportModify(ReportModify_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(ReportModify, self).__init__(Dialog, NeedShow)
        pass

    # 主页面点击下一步时对当前页面的数据合法性进行检查,并保存数据，检查完成返回True否则返回False
    def CheckAndSaveData(self):
        return True

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = ReportModify(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())