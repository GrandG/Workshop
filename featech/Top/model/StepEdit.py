from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox
import sys
from Presenter.StepEdit_P import StepEdit_P
from module.g_Top import *
import time

class StepEdit(StepEdit_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(StepEdit, self).__init__(Dialog, NeedShow)
        pass

    # 主页面点击下一步时对当前页面的数据合法性进行检查,并保存数据，检查完成返回True否则返回False
    def CheckAndSaveData(self):
        if not self.NextConfirm(): return False

        data = {}
        now = str(time.strftime("%Y/%m/%d", time.localtime()))
        data.setdefault('SubTaskRealDate', '"%s"' % now)
        data.setdefault('SubTaskStatus', '"已完成"')
        condition = 'TaskName="' + g_Task.Task + '" and SubTaskID=5'
        g_DB.insert('U_TaskDetail', data, condition)

        data = {}
        data.setdefault('SubTaskStatus', '"进行中"')
        condition = 'TaskName="' + g_Task.Task + '" and SubTaskID=6'
        g_DB.insert('U_TaskDetail', data, condition)

        data = {}
        data.setdefault('SubTaskStatus', '"未启动"')
        condition = 'TaskName="' + g_Task.Task + '" and SubTaskID>6'
        g_DB.insert('U_TaskDetail', data, condition)

        #????????
        data = {}
        data.setdefault('TaskStatus', '-10000')
        data.setdefault('TaskStatus', '-10000')
        condition = 'TaskName="' + g_Task.Task + '"'
        g_DB.insert('U_TaskDetail', data, condition)

        return True

    # RPN排序
    def RPNSort(self):
        self.sql = self.GetSqlText() + 'where taskName="' + g_Task.Task + '" order by CalRPN desc'

    # 过滤风险
    def FilterTOPRisk(self):
        self.sql = self.GetSqlText() + 'where taskName="' + g_Task.Task + '" order by CalRPN desc limit ' + self.GetTopNo()

    # 显示所有风险项
    def ShowAll(self):
        self.sql = self.GetSqlText() + 'where taskName="' + g_Task.Task + '" order by CalRPN desc'

    # 手动添加风险
    def HandAddRask(self):
        n = self.sql.lower().find('where') + 5
        condition = self.sql[n, len(self.sql)]
        data = {}
        data.setdefault('Type', '"手动添加"')
        g_DB.insert('u_FMEADetail', data, condition)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = StepEdit(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())