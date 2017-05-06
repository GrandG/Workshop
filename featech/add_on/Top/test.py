from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from login_Fm import Ui_DlgLogin

class Login_M(Ui_DlgLogin):
    def exec(self):
        QtWidgets.QMessageBox.information(self.pbConfirm, "标题", "测试")

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = Login_M()
    ui.setupUi(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())