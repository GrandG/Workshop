from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.ClientConfigure_Fm import Ui_DlgClientConfigure
from module.g_Top import g_Data

class ClientConfigure_P(Ui_DlgClientConfigure):
    def __init__(self, Dialog=None, NeedShow=True):
        super(ClientConfigure_P, self).__init__()

        if NeedShow:
            if Dialog == None:
                super().setupUi(self)
            else:
                super().setupUi(Dialog)

        self.ConnectSign()

    def ConnectSign(self):
        self.pbSetupODBC.clicked.connect(self.SetupODBCClick)
        self.pbSaveInfo.clicked.connect(self.SaveInfoClick)
        self.qbQuit.clicked.connect(self.QuitClick)

    def QuitClick(self):
        QApplication.quit()

    def SetupODBCClick(self):
        #安装ODBC驱动
        # 由逻辑控制模块实现
        pass

    def SaveInfoClick(self):
        #保存连接服务器信息
        # 由逻辑控制模块实现
        pass

    def ShowDataToView(self, data):
        self.lineEditServerAddr.setText(data.get('ServerAddr', '127.0.0.1'))
        self.lineEditServerPort.setText(data.get('ServerPort', '3306'))
        self.lineEditUserName.setText(data.get('UserName', 'root'))
        self.lineEditPassword.setText(data.get('Password', 'FEATECH'))
        self.lineEditDB.setText(data.get('DB', 'IDS'))

    def GetDataFromViem(self):
        data = {}

        data.setdefault('ServerPort', self.lineEditServerPort.text())
        data.setdefault('ServerAddr', self.lineEditServerAddr.text())
        data.setdefault('UserName', self.lineEditUserName.text())
        data.setdefault('Password', self.lineEditPassword.text())
        data.setdefault('DB', self.lineEditDB.text())

        return data


    def Is64bit(self):
        #判断电脑是否是64位
        #由逻辑控制模块实现
        pass

    def _ShowMessage(self, content, title = '提示'):
        QtWidgets.QMessageBox.information(None, title, content)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = ClientConfigure_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
