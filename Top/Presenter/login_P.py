from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from view.login_Fm import Ui_DlgLogin

class Login_P(QtWidgets.QDialog, Ui_DlgLogin):
    def __init__(self, Dialog=None):
        super(Login_P, self).__init__()
        if Dialog == None:
            super().setupUi(self)
        else:
            super().setupUi(Dialog)

        self.ConnectSign()
        self.lineEditName.setText('Admin')
        self.lineEditPassword.setText('123')
        self.ShowTaskData(None)

    def SetTaskContent(self, Lst):
        self.comboBoxTask.clear()
        self.comboBoxTask.addItems(Lst)

    def ConfirmClick(self):
        res = self.confirm(self.lineEditName.text(), self.lineEditPassword.text(),
                           self.comboBoxTask.currentText())
        if res: QtWidgets.QMessageBox.information(self, ('提示'), res)
        else: self.QuitClick()

    def confirm(self, name, password, task):
        #由逻辑控制模块实现
        pass

    def QuitClick(self):
        self.close()
        # QApplication.quit()

    # 绑定事件
    def ConnectSign(self):
        self.pbConfirm.clicked.connect(self.ConfirmClick)
        self.pbQuit.clicked.connect(self.QuitClick)
        self.lineEditName.focusOutEvent = self.ShowTaskData

    def ShowTaskData(self, event):
        task = self.GetTaskData(self.lineEditName.text())

        if task:
            self.comboBoxTask.clear()
            self.comboBoxTask.addItems(task)
            # self.comboBoxTask.setCurrentIndex(-1)

    # 获取任务数据
    def GetTaskData(self):
        #由逻辑层实现
        pass

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = Login_P(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
