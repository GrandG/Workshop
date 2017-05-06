from model.MainWindow import MainWindow
from model.Login import Login
from module.g_Top import *
import module.g_Top as g_Top
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys

if __name__ == '__main__':
    try:
        app = QApplication(sys.argv)
        mainWindow = QMainWindow()
        ui = MainWindow(mainWindow)
        mainWindow.show()
        g_Log.LogInfo(g_Top.g_UserName + '：退出')
        sys.exit(app.exec())
    finally:
        if g_DB:
            g_DB.close()