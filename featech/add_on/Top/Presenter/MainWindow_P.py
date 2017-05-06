from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.MainWindow_Fm import Ui_MainWindow
from module.g_Top import *
import module.g_Top as g_Top

class MainWindow_P(QtWidgets.QDialog, Ui_MainWindow):
    def __init__(self, Dialog=None, NeedShow=True):
        super(MainWindow_P, self).__init__()
        if NeedShow:
            if Dialog == None:
                super().setupUi(self)
            else:
                super().setupUi(Dialog)

        #用于在状态栏显示的标签
        self._LableTask = QtWidgets.QLabel()
        self._LableUser = QtWidgets.QLabel()
        self._LableProductType = QtWidgets.QLabel()

        self.statusbar.addWidget(self._LableTask)
        self.statusbar.addWidget(self._LableUser)
        self.statusbar.addWidget(self._LableProductType)

        self.InitDate()
        self.ConnectSign()

    #初始化所有数据
    def InitDate(self):
        # 生成两个图标对象，用于按钮点击时的图标转换
        self.iconNow = QtGui.QIcon()
        self.iconNow.addPixmap(QtGui.QPixmap(":/new/wl/Now.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.iconSure = QtGui.QIcon()
        self.iconSure.addPixmap(QtGui.QPixmap(":/new/wl/sure.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)

        self.GetData()
        self._Userstatus(g_Top.g_UserName)
        self._Taskstatus(g_Task.Task)
        self._ProductTypestatus(g_Task.ProductType)

    # 获取权限管理，任务功能管理信息
    def GetData(self):
        #逻辑层实现
        pass

    #初添加页面到主界面
    def AddPage(self, FmLst):
        for Fm in FmLst:
            self.FormLayout.addWidget(Fm)
            Fm.hide()

    #当用户新建任务时调用，主要作用是将所有界面初始化
    def NewTaskClear(self):
        child = self.FormLayout.takeAt(0)
        while child != None:
            child.widget().setParent(None)
            del child
            child = self.FormLayout.takeAt(0)
        self.InitDate()

    #绑定事件
    def ConnectSign(self):
        self.pBtnQuit.clicked.connect(self.QuitClick)
        self.pBtnNext.clicked.connect(self.NextClick)
        self.pBtnNewTask.clicked.connect(lambda: self.FmClick('NewTesk'))
        self.pBtnInfoInput.clicked.connect(lambda: self.FmClick('InfoInput'))
        self.pBtnDFRAnalyse.clicked.connect(lambda: self.FmClick('DFRRiskAnalyse'))
        self.pBtnRiskGrade.clicked.connect(lambda: self.FmClick('RaskGrade'))
        self.pBtnStepJudge.clicked.connect(lambda: self.FmClick('StepJudge'))
        self.pBtnStepEdit.clicked.connect(lambda: self.FmClick('StepEdit'))
        self.pBtnRiskTable.clicked.connect(lambda: self.FmClick('RiskTable'))
        self.pBtnReportOutput.clicked.connect(lambda: self.FmClick('ReportOutput'))
        self.pBtnReportModify.clicked.connect(lambda: self.FmClick('ReportModify'))


    def QuitClick(self):
        QApplication.quit()

    def NextClick(self):
        self.Next()

        # child = self.verticalLayoutWidget.takeAt(Index)
        # if child != None:
        #     QtWidgets.QMessageBox(self, '123', child.widget().text())

    def UploadFileClick(self):
        #需要修改
        filename = QtWidgets.QFileDialog.getOpenFileName(
                   self, 'Open File', '', 'Images (*.png *.xpm *.jpg)')
        pass

    # 窗体界面的点击事件
    def FmClick(self, ClassName):
        self.FmExecute(ClassName)

    # 窗体事件执行函数
    def FmExecute(self, ClassName):
        # 逻辑层实现
        pass

    # 点击下一步的真正执行函数
    def Next(self):
        # 逻辑层实现
        pass

    # 改变状态栏中任务信息
    def _Taskstatus(self, task):
        self._LableTask.setText('当前任务:' + task + '          ')

    # 改变状态栏中用户信息
    def _Userstatus(self, user):
        self._LableUser.setText('当前登陆用户:' + user + '          ')

    # 改变状态栏中产品族信息
    def _ProductTypestatus(self, ProductType):
        self._LableProductType.setText('当前分析产品类型:' + ProductType)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = MainWindow_P(mainWindow)
    mainWindow.show()
    app.exec()
    sys.exit()
