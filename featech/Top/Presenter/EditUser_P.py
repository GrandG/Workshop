from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
import re
from view.EditUser_Fm import Ui_EditUser

class EditUser_P(QtWidgets.QDialog, Ui_EditUser):
    def __init__(self, Dialog = None, UserName = ''):
        super(EditUser_P, self).__init__()
        if Dialog == None:
            super().setupUi(self)
        else:
            super().setupUi(Dialog)

        self.ConnectSign()
        self.ShowData(UserName)

    def ConnectSign(self):
        self.pushButtonQuit.clicked.connect(self.QuitClick)
        self.pushButtonSubmit.clicked.connect(self.SubmitClick)

    def QuitClick(self):
        self.reject()
        self.close()

    def SubmitClick(self):
        if self.CheckData():
            if not self.lineEditUserName.isEnabled():       #表明是修改当前用户信息，需要就地保存
                self.SaveUserInfo(self.GetData())
            self.accept()

    def GetData(self):
        res = {}
        res.setdefault('UserName', self.lineEditUserName.text())
        res.setdefault('WorkingID', self.lineEditNO.text())
        res.setdefault('WorkingDepartMent', self.comboBoxDepart.currentText())
        res.setdefault('RightName', self.comboBoxRightName.currentText())
        res.setdefault('UserPassword', self.lineEditPassword.text())
        res.setdefault('UserEmailAddress', self.lineEditEmail.text())
        res.setdefault('UserEmailPass', self.lineEditEmailPassword.text())
        res.setdefault('UserCaption', self.lineEditCaption.text())
        return res

    def CheckData(self):
        if self.lineEditUserName.isEnabled():
            if not self.lineEditUserName.text():
                self.lineEditUserName.setFocus()
                self._ShowMessage("您的用户名不能为空")
                return False
            if self.CheckUserName(self.lineEditUserName.text()):
                self.lineEditUserName.setFocus()
                self._ShowMessage("您输入的用户名已存在，请再输入")
                return False
            if not self.lineEditCaption.text():
                self.lineEditCaption.setFocus()
                self._ShowMessage("您的姓名不能为空")
                return False
        # if not re.match(r'^[0-9a-zA-Z_]{0,19}@[0-9a-zA-Z]{1,13}\.[com,cn,net]{1,3}$', self.lineEditEmail.text()):
        #     self.lineEditEmail.setFocus()
        #     self._ShowMessage("您的邮箱地址有误")
        #     return False
        if not self.lineEditNO.text():
            self.lineEditNO.setFocus()
            self._ShowMessage("您的工号不能为空")
            return False
        return True

    def GetRightName(self):
        pass

    def GetDepartMent(self):
        pass

    def CheckUserName(self, UserName):
        pass

    def GetUserInfo(self, UserName):
        pass

    def SaveUserInfo(self, data):
        pass

    # 不确定是否需要检查邮箱
    # def CheckEmail(self, UserName, Email):
    #     pass

    def ShowData(self, UserName = ''):
        self.comboBoxDepart.addItems(self.GetDepartMent())
        self.comboBoxRightName.addItems(self.GetRightName())

        data = self.GetUserInfo(UserName)
        if not data:
            # self._ShowMessage('用户名不存在')
            self.QuitClick()
        self.lineEditUserName.setText(UserName)
        self.lineEditNO.setText(data['WorkingID'])
        self.comboBoxDepart.setCurrentText(data['WorkingDepartMent'])
        self.comboBoxRightName.setCurrentText(data['RightName'])
        self.lineEditPassword.setText(data['UserPassword'])
        self.lineEditEmail.setText(data['UserEmailAddress'])
        self.lineEditEmailPassword.setText(data['UserEmailPass'])
        self.lineEditCaption.setText(data['UserCaption'])

        self.lineEditUserName.setEnabled(False) #不允许修改用户名


    def _ShowMessage(self, content):
        QtWidgets.QMessageBox.information(self, ('提示'), content)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = EditUser_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())


