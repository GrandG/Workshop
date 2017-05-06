from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.ViewTask_P import ViewTask_P
from module.g_Top import *
from module import g_Top

class ViewTask(ViewTask_P):
    def __init__(self, isAll = False, quit = None):
        super(ViewTask, self).__init__(isAll, quit)


    def GetData(self):
        SQL = 'select U_Task.TaskName,TaskDescription,SubTaskResult,SubTaskStatus,'
        SQL += ' SubTaskOwner,SubTaskName,SubTaskStartDate, SubTaskEndDate,'
        SQL += ' SubTaskRealDate  from U_Task,U_TaskDetail'
        SQL += ' where U_Task.TaskName=U_TaskDetail.TaskName'
        SQL += ' and U_Task.TaskName="' + g_Task.Task + '"'

        return g_DB.ExecuteAndReturn(SQL)

    def GetDataIsAll(self):
        SQL = 'select * from u_User where userName="' + g_Top.g_UserName + '"'
        res = g_DB.ExecuteAndReturn(SQL)
        if not res: return False

        if res[0]['RightName'] == '主设计师':
            SQL = 'select distinct u_Task.TaskName as TaskName,' + \
                  'TaskOwner,TaskEndDate,TaskStatus from u_Task,dfr_productline ' + \
                  'where u_Task.ProductFamily=dfr_productline.productFamily ' + \
                  'and dfr_productline.DRB_Leader="' + res[0]['UserCaption'] + '"'
        else:
            SQL = 'select distinct u_Task.TaskName as TaskName,' + \
                  'TaskOwner,TaskEndDate,TaskStatus from u_Task where Taskowner="' + g_Top.g_UserName + '"'

        return g_DB.ExecuteAndReturn(SQL)

class ViewAllTask(ViewTask):
    def __init__(self, quit = None):
        super(ViewTask, self).__init__(True, quit)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = ViewTask(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())