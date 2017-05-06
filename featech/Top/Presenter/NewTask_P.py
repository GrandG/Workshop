from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.NewTesk_Fm import Ui_NewTask
import module.g_Top as g_Top
import time

class NewTesk_P(QtWidgets.QDialog, Ui_NewTask):
    def __init__(self, Dialog=None, NeedShow=True):
        super(NewTesk_P, self).__init__()
        if Dialog == None:
            super().setupUi(self)
        else:
            super().setupUi(Dialog)

        self.ConnectSign()

    # 从数据库获取产品信息
    def GetProductInfo(self):
        # 逻辑层实现
        pass

    # 从数据库获取产品族信息
    def GetProductFamilyInfo(self, ProductType):
        # 逻辑层实现
        pass

    # 从数据库获取环境信息
    def GetEnvInfo(self):
        #逻辑层实现
        pass

    # 提交数据的执行函数
    def SubmitTask(self):
        # 由逻辑层实现
        pass

    def SubmitClick(self):
        if self.SubmitTask():
            QtWidgets.QMessageBox.information(self, ('提示'), ('任务提交成功！'))

    #初始化页面数据
    def InitDate(self):
        #初始化时间
        now_day = time.strftime("%Y/%m/%d", time.localtime())
        self.dateEditStart.setDateTime(QtCore.QDateTime.fromString(now_day, self.dateEditStart.displayFormat()))
        self.dateEditEnd.setDateTime(QtCore.QDateTime.fromString(now_day, self.dateEditEnd.displayFormat()))
        self.dateEditStart.setDate(QtCore.QDate.currentDate())
        self.dateEditEnd.setDate(QtCore.QDate.currentDate())

        self.cbbProductType.clear()
        self.cbbProductType.addItems(self.GetProductInfo())
        self.cbbProductTypeSelect()     #第一次需自动获取产品信息族信息

        self.cbbEnvironGroup.addItems(self.GetEnvInfo())

    def cbbProductTypeSelect(self):
        self.cbbGroup.clear()
        self.cbbGroup.addItems(self.GetProductFamilyInfo(self.cbbProductType.currentText()))

    # 绑定事件
    def ConnectSign(self):
        self.cbbProductType.activated.connect(self.cbbProductTypeSelect)
        self.pbSubmit.clicked.connect(self.SubmitClick)
        pass

    #判断数据库中是否存在名为TaskName的任务
    def IsExistTask(self, TaskName):
        #逻辑层实现
        pass

    #检查数据的合法性
    def CheckData(self):
        txt = self.lineEditProductName.text()
        if txt == '' or txt.isspace():
            QtWidgets.QMessageBox.information(self, ('提示'), ('任务名为空,请填写任务名'))
            self.lineEditProductName.setFocus()
            return False

        if self.dateEditStart.date() < QtCore.QDate.currentDate():
            QtWidgets.QMessageBox.information(self, ('提示'), ('开始时间早于当前时间！'))
            self.dateEditStart.setFocus()
            return False
        if self.dateEditStart.date() > self.dateEditEnd.date():
            QtWidgets.QMessageBox.information(self, ('提示'), ('完成时间早于开始时间！'))
            self.dateEditEnd.setFocus()
            return False

        if self.IsExistTask(txt):
            QtWidgets.QMessageBox.information(self, ('提示'), ('已存在同名的任务，请重命名'))
            self.lineEditProductName.setFocus()
            return False

        return True

    def GetDataFromView(self):
        data = {}

        if not self.CheckData():
            return data, ''

        data.setdefault('TaskName', '"%s"' % self.lineEditProductName.text())
        data.setdefault('TaskDescription', '"%s"' % self.lineEditProductDescribe.text())
        data.setdefault('ProductCode', '"%s"' % self.lineEditCode.text())
        data.setdefault('ProductType', '"%s"' % self.cbbProductType.currentText())
        data.setdefault('ProductFamily', '"%s"' % self.cbbGroup.currentText())
        data.setdefault('Env', '"%s"' % self.cbbEnvironGroup.currentText())
        data.setdefault('TaskOwner', '"%s"' % g_Top.g_UserName)
        data.setdefault('TaskStartDate', '"%s"' % self.dateEditStart.text())
        data.setdefault('TaskEndDate', '"%s"' % self.dateEditEnd.text())

        return data, self.ptEdtPlateCode.toPlainText()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = NewTesk_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
