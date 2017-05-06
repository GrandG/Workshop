from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.EditUser_P import EditUser_P
from module.g_Top import g_DB

class EditUser(EditUser_P):
    def __init__(self, Dialog = None, UserName = ''):
        super(EditUser, self).__init__(Dialog, UserName)

    def GetRightName(self):
        SQL = 'select DISTINCT RightName from u_right_action'
        data = g_DB.ExecuteAndReturn(SQL)

        res = []
        for d in data:
            res.append(d['RightName'])
        return res

    def GetDepartMent(self):
        SQL = 'select DISTINCT WorkingDepartMent from u_User'
        data = g_DB.ExecuteAndReturn(SQL)

        res = []
        for d in data:
            res.append(d['WorkingDepartMent'])
        return res

    def CheckUserName(self, UserName):
        SQL = 'select UserName from u_User WHERE Username="' + UserName +'"'
        return bool(g_DB.ExecuteAndReturn(SQL))

    def GetUserInfo(self, UserName):
        SQL = 'select * from u_User WHERE Username="' + UserName + '"'
        return g_DB.ExecuteAndReturn(SQL)[0]

    def SaveUserInfo(self, data):
        for key in data.keys():
            data[key] = '"%s"' % data[key]

        condition = 'UserName=' + data['UserName']
        g_DB.update('u_User', data, condition, True)

    #不确定是否需要检查邮箱
    # def CheckEmail(self, UserName, Email):
    #     SQL = 'select UserEmailAddress from u_User WHERE UserEmailAddress="' \
    #           + Email + '" and  Username!="' + UserName +'"'
    #     return bool(g_DB.ExecuteAndReturn(SQL))

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = EditUser(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())