from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.RuleQuery_P import RuleQuery_P
from module.g_Top import *

class RuleQuery(RuleQuery_P):
    def __init__(self, quit = None):
        super(RuleQuery, self).__init__(quit)


    def GetData(self):
        SQL = 'select U_Task.TaskName,U_Task.TaskDescription,U_TaskDetail.SubTaskResult,\
              U_TaskDetail.SubTaskOwner,U_TaskDetail.SubTaskName,U_TaskDetail.SubTaskStartDate, \
              U_TaskDetail.SubTaskEndDate,U_TaskDetail.SubTaskRealDate  from U_Task,U_TaskDetail,\
              general_info where U_Task.TaskName=U_TaskDetail.TaskName and \
              general_info.name=U_Taskdetail.subTaskStatus'

        return g_DB.ExecuteAndReturn(SQL)

    # 过滤
    def Filter(self):
        pass


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = RuleQuery(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())