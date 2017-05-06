from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.UserManager_P import UserManager_P
from module.g_Top import *
from module import g_Top

class UserManager(UserManager_P):
    def __init__(self, quit = None):
        super(UserManager, self).__init__(quit)


    def GetData(self):
        SQL = 'select * from u_User'
        return g_DB.ExecuteAndReturn(SQL)

    def Submit(self):
        g_DB.commit()

    def DelForName(self, UserName):
        condition = 'UserName = "' + UserName + '"'
        return g_DB.delete('u_user', condition)

    def Cancle(self):
        g_DB.rollback()

    def AddDataToDB(self, data):
        for key in data.keys():
            data[key] = '"%s"' % data[key]

        g_DB.insert('u_User', data, '', False)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = UserManager(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())