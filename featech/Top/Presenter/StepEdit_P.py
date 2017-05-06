from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow,QMessageBox
import sys
from view.StepEdit_Fm import Ui_StepEdit

class StepEdit_P(QtWidgets.QDialog, Ui_StepEdit):
    def __init__(self, Dialog=None, NeedShow=True):
        super(StepEdit_P, self).__init__()
        if Dialog == None:
            super().setupUi(self)
        else:
            super().setupUi(Dialog)
        pass

    #初始化页面数据
    def InitDate(self):
        self._InitSQL = 'select ID,type,Code,Product,Class,FMEA_SEV,\
                                        FMEA_OCC,FMEA_DET, (FMEA_SEV*FMEA_OCC*FMEA_DET) as CalRPN,\
                                        FMEA_Effect,FMEA_Mode,FMEA_Reason,FMEA_ProposalGroup,\
                                        FMEA_Proposal,FMEAItemOwner,FMEAItemApprover,FMEAItemStartDate,\
                                        FMEAItemEndDate,FMEAItemRealDate,FMEAItemStatus,\
                                        FMEAItemConclusion,FMEAItemDescription,FMEAItemResult,\
                                        FMEAItemDoc,Filtered  from u_FMEADetail'

    # 绑定事件
    def ConnectSign(self):
        self.pBtnRPNSort.clicked.connect(self.pBtnRPNSortClick)
        self.pBtnFilterTOPRisk.clicked.connect(self.pBtnFilterTOPRiskClick)
        self.pBtnShowAll.clicked.connect(self.pBtnShowAllClick)
        self.pBtnHandAddRask.clicked.connect(self.pBtnHandAddRaskClick)

    def pBtnRPNSortClick(self):
        self.RPNSort()

    def pBtnFilterTOPRiskClick(self):
        self.FilterTOPRisk()

    def pBtnShowAllClick(self):
        self.ShowAll()

    def pBtnHandAddRaskClick(self):
        self.HandAddRask()

    # RPN排序
    def RPNSort(self):
        # 逻辑层实现
        pass

    # 过滤风险
    def FilterTOPRisk(self):
        # 逻辑层实现
        pass

    # 显示所有风险项
    def ShowAll(self):
        # 逻辑层实现
        pass

    # 手动添加风险
    def HandAddRask(self):
        pass

    def GetSqlText(self):
        return self._InitSQL

    def NextConfirm(self):
        res = QMessageBox.question(self, ('确认进入下一步吗?'), ('确认选择'),
                                   QMessageBox.StandardButtons(QMessageBox.Yes | QMessageBox.No))
        if res == QMessageBox.No: return False
        return True

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = StepEdit_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
