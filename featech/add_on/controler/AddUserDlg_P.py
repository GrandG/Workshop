from view.AddUserDlg_Fm import *
from PyQt5.QtWidgets import QMessageBox
import sys
import re


class AddUserDlg_P(QtWidgets.QDialog, Ui_AddUserDialog):

    def __init__(self, authorityOptions, parent=None):
        super(AddUserDlg_P, self).__init__(parent)
        self.setupUi(self)
        self.ConnectSign(authorityOptions)
        self._user = False

    def ConnectSign(self, authorityOptions):
        '''
        :func   绑定事件
        '''
        self.authorityComBox.addItems(authorityOptions)         # 权限选项 list
        self.confirmBtn.clicked.connect(self._confirm)          # 确认    (按钮)
        self.exitBtn.clicked.connect(self._close)               # 退出    (按钮)

    def _confirm(self):
        '''
        :func    提交表单数据
        :return: 提交状态
        '''
        username = self.uNameEdit.text()                # 用户名  (输入框)
        password = self.uPwdEdit.text()                 # 密  码  (输入框)
        realName = self.rNameEdit.text()                # 姓  名  (输入框)
        email = self.emailEdit.text()                   # 邮  箱  (输入框)
        emailPassword = self.ePwdEdit.text()            # 邮箱密码 (输入框)
        jobNumber = self.jobNumEdit.text()              # 工  号  (输入框)
        section = self.sectionEdit.text()               # 部  门  (输入框)
        authority = self.authorityComBox.currentText()  # 权  限  (选择框)

        if not username:
            self.uNameEdit.setFocus()
            self._showMessage("您的用户名不能为空")
            return
        if len(password) < 6:
            self.uPwdEdit.setFocus()
            self._showMessage("您输入的密码过短")
            return
        if not realName:
            self.rNameEdit.setFocus()
            self._showMessage("您的姓名不能为空")
            return
        if not re.match(r'^[0-9a-zA-Z_]{0,19}@[0-9a-zA-Z]{1,13}\.[com,cn,net]{1,3}$', email):
            self.emailEdit.clear()
            self.emailEdit.setFocus()
            self._showMessage("您的邮箱地址有误")
            return
        if len(emailPassword) < 6:
            self.ePwdEdit.setFocus()
            self._showMessage("您输入的邮箱密码过短")
            return
        if not jobNumber:
            self.jobNumEdit.setFocus()
            self._showMessage("您的工号不能为空")
            return
        if not section:
            self.sectionEdit.setFocus()
            self._showMessage("您的部门不能为空")
            return

        self._user = {'UserName': username, 'UserPassword': password, 'UserCaption': realName, 'UserEmailAddress': email,
                      'UserEmailPass': emailPassword, 'WorkingID': jobNumber, 'WorkingDepartMent': section,
                      'RightName': authority}
        self.close()

    def _showMessage(self, content):
        '''
        :func  _showMessage 消息提示框
        :param content:     提示用户输入有误
        :return:
        '''
        reply = QMessageBox()
        reply.setWindowTitle("提醒")
        reply.setText(content)
        reply.exec()

    def result(self):
        '''
        :func   result  返回结果
        '''
        return self._user

    def _close(self):
        '''
        :func   _close  关闭窗口
        '''
        self.close()

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    authorityOptions = ['只读', '读写', '全部']
    window = AddUserDlg_P(authorityOptions)
    window.show()
    sys.exit(app.exec_())
