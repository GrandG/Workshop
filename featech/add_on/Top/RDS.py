from model.MainWindow import MainWindow
from model.Login import Login
from module.g_Top import *
import module.g_Top as g_Top
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys

if __name__ == '__main__':
    try:
        if not g_DB.ConnectFormFile(g_Data.path + g_Data.data + g_Data.MySqlConfigFileName):
            g_Log.LogError('数据库连接失败')
            g_Log.LogDebug('失败原因：' + g_DB.Error)
            sys.exit()
        app = QApplication(sys.argv)
        logWindow = QMainWindow()
        ui = Login(logWindow)
        logWindow.show()
        status = app.exec()

        if g_Top.g_UserName != '':
            g_Log.LogInfo(g_UserName + '：登录成功')
            logWindow.close()
            mainWindow = QMainWindow()
            ui = MainWindow(mainWindow)
            mainWindow.show()
            status = app.exec()
            g_Log.LogInfo(g_UserName + '：退出')

        sys.exit(status)
    finally:
        if g_DB:
            g_DB.close()