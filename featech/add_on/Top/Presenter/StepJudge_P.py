from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox
import sys
from view.StepJudge_Fm import Ui_StepJudge

class StepJudge_P(QtWidgets.QDialog, Ui_StepJudge):
    def __init__(self, Dialog=None, NeedShow=True):
        super(StepJudge_P, self).__init__()
        if Dialog == None:
            super().setupUi(self)
        else:
            super().setupUi(Dialog)
        self.InitDate()

    #初始化页面数据
    def InitDate(self):
        self._InitSQL = 'select ID,type,Code,Product,Class,FMEA_SEV,\
                                FMEA_OCC,FMEA_DET, (FMEA_SEV*FMEA_OCC*FMEA_DET) as CalRPN,\
                                FMEA_Effect,FMEA_Mode,FMEA_Reason,FMEA_ProposalGroup,\
                                FMEA_Proposal,FMEAItemOwner,FMEAItemApprover,FMEAItemStartDate,\
                                FMEAItemEndDate,FMEAItemRealDate,FMEAItemStatus,\
                                FMEAItemConclusion,FMEAItemDescription,FMEAItemResult,\
                                FMEAItemDoc,Filtered  from u_FMEADetail'

        self.tableView = QtWidgets.QTableWidget(self.groupBoxDate)
        self.tableView.setGeometry(QtCore.QRect(5, 10, 710, 410))

        data2 = ['1', '2.0', '3.00000001', '3.9999999']
        combo_box_options = ["Option 1", "Option 2", "Option 3"]

        data = ['标识', '风险来源', 'PCB编码', '风险大类',
                '严重性', '发生几率', '可检测性', 'RPN',
                '潜在影响', '失效模式', '潜在原因', '建议行动分组', '建议行动']
        RidkData = ['可靠性', '装配', '组装', '可制造性']
        ActiveGroupDate = ['仿真分析', '理论计算', '专家意见', '实验测试']
        ActiveDate = ['行动1', '行动2', '行动3', '行动4', '行动5', '行动6']

        self.tableView.setColumnCount(len(data))
        self.tableView.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)

        for index in range(len(data)):
            item = QtWidgets.QTableWidgetItem(data[index])
            self.tableView.setHorizontalHeaderItem(index, item)

        self.tableView.setRowCount(4)
        for index in range(4):
            CheckBox = QtWidgets.QCheckBox()
            self.tableView.setCellWidget(index, 0, CheckBox)
            self.tableView.setColumnWidth(0, 30)

            item = QtWidgets.QTableWidgetItem('风险识别')
            self.tableView.setItem(index, 1, item)
            self.tableView.setColumnWidth(1, 55)

            item = QtWidgets.QTableWidgetItem('123456')
            self.tableView.setItem(index, 2, item)
            self.tableView.setColumnWidth(2, 55)

            combo = QtWidgets.QComboBox()
            for t in RidkData:
                combo.addItem(t)
            self.tableView.setCellWidget(index, 3, combo)
            self.tableView.setColumnWidth(3, 70)

            item = QtWidgets.QTableWidgetItem('3')
            self.tableView.setItem(index, 4, item)
            self.tableView.setColumnWidth(4, 45)

            item = QtWidgets.QTableWidgetItem('4')
            self.tableView.setItem(index, 5, item)
            self.tableView.setColumnWidth(5, 55)

            item = QtWidgets.QTableWidgetItem('5')
            self.tableView.setItem(index, 6, item)
            self.tableView.setColumnWidth(6, 55)

            item = QtWidgets.QTableWidgetItem('210')
            self.tableView.setItem(index, 7, item)
            self.tableView.setColumnWidth(7, 35)

            item = QtWidgets.QTableWidgetItem('影响1')
            self.tableView.setItem(index, 8, item)
            self.tableView.setColumnWidth(8, 55)

            item = QtWidgets.QTableWidgetItem('失效模式1')
            self.tableView.setItem(index, 9, item)
            self.tableView.setColumnWidth(9, 55)

            item = QtWidgets.QTableWidgetItem('潜在原因1')
            self.tableView.setItem(index, 10, item)
            self.tableView.setColumnWidth(10, 55)

            combo = QtWidgets.QComboBox()
            for t in ActiveGroupDate:
                combo.addItem(t)
            self.tableView.setCellWidget(index, 11, combo)
            self.tableView.setColumnWidth(11, 75)

            combo = QtWidgets.QComboBox()
            for t in ActiveDate:
                combo.addItem(t)
            self.tableView.setCellWidget(index, 12, combo)
            self.tableView.setColumnWidth(12, 60)

        self.tableView.show()

    # 绑定事件
    def ConnectSign(self):
        self.pBtnRPNSort.clicked.connect(self.pBtnRPNSortClick)
        self.pBtnFilterTOPRisk.clicked.connect(self.pBtnFilterTOPRiskClick)
        self.pBtnShowAll.clicked.connect(self.pBtnShowAllClick)

    def pBtnRPNSortClick(self):
        self.RPNSort()

    def pBtnFilterTOPRiskClick(self):
        self.FilterTOPRisk()

    def pBtnShowAllClick(self):
        self.ShowAll()

    #RPN排序
    def RPNSort(self):
        #逻辑层实现
        pass

    #过滤风险
    def FilterTOPRisk(self):
        #逻辑层实现
        pass

    #显示所有风险项
    def ShowAll(self):
        #逻辑层实现
        pass

    def GetSqlText(self):
        return self._InitSQL

    def GetTopNo(self):
        return  self.spinBox.text()

    def GetExpertText(self):
        return self.textEditFEAMExpert.toPlainText()

    def ShowMessage(self, content):
        QMessageBox(self, '提示', content)



if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = StepJudge_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
