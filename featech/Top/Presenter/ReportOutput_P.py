from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.ReportOutput_Fm import Ui_ReportOutput

class ReportOutput_P(QtWidgets.QDialog, Ui_ReportOutput):
    def __init__(self, Dialog=None, NeedShow=True):
        super(ReportOutput_P, self).__init__()
        if Dialog == None:
            super().setupUi(self)
        else:
            super().setupUi(Dialog)
        pass

    #初始化页面数据
    def InitDate(self):
        pass

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = ReportOutput_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())