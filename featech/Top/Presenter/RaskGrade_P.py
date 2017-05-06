from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.RaskGrade_Fm import Ui_RaskGrade

class RaskGrade_P(QtWidgets.QDialog, Ui_RaskGrade):
    def __init__(self, Dialog=None, NeedShow=True):
        super(RaskGrade_P, self).__init__()
        if Dialog == None:
            super().setupUi(self)
        else:
            super().setupUi(Dialog)

        self.ConnectSign()

    #初始化页面数据
    def InitDate(self):
        self._FMEADetailSql = 'select id,type,TaskName,SubTaskName,\
                    Code,Product,Class,FMEA_Effect,FMEA_Mode,FMEA_Reason,FMEA_ProposalGroup,\
                    FMEA_Proposal,FMEA_Det,FMEA_Occ,FMEA_Sev,Filtered,FMEAItemDescription  \
                    from u_Fmeadetail'
        self._LastReleaseSql = 'select  Product,Class,SubClass, \
                    FMEA_Effect,FMEA_Mode,FMEA_Mechanism,FMEA_Reason,FMEA_ProposalGroup,\
                    FMEA_Proposal,FMEAItemDescription  from u_FMEADetail'

    def GetFMEADetailSql(self):
        return self._FMEADetailSql

    def GetLastReleaseSql(self):
        return self._LastReleaseSql

    # 绑定事件
    def ConnectSign(self):
        self.pbInheritRask.clicked.connect(self.pbInheritRaskClick)
        self.pbHandAddRask.clicked.connect(self.pbHandAddRaskClick)
        self.pbDelHandRask.clicked.connect(self.pbDelHandRaskClick)

    def pbInheritRaskClick(self):
        self.InheritRask()

    def pbHandAddRaskClick(self):
        self.HandAddRask()

    def pbDelHandRaskClick(self):
        self.DelHandRask()

    # 继承风险
    def InheritRask(self):
        #逻辑层实现
        pass

    # 手动增加风险
    def HandAddRask(self):
        #逻辑层实现
        pass

    # 删除手动风险
    def DelHandRask(self):
        #逻辑层实现
        pass

    def _ShowMessage(self, content):
        QtWidgets.QMessageBox.information(self, ('提示'), content)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = RaskGrade_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
