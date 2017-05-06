# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\login.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_DlgLogin(object):
    def setupUi(self, DlgLogin):
        DlgLogin.setObjectName("DlgLogin")
        DlgLogin.resize(358, 256)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        DlgLogin.setWindowIcon(icon)
        self.pbConfirm = QtWidgets.QPushButton(DlgLogin)
        self.pbConfirm.setGeometry(QtCore.QRect(116, 209, 91, 21))
        self.pbConfirm.setObjectName("pbConfirm")
        self.pbQuit = QtWidgets.QPushButton(DlgLogin)
        self.pbQuit.setGeometry(QtCore.QRect(226, 209, 91, 21))
        self.pbQuit.setObjectName("pbQuit")
        self.label_img = QtWidgets.QLabel(DlgLogin)
        self.label_img.setGeometry(QtCore.QRect(20, 10, 330, 83))
        self.label_img.setText("")
        self.label_img.setPixmap(QtGui.QPixmap(":/new/wl/logo.png"))
        self.label_img.setObjectName("label_img")
        self.verticalLayoutWidget = QtWidgets.QWidget(DlgLogin)
        self.verticalLayoutWidget.setGeometry(QtCore.QRect(10, 113, 71, 80))
        self.verticalLayoutWidget.setObjectName("verticalLayoutWidget")
        self.verticalLayout = QtWidgets.QVBoxLayout(self.verticalLayoutWidget)
        self.verticalLayout.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout.setObjectName("verticalLayout")
        self.label = QtWidgets.QLabel(self.verticalLayoutWidget)
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(False)
        font.setWeight(50)
        self.label.setFont(font)
        self.label.setLineWidth(1)
        self.label.setObjectName("label")
        self.verticalLayout.addWidget(self.label)
        self.label_2 = QtWidgets.QLabel(self.verticalLayoutWidget)
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(False)
        font.setWeight(50)
        self.label_2.setFont(font)
        self.label_2.setObjectName("label_2")
        self.verticalLayout.addWidget(self.label_2)
        self.label_3 = QtWidgets.QLabel(self.verticalLayoutWidget)
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(False)
        font.setWeight(50)
        self.label_3.setFont(font)
        self.label_3.setObjectName("label_3")
        self.verticalLayout.addWidget(self.label_3)
        self.comboBoxTask = QtWidgets.QComboBox(DlgLogin)
        self.comboBoxTask.setGeometry(QtCore.QRect(110, 173, 229, 20))
        self.comboBoxTask.setObjectName("comboBoxTask")
        self.lineEditPassword = QtWidgets.QLineEdit(DlgLogin)
        self.lineEditPassword.setGeometry(QtCore.QRect(110, 143, 229, 20))
        self.lineEditPassword.setEchoMode(QtWidgets.QLineEdit.Password)
        self.lineEditPassword.setObjectName("lineEditPassword")
        self.lineEditName = QtWidgets.QLineEdit(DlgLogin)
        self.lineEditName.setGeometry(QtCore.QRect(110, 115, 229, 20))
        self.lineEditName.setFrame(True)
        self.lineEditName.setEchoMode(QtWidgets.QLineEdit.Normal)
        self.lineEditName.setObjectName("lineEditName")

        self.retranslateUi(DlgLogin)
        QtCore.QMetaObject.connectSlotsByName(DlgLogin)
        DlgLogin.setTabOrder(self.lineEditName, self.lineEditPassword)
        DlgLogin.setTabOrder(self.lineEditPassword, self.comboBoxTask)
        DlgLogin.setTabOrder(self.comboBoxTask, self.pbConfirm)
        DlgLogin.setTabOrder(self.pbConfirm, self.pbQuit)

    def retranslateUi(self, DlgLogin):
        _translate = QtCore.QCoreApplication.translate
        DlgLogin.setWindowTitle(_translate("DlgLogin", "登录"))
        self.pbConfirm.setText(_translate("DlgLogin", "确认"))
        self.pbQuit.setText(_translate("DlgLogin", "退出"))
        self.label.setText(_translate("DlgLogin", "用 户 名："))
        self.label_2.setText(_translate("DlgLogin", "密    码："))
        self.label_3.setText(_translate("DlgLogin", "选择任务："))

import Top_rc
