from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow,QMessageBox
import sys
from view.DFRRiskAnalyse_Fm import Ui_DFRRiskAnalyse


class DFRRiskAnalyse_P(QtWidgets.QDialog, Ui_DFRRiskAnalyse):
    def __init__(self, Dialog=None, NeedShow=True):
        super(DFRRiskAnalyse_P, self).__init__()
        if NeedShow:
            if Dialog == None:
                super().setupUi(self)
            else:
                super().setupUi(Dialog)
        self.ConnectSign()

    # 初始化页面数据
    def InitDate(self):
        self.ShowBomData()
        self.ShowBomData()

    def show(self):
        super().show()
        self.ShowInput()

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

    def NextConfirm(self):
        res = QMessageBox.question(self, ('确认进入下一步吗?'), ('确认选择'),
                                   QMessageBox.StandardButtons(QMessageBox.Yes | QMessageBox.No))
        if res == QMessageBox.No: return False
        return True

    def GetBOMData(self, FileName):
        #逻辑层实现
        pass

    def ShowBomData(self):
        data = self.GetBOMData()
        if not data:
            return False
        row = len(data)-1
        col = len(data[0])
        self.tableWidgetBOM.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)
        self.tableWidgetBOM.setRowCount(row)
        self.tableWidgetBOM.setColumnCount(col)

        self.tableWidgetBOM.setHorizontalHeaderLabels(data[0])
        for i in range(1, len(data)):
            self.tableWidgetBOM.setColumnWidth(i - 1, 55)
            for j in range(0, len((data[0]))):
                item = QtWidgets.QTableWidgetItem(str(data[i][j]))
                self.tableWidgetBOM.setItem(i - 1, j, item)
        self.tableWidgetBOM.setColumnWidth(2, 155)
        self.tableWidgetBOM.setColumnWidth(4, 155)
        self.tableWidgetBOM.setColumnWidth(6, 85)

    def GetBomDataFromView(self):
        row = self.tableWidgetBOM.rowCount()
        col = self.tableWidgetBOM.columnCount()
        data = []
        title = []
        for i in range(0, row):
            title.append(self.tableWidgetBOM.horizontalHeaderItem(i).text())
            d = []
            for j in range(0, col):
                d.append(self.tableWidgetBOM.item(i, j).text())
            data.append(d)
        data.insert(0, title)
        return data

    def AnalyzeRule(self):
        pass

    def ShowInput(self):
        data = self.AnalyzeRule()
        if not data: return False

        height = 35
        for dict in data:
            label = QtWidgets.QLabel(self.groupBoxInput)
            label.setGeometry(QtCore.QRect(30, height, 150, 15))
            label.setText(dict['name'] + dict['attribute'] + ':')
            label.setAlignment(QtCore.Qt.AlignRight | QtCore.Qt.AlignTrailing | QtCore.Qt.AlignVCenter)
            label.show()

            lineEdit = QtWidgets.QLineEdit(self.groupBoxInput)
            lineEdit.setGeometry(QtCore.QRect(190, height-5, 241, 20))
            lineEdit.setObjectName("lineEdit" + str(dict['code']))
            lineEdit.show()

            label = QtWidgets.QLabel(self.groupBoxInput)
            label.setGeometry(QtCore.QRect(440, height, 50, 15))
            label.setText(dict['unit'])
            label.show()
            height += 40

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = DFRRiskAnalyse_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
