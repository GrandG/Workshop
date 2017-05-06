from Presenter.ServerConfigure_P import ServerConfigure_P
from PyQt5 import QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
import os
import platform
import win32api
import pickle
from module.Crypto import *
from module.g_Top import g_Data


class ServerConfigure(ServerConfigure_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(ServerConfigure, self).__init__(Dialog, NeedShow)

        self.ShowDataToView(self.ReadConfigFile())
        pass

    def SetupODBCClick(self):
        #安装ODBC驱动
        ODBCFilePath = g_Data.path + g_Data.tools
        if self.Is64bit():
            ODBCFilePath += 'mysql-connector-odbc-5.1-winx64.msi'
        else:
            ODBCFilePath += 'mysql-connector-odbc-5.1-win32.msi'

        win32api.ShellExecute(0, 'open', ODBCFilePath, '', '', 1)

    def SaveInfoClick(self):
        #保存连接服务器信息
        SaveFilePath = g_Data.path + g_Data.data
        if not os.path.exists(SaveFilePath):
            os.mkdir(SaveFilePath)

        data = self.GetDataFromView()
        data = encrypt_dict(data)

        f = open(SaveFilePath + g_Data.MySqlConfigFileName, 'wb')
        try:
            pickle.dump(data, f)
        except:
            QtWidgets.QMessageBox.warning(self, ('警告'), ('文件保存失败'))
        finally:
            f.close()
            QtWidgets.QMessageBox.information(self, ('提示'), ('文件保存成功'))

    def ReadConfigFile(self):
        data = {}
        FileName = g_Data.path + g_Data.data + g_Data.MySqlConfigFileName
        if os.path.exists(FileName) :
            f = open(FileName, 'rb')
            data = deciphering_dict(pickle.load(f))
            f.close()
        return data

    def ReductionDBClick(self):
        #还原数据库
        from module.g_Top import g_DB
        Error = ''
        try:
            if not g_DB.GetConnectState:
                if not g_DB.ConnectFormFile(g_Data.path + g_Data.data + g_Data.MySqlConfigFileName):
                    Error = g_DB.error
                    return False

            sqlstr = 'create database ' + self.lineEditDB.text()
            if not os.path.exists(self.lineEditDBFilePath.text()):
                Error = '数据库文件不存在！'
                return False

            if not g_DB.Execute(sqlstr):
                Error = g_DB.error
                return False

            path = os.path.abspath(self.lineEditDump.text())
            scmd = '"{Path}" -h {host} -P {ServerAdds} -u {UserName} -p {password} -B {DB} < {DBFilePath}'.format(
                Path = path, host = self.lineEditServerAdds.text(),
                UserName = self.lineEditUserName.text(),
                password = self.lineEditPassword.text(),
                DB = self.lineEditDB.text(),
                DBFilePath = self.lineEditDBFilePath.text()
            )
            try:
                win32api.ShellExecute(0, 'open', 'cmd.exe', '/c'.join(scmd), '', 1)
            except Exception as e:
                Error = '导入脚本不合法：' + str(e)
                return False

            QtWidgets.QMessageBox.information(self, ('提示'), ('数据库还原成功！'))
            return True
        finally:
            g_DB.close()
            if len(Error) > 0:
                QtWidgets.QMessageBox.warning(self, ('错误'), (Error))
        pass

    def Is64bit(self):
        # 判断电脑是否是64位
        return platform.architecture()[0] == '64bit'


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = ServerConfigure(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())