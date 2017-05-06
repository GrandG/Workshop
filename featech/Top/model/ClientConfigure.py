from Presenter.ClientConfigure_P import ClientConfigure_P
from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5 import QtWidgets
import sys
import os
import win32api
import platform
import pickle
from module.Crypto import *
from module.g_Top import g_Data


class ClientConfigure(ClientConfigure_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(ClientConfigure, self).__init__(Dialog, NeedShow)
        self.ShowDataToView(self.ReadConfigFile())
        pass

    def SetupODBCClick(self):
        #安装ODBC驱动
        ODBCFilePath = g_Data.path + g_Data.tools
        if os.path.exists(ODBCFilePath):
            if self.Is64bit():
                ODBCFilePath += 'mysql-connector-odbc-5.1-winx64.msi'
            else:
                ODBCFilePath += 'mysql-connector-odbc-5.1-win32.msi'

            win32api.ShellExecute(0, 'open', ODBCFilePath, '', '', 1)
        else:
            pass

    def SaveInfoClick(self):
        #保存连接服务器信息
        SaveFilePath = g_Data.path + g_Data.data
        if not os.path.exists(SaveFilePath):
            os.mkdir(SaveFilePath)

        data = self.GetDataFromViem()
        data = encrypt_dict(data)

        f = open(SaveFilePath + g_Data.MySqlConfigFileName, 'wb')
        try:
            pickle.dump(data, f)
        except:
            self._ShowMessage('文件保存失败', '警告')
        finally:
            f.close()
            self._ShowMessage('文件保存成功')

    def ReadConfigFile(self):
        data = {}
        FileName = g_Data.path + g_Data.data + g_Data.MySqlConfigFileName
        if os.path.exists(FileName):
            try:
                f = open(FileName, 'rb')
                data = deciphering_dict(pickle.load(f))
            finally:
                f.close()
        return data

    def Is64bit(self):
        # 判断电脑是否是64位
        return platform.architecture()[0] == '64bit'

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = ClientConfigure(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
