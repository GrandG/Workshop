# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\InfoInput.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_InfoInput(object):
    def setupUi(self, InfoInput):
        InfoInput.setObjectName("InfoInput")
        InfoInput.resize(741, 579)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        InfoInput.setWindowIcon(icon)
        self.groupBox = QtWidgets.QGroupBox(InfoInput)
        self.groupBox.setGeometry(QtCore.QRect(4, 4, 731, 571))
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")
        self.groupBoxTop = QtWidgets.QGroupBox(self.groupBox)
        self.groupBoxTop.setGeometry(QtCore.QRect(10, 80, 711, 451))
        self.groupBoxTop.setObjectName("groupBoxTop")
        self.groupBox_10 = QtWidgets.QGroupBox(self.groupBox)
        self.groupBox_10.setGeometry(QtCore.QRect(10, 10, 701, 71))
        self.groupBox_10.setTitle("")
        self.groupBox_10.setObjectName("groupBox_10")
        self.verticalLayoutWidget_2 = QtWidgets.QWidget(self.groupBox_10)
        self.verticalLayoutWidget_2.setGeometry(QtCore.QRect(10, 10, 88, 51))
        self.verticalLayoutWidget_2.setObjectName("verticalLayoutWidget_2")
        self.verticalLayout_2 = QtWidgets.QVBoxLayout(self.verticalLayoutWidget_2)
        self.verticalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.label_21 = QtWidgets.QLabel(self.verticalLayoutWidget_2)
        self.label_21.setObjectName("label_21")
        self.verticalLayout_2.addWidget(self.label_21)
        self.label_20 = QtWidgets.QLabel(self.verticalLayoutWidget_2)
        self.label_20.setObjectName("label_20")
        self.verticalLayout_2.addWidget(self.label_20)
        self.lineEditBDMPos = QtWidgets.QLineEdit(self.groupBox_10)
        self.lineEditBDMPos.setGeometry(QtCore.QRect(110, 10, 481, 20))
        self.lineEditBDMPos.setObjectName("lineEditBDMPos")
        self.lineEditBrdPos = QtWidgets.QLineEdit(self.groupBox_10)
        self.lineEditBrdPos.setGeometry(QtCore.QRect(110, 40, 481, 20))
        self.lineEditBrdPos.setObjectName("lineEditBrdPos")
        self.toolButtonBDM = QtWidgets.QToolButton(self.groupBox_10)
        self.toolButtonBDM.setGeometry(QtCore.QRect(600, 10, 37, 18))
        self.toolButtonBDM.setObjectName("toolButtonBDM")
        self.toolButtonBrd = QtWidgets.QToolButton(self.groupBox_10)
        self.toolButtonBrd.setGeometry(QtCore.QRect(600, 40, 37, 18))
        self.toolButtonBrd.setObjectName("toolButtonBrd")
        self.pbSubmit = QtWidgets.QPushButton(self.groupBox)
        self.pbSubmit.setGeometry(QtCore.QRect(621, 536, 101, 31))
        self.pbSubmit.setObjectName("pbSubmit")

        self.retranslateUi(InfoInput)
        QtCore.QMetaObject.connectSlotsByName(InfoInput)
        InfoInput.setTabOrder(self.lineEditBDMPos, self.lineEditBrdPos)
        InfoInput.setTabOrder(self.lineEditBrdPos, self.pbSubmit)
        InfoInput.setTabOrder(self.pbSubmit, self.toolButtonBDM)
        InfoInput.setTabOrder(self.toolButtonBDM, self.toolButtonBrd)

    def retranslateUi(self, InfoInput):
        _translate = QtCore.QCoreApplication.translate
        InfoInput.setWindowTitle(_translate("InfoInput", "Dialog"))
        self.groupBoxTop.setTitle(_translate("InfoInput", "参数输入"))
        self.label_21.setText(_translate("InfoInput", "BDM文件位置："))
        self.label_20.setText(_translate("InfoInput", "Brd文件位置："))
        self.toolButtonBDM.setText(_translate("InfoInput", "..."))
        self.toolButtonBrd.setText(_translate("InfoInput", "..."))
        self.pbSubmit.setText(_translate("InfoInput", "确认提交"))

import Top_rc
