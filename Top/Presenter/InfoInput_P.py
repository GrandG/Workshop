from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.InfoInput_Fm import Ui_InfoInput

class InfoInput_P(QtWidgets.QDialog, Ui_InfoInput):
    def __init__(self, Dialog=None, NeedShow=True):
        super(InfoInput_P, self).__init__()
        if Dialog == None:
            super().setupUi(self)
        else:
            super().setupUi(Dialog)

        self.ConnectSign()
        pass

    # 初始化页面数据
    def InitDate(self):
        pass

    # 绑定事件
    def ConnectSign(self):
        self.toolButtonBDM.clicked.connect(self.toolButtonBDMClick)
        self.toolButtonBrd.clicked.connect(self.toolButtonBrdClick)
        self.pbSubmit.clicked.connect(self.SubmitClick)

    def toolButtonBDMClick(self):
        # 需要修改
        filename,selectfilter = QtWidgets.QFileDialog.getOpenFileName(
            self, "选取文件", self.path, "xls (*xls);;xlsx (*.xlsx);;csv (*.csv)")
        self.lineEditBDMPos.setText(filename)
        pass

    def toolButtonBrdClick(self):
        # 需要修改
        filename,selectfilter = QtWidgets.QFileDialog.getOpenFileName(
            self, 'Open File', self.path, 'Brd (*.brd)')
        self.lineEditBrdPos.setText(filename)
        pass

    #提交数据的执行函数
    def Submit(self):
        #由逻辑层实现
        pass

    def SubmitClick(self):
        self.Submit()

    def GetRuleListInput(self):
        #由逻辑层实现
        pass

    def show(self):
        super().show()
        self.GetRuleListInput()

    #创建多选列表
    def CreateCheckBoXList(self, caption, size, RowCount):
        # groupBox = QtWidgets.QGroupBox(self.groupBox)
        # groupBox.setTitle(caption)
        # Rect = QtCore.QRect(size[0], size[1], size[2], size[3])
        # groupBox.setGeometry(Rect)
        # groupBox.show()
        #
        CheckBoXList = QtWidgets.QTableWidget(self.groupBoxTop)
        Rect = QtCore.QRect(size[0], size[1], size[2], size[3])
        CheckBoXList.setGeometry(Rect)

        CheckBoXList.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)
        CheckBoXList.horizontalHeader().setVisible(False)
        CheckBoXList.verticalHeader().setVisible(False)
        CheckBoXList.setGridStyle(QtCore.Qt.NoPen)
        # CheckBoXList.setFrameShape(QtWidgets.QFrame.WinPanel)
        # CheckBoXList.setFrameShadow(QtWidgets.QFrame.Raised)

        CheckBoXList.setColumnCount(5)
        CheckBoXList.setRowCount(RowCount)
        CheckBoXList.horizontalHeader().setDefaultSectionSize(138)

        item = QtWidgets.QTableWidgetItem()
        item.setText(caption)
        CheckBoXList.setItem(0, 0, item)

        # item = CheckBoXList.item(0, 0)
        # item.setText(caption)

        CheckBoXList.show()
        return CheckBoXList

    def AddCheckBox(self, CheckBoxList, row, col, caption):
        CheckBox = QtWidgets.QCheckBox()
        CheckBox.setText(caption)
        CheckBoxList.setCellWidget(row, col, CheckBox)

    def GetAllCheckBoXList(self):
        l = self.groupBoxTop.children()
        CheckBoxList = l[1::2]      #只有偶数项才是
        return CheckBoxList

    def GetFileName(self):
        return self.lineEditBDMPos.text(), self.lineEditBrdPos.text()

    def _ShowMessage(self, content):
        QtWidgets.QMessageBox.information(self, ('提示'), content)

    def NextConfirm(self):
        res = QtWidgets.QMessageBox.question(self, ('确认进入下一步吗?'), ('确认选择'),
                                             QtWidgets.QMessageBox.StandardButtons(
                                                 QtWidgets.QMessageBox.Yes | QtWidgets.QMessageBox.No))
        if res == QtWidgets.QMessageBox.No: return False
        return True

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = InfoInput_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
