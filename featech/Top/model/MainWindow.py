from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
from Presenter.MainWindow_P import MainWindow_P
from module.g_Top import *
import module.g_Top as g_Top
from model.DFRRiskAnalyse import DFRRiskAnalyse
from model.InfoInput import InfoInput
from model.NewTesk import NewTesk
from model.RaskGrade import RaskGrade
from model.ReportModify import ReportModify
from model.ReportOutput import ReportOutput
from model.RiskTable import RiskTable
from model.StepEdit import StepEdit
from model.StepJudge import StepJudge
from model.Login import Login
import time

class MainWindow(MainWindow_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(MainWindow, self).__init__(Dialog, NeedShow)

        self.ConnectDB()

        self.login()

        # 每个子窗体对象
        self.DFRRiskAnalyse = DFRRiskAnalyse()
        self.InfoInput = InfoInput()
        self.NewTesk = NewTesk()
        self.RaskGrade = RaskGrade()
        self.ReportModify = ReportModify()
        self.ReportOutput = ReportOutput()
        self.RiskTable = RiskTable()
        self.StepEdit = StepEdit()
        self.StepJudge = StepJudge()

        self.FmLst = [self.NewTesk, self.InfoInput, self.DFRRiskAnalyse,
                      self.RaskGrade, self.StepJudge, self.StepEdit,
                      self.RiskTable, self.ReportOutput, self.ReportModify]
        self.BtnLst = [self.pBtnNewTask, self.pBtnInfoInput, self.pBtnDFRAnalyse,
                       self.pBtnRiskGrade, self.pBtnStepJudge, self.pBtnStepEdit,
                       self.pBtnRiskTable, self.pBtnReportOutput, self.pBtnReportModify]

        self.NowPageIndex = 0  # 表示当显示页的序号对应FmLst, 首先初始化未为0
        self.AddPage(self.FmLst)
        self.InitPageDate()
        self.ShowPage(self.NowPageIndex)

        self.InitDate()

    # 连接数据库
    def ConnectDB(self):
        if not g_DB.ConnectFormFile(g_Data.path + g_Data.data + g_Data.MySqlConfigFileName):
            g_Log.LogError('数据库连接失败')
            g_Log.LogDebug('失败原因：' + 'g_DB.Error')
            sys.exit()

    # 登录
    def login(self):
        lg = Login()
        lg.exec_()
        if g_Top.g_UserName == '':
            sys.exit()
        g_Log.LogInfo(g_Top.g_UserName + '：登录成功')
        time.sleep(0.1)

    # 点击下一步执行函数
    def Next(self):
        res = g_DB.delete('u_user', 'UserName="Admin"')
        g_DB.commit()
        if not self.FmLst[self.NowPageIndex].CheckAndSaveData():
            return False

        Index = self.NowPageIndex + 1
        self.ShowPage(Index)
        pass

    # 窗体事件执行函数
    def FmExecute(self, ClassName):
        for index in range(0, len(self.FmLst)):
            if self.FmLst[index].__class__.__name__ == ClassName:
                self.ShowPage(index)
                break

    # 显示指定序号的子界面
    def ShowPage(self, Index):
        self.FmLst[self.NowPageIndex].hide()
        self.FmLst[Index].show()

        self.BtnLst[self.NowPageIndex].setIcon(self.iconSure)
        self.BtnLst[Index].setIcon(self.iconNow)

        self.NowPageIndex = Index

    # 初始化页面数据，在每次新建任务的时候进行
    def InitPageDate(self):
        for Fm in self.FmLst:
            Fm.InitDate()

    # 用于显示当前序号的页面
    def ShowNowFm(self):
        self.FmLst[self.NowPageIndex].show()

    # 用于隐藏当前序号的页面
    def HideNowFm(self):
        self.FmLst[self.NowPageIndex].hide()

    # 获取任务功能管理信息
    def GetTask(self):
        # 任务管理
        SQL = 'select TaskName,ProductType,Env from u_Task'
        SQL += ' where (TaskName="' + g_Task.Task + '") and (TaskOwner="' + g_Top.g_UserName + '")'

        res = g_DB.ExecuteAndReturn(SQL)
        if not res: return False

        g_Task.ProductType = res[0]['ProductType']
        g_Task.ProductEnv = res[0]['Env']

    # 从数据库中获取当前用户权限
    def GetRight(self):
        SQL = 'select * from u_right_action where'
        SQL += ' RightName="' + g_UserInfo.LoginRights + '"'
        res = g_DB.ExecuteAndReturn(SQL)
        if res: return res[0]
        else: return False

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = MainWindow(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
