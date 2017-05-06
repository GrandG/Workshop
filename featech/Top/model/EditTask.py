from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.EditTask_P import EditTask_P
from module.g_Top import *
from module import g_Top

class EditTask(EditTask_P):
    def __init__(self, quit = None):
        super(EditTask, self).__init__(quit)


    def GetData(self):
        SQL = 'select * from u_Task'
        return g_DB.ExecuteAndReturn(SQL)

    # 提交
    def Sumbit(self):
        g_DB.commit()

    def DelForTaskName(self, TaskName):
        condition = 'TaskName="' + TaskName + '"'
        g_DB.delete('u_Task', condition)

    def Cancle(self):
        g_DB.rollback()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = EditTask(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())