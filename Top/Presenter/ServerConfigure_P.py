from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.ServerConfigure_Fm import Ui_DlgServerConfigure
from module.g_Top import g_Data

class ServerConfigure_P(QtWidgets.QDialog, Ui_DlgServerConfigure):
    def __init__(self, Dialog=None, NeedShow=True):
        super(ServerConfigure_P, self).__init__()
        if Dialog == None:
            super().setupUi(self)
        else:
            super().setupUi(Dialog)
            self.ConnectSign()

    def ConnectSign(self):
        self.toolButtonDumpPath.clicked.connect(self.DumpPathClick)
        self.toolButtonDBFilePath.clicked.connect(self.DBFilePathClick)
        self.pbSetupODBC.clicked.connect(self.SetupODBCClick)
        self.pbSaveInfo.clicked.connect(self.SaveInfoClick)
        self.pbReductionDB.clicked.connect(self.ReductionDBClick)
        self.qbQuit.clicked.connect(self.QuitClick)

    def QuitClick(self):
        QApplication.quit()

    def DumpPathClick(self):
        #输入MySQLDump文件路径
        pass

    def DBFilePathClick(self):
        # 输入MySQLDump文件路径
        pass

    def SetupODBCClick(self):
        #安装ODBC驱动
        # 由逻辑控制模块实现
        pass

    def SaveInfoClick(self):
        #保存连接服务器信息
        # 由逻辑控制模块实现
        pass

    def ReductionDBClick(self):
        #还原数据库
        #由逻辑控制模块实现
        pass

    def ShowDataToView(self, dict):
        self.lineEditDump.setText(dict.get('Dump', 'C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump.exe'))
        self.lineEditServerAdds.setText(dict.get('ServerAdds', '127.0.0.0'))
        self.lineEditServerPort.setText(dict.get('ServerPort', '3306'))
        self.lineEditUserName.setText(dict.get('UserName', 'root'))
        self.lineEditPassword.setText(dict.get('Password', 'FEATECH'))
        self.lineEditDB.setText(dict.get('DB', 'IDS'))
        FileName = g_Data.path + g_Data.data
        self.lineEditDBFilePath.setText(dict.get('DBFilePath', FileName + 'IDS.sql'))

    def GetDataFromView(self):
        data = {}
        data.setdefault('Dump', self.lineEditDump.text())
        data.setdefault('ServerAdds', self.lineEditServerAdds.text())
        data.setdefault('ServerPort', self.lineEditServerPort.text())
        data.setdefault('UserName', self.lineEditUserName.text())
        data.setdefault('Password', self.lineEditPassword.text())
        data.setdefault('DB', self.lineEditDB.text())
        data.setdefault('DBFilePath', self.lineEditDBFilePath.text())

        return data



    def Is64bit(self):
        #判断电脑是否是64位
        #由逻辑控制模块实现
        pass

    def _ShowMessage(self, content, title = '提示'):
        QtWidgets.QMessageBox.information(self, title, content)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = ServerConfigure_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
