from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.DFRRiskAnalyse_Fm import Ui_DFRRiskAnalyse

class DFRRiskAnalyse_P(QtWidgets.QDialog,Ui_DFRRiskAnalyse):
    def __init__(self, Dialog=None, NeedShow=True):
        super(DFRRiskAnalyse_P, self).__init__()
        if NeedShow:
            if Dialog == None:
                super().setupUi(self)
            else:
                super().setupUi(Dialog)
        pass

    #初始化页面数据
    def InitDate(self):
        pass

    def show(self):
        super().show()

    # 绑定事件
    def ConnectSign(self):
        self.pbStartCheck.clicked.connect(self.pbStartCheckClick)
        self.pbBrdData.clicked.connect(self.pbBrdDataClick)
        self.pbSubmitResult.clicked.connect(self.pbSubmitResultClick)

    def pbSubmitResultClick(self):
        self.SubmitResult()

    def pbStartCheckClick(self):
        self.StartCheck()

    def pbBrdDataClick(self):
        self.BrdData()

    #提交分析结果
    def SubmitResult(self):
        #由逻辑层实现
        pass

    # 提交分析结果
    def StartCheck(self):
        # 由逻辑层实现
        pass

    # 获取brd数据
    def BrdData(self):
        # 由逻辑层实现
        pass


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = DFRRiskAnalyse_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
