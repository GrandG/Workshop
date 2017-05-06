from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.login_P import Login_P
from module.g_Top import *
import module.g_Top as g_Top

class Login(Login_P):
    def __init__(self, Dialog=None):
        super(Login, self).__init__(Dialog)
        pass

    # 确认
    def confirm(self, name, password, task):
        res, err = self.confirmation(name, password)
        if not res: return err

        g_Top.g_UserName = res['UserName']
        g_UserInfo.LoginRights = res['RightName']
        g_Task.Task = self.comboBoxTask.currentText()

        return ''

    # 验证用户名密码
    def confirmation(self, name, password):
        SQL = 'select UserName,UserPassword,RightName'
        SQL += ' from U_User where UserName="' + name + '"'
        if not g_DB.Execute(SQL): return None, '数据库操作错误'
        if g_DB.isEmpty(): return None, '用户名不存在！'

        res = g_DB.fetchRow()
        if not res: return None, '数据库操作错误'
        if res['UserPassword'] != password: return None, '密码错误！'

        return res, ''

    # 获取任务数据
    def GetTaskData(self, UserName):
        SQL = 'SELECT distinct TaskName from U_TaskDetail'
        SQL += ' where (SubTaskOwner="' + UserName + '") and (SubTaskStatus<>"已完成")'

        res = g_DB.ExecuteAndReturn(SQL)
        if not res: return False

        result = []
        for data in res:
            result.append(data['TaskName'])

        return result

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = Login(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())