from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.MainWindow_Fm import Ui_MainWindow
from module.g_Top import *
import module.g_Top as g_Top
from model.ViewTask import ViewTask,ViewAllTask
from model.EditTask import EditTask
from model.RuleQuery import RuleQuery
from model.UserManager import UserManager
from model.EditUser import EditUser


class MainWindow_P(QtWidgets.QDialog, Ui_MainWindow):
    def __init__(self, Dialog=None, NeedShow=True):
        super(MainWindow_P, self).__init__()
        if NeedShow:
            if Dialog == None:
                super().setupUi(self)
            else:
                super().setupUi(Dialog)

        # 用于在状态栏显示的标签
        self._LableTask = QtWidgets.QLabel()
        self._LableUser = QtWidgets.QLabel()
        self._LableProductType = QtWidgets.QLabel()

        self.statusbar.addWidget(self._LableTask)
        self.statusbar.addWidget(self._LableUser)
        self.statusbar.addWidget(self._LableProductType)

        self.InitViewDate()
        self.ConnectSign()

        self.FucFm = []         # 管理功能性的页面

    # 初始化所有数据
    def InitViewDate(self):
        # 生成两个图标对象，用于按钮点击时的图标转换
        self.iconNow = QtGui.QIcon()
        self.iconNow.addPixmap(QtGui.QPixmap(":/new/wl/Now.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.iconSure = QtGui.QIcon()
        self.iconSure.addPixmap(QtGui.QPixmap(":/new/wl/sure.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)

    # 初始化所有数据
    def InitDate(self):
        self.GetTask()
        self.ShowRight()
        self._Userstatus(g_Top.g_UserName)
        self._Taskstatus(g_Task.Task)
        self._ProductTypestatus(g_Task.ProductType)

    # 获取任务功能管理信息
    def GetTask(self):
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

    # 用于显示当前序号的页面
    def ShowNowFm(self):
        # 逻辑层实现
        pass

    # 用于隐藏当前序号的页面
    def HideNowFm(self):
        # 逻辑层实现
        pass

    # 绑定事件
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

        self.A_SaveNewTask.triggered.connect(lambda: self.FmClick('NewTesk'))
        self.A_ViewTask.triggered.connect(lambda: self._ActionExecute(ViewTask))
        self.A_ViewAllTask.triggered.connect(lambda: self._ActionExecute(ViewAllTask))
        self.A_EditTask.triggered.connect(lambda: self._ActionExecute(EditTask))
        self.A_Quit.triggered.connect(self.QuitClick)
        self.A_ChangeUser.triggered.connect(self._ChangeUserExecute)
        self.A_RuleQuery.triggered.connect(lambda: self._ActionExecute(RuleQuery))
        self.A_TB.triggered.connect(self._aboutExecute)
        self.A_SB.triggered.connect(self._aboutExecute)
        self.A_EditUser.triggered.connect(self._EditUserExecute)
        self.A_RightControl.triggered.connect(self._aboutExecute)
        self.A_UserManager.triggered.connect(lambda: self._ActionExecute(UserManager))
        self.A_About.triggered.connect(self._aboutExecute)

    def QuitClick(self):
        QApplication.quit()

    def NextClick(self):
        self.Next()

        # child = self.verticalLayoutWidget.takeAt(Index)
        # if child != None:
        #     QtWidgets.QMessageBox(self, '123', child.widget().text())

    def UploadFileClick(self):
        # 需要修改
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
        self._LableTask.setText('当前任务:  ' + task + '          ')

    # 改变状态栏中用户信息
    def _Userstatus(self, user):
        self._LableUser.setText('当前登陆用户:  ' + user + '          ')

    # 改变状态栏中产品族信息
    def _ProductTypestatus(self, ProductType):
        self._LableProductType.setText('当前分析产品类型:  ' + ProductType)

    # 从数据库中获取当前用户权限
    def GetRight(self):
        # 逻辑层实现
        pass

    # 将当前权限在界面上显示表现
    def ShowRight(self):
        data = self.GetRight()
        #未完成

    def _ShowMessage(self, content, title='提示'):
        QtWidgets.QMessageBox.information(None, title, content)

    def _aboutExecute(self):
        self._ShowMessage('深圳市有限元科技有限公司提供软件应用技术支持！')

    def _ActionExecute(self, classObj, parameter = None):
        self.ShowFuncFm()
        view = self.FmIsExsit(classObj)
        if not view:
            if parameter:
                view = classObj(FormCloseCallback, parameter)
            else:view = classObj(quit=self.FormCloseCallback)
            self.FormLayout.addWidget(view)
        view.show()
        self.FucFm.append(view)

    # 功能页面退出时的回调函数
    def FormCloseCallback(self):
        self.FucFm.pop()  # 先将自栈
        if self.FucFm:
            Fm = self.FucFm[-1]
            if Fm: Fm.show()
        else: self.ShowNowFm()

    # 在要显示功能页面前的准备
    def ShowFuncFm(self):
        if self.FucFm:
            Fm = self.FucFm[-1]
            Fm.hide()
        else: self.HideNowFm()

    # 判断该页面是否被打开
    def FmIsExsit(self, classObj):
        for i in range(len(self.FucFm)):
            fm = self.FucFm[i]
            if isinstance(fm, classObj):
                del self.FucFm[i]
                return fm

        return False

    # 登录
    def login(self):
        #逻辑层实现
        pass

    def _ChangeUserExecute(self):
        self.login()
        self.InitDate()

    def _EditUserExecute(self):
        view = EditUser(UserName=g_Top.g_UserName)
        if view.exec_():
            self.ShowRight()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = MainWindow_P(mainWindow)
    mainWindow.show()
    app.exec()
    sys.exit()
