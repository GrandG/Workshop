import re

from PyQt5.QtWidgets import QMessageBox

from controler.AddUserDlg_P import *


class AddUserDlg(AddUserDlg_P):
    def __init__(self, authorityOptions):
        super(AddUserDlg, self).__init__(authorityOptions)

    def getUserInfo(self):
        '''
        :func   getUserInfo 获取添加的用户信息
        '''
        data = self.result()
        return data



if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    authorityOptions = ['只读', '读写', '全部']
    window = AddUserDlg(authorityOptions)
    window.show()
    sys.exit(app.exec_())