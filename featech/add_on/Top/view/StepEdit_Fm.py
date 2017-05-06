# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\StepEdit.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_StepEdit(object):
    def setupUi(self, StepEdit):
        StepEdit.setObjectName("StepEdit")
        StepEdit.resize(743, 575)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        StepEdit.setWindowIcon(icon)
        self.groupBox = QtWidgets.QGroupBox(StepEdit)
        self.groupBox.setGeometry(QtCore.QRect(0, 0, 731, 571))
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")
        self.groupBox_2 = QtWidgets.QGroupBox(self.groupBox)
        self.groupBox_2.setGeometry(QtCore.QRect(2, 2, 731, 381))
        self.groupBox_2.setTitle("")
        self.groupBox_2.setObjectName("groupBox_2")
        self.groupBox_3 = QtWidgets.QGroupBox(self.groupBox_2)
        self.groupBox_3.setGeometry(QtCore.QRect(0, 339, 731, 41))
        self.groupBox_3.setTitle("")
        self.groupBox_3.setObjectName("groupBox_3")
        self.pBtnHandAddRask = QtWidgets.QPushButton(self.groupBox_3)
        self.pBtnHandAddRask.setGeometry(QtCore.QRect(10, 10, 121, 23))
        self.pBtnHandAddRask.setObjectName("pBtnHandAddRask")
        self.groupBox_4 = QtWidgets.QGroupBox(self.groupBox)
        self.groupBox_4.setGeometry(QtCore.QRect(2, 380, 731, 151))
        self.groupBox_4.setTitle("")
        self.groupBox_4.setObjectName("groupBox_4")
        self.label = QtWidgets.QLabel(self.groupBox_4)
        self.label.setGeometry(QtCore.QRect(10, 10, 91, 16))
        self.label.setObjectName("label")
        self.groupBox_5 = QtWidgets.QGroupBox(self.groupBox)
        self.groupBox_5.setGeometry(QtCore.QRect(0, 530, 731, 41))
        self.groupBox_5.setTitle("")
        self.groupBox_5.setObjectName("groupBox_5")
        self.pBtnRPNSort = QtWidgets.QPushButton(self.groupBox_5)
        self.pBtnRPNSort.setGeometry(QtCore.QRect(9, 10, 121, 23))
        self.pBtnRPNSort.setObjectName("pBtnRPNSort")
        self.pBtnShowAll = QtWidgets.QPushButton(self.groupBox_5)
        self.pBtnShowAll.setGeometry(QtCore.QRect(330, 10, 121, 23))
        self.pBtnShowAll.setObjectName("pBtnShowAll")
        self.pBtnFilterTOPRisk = QtWidgets.QPushButton(self.groupBox_5)
        self.pBtnFilterTOPRisk.setGeometry(QtCore.QRect(190, 10, 121, 23))
        self.pBtnFilterTOPRisk.setObjectName("pBtnFilterTOPRisk")

        self.retranslateUi(StepEdit)
        QtCore.QMetaObject.connectSlotsByName(StepEdit)

    def retranslateUi(self, StepEdit):
        _translate = QtCore.QCoreApplication.translate
        StepEdit.setWindowTitle(_translate("StepEdit", "Dialog"))
        self.pBtnHandAddRask.setText(_translate("StepEdit", "手动增加风险"))
        self.label.setText(_translate("StepEdit", "专家意见列表："))
        self.pBtnRPNSort.setText(_translate("StepEdit", "RPN风险排序"))
        self.pBtnShowAll.setText(_translate("StepEdit", "显示所有风险项"))
        self.pBtnFilterTOPRisk.setText(_translate("StepEdit", "过滤TOP(N)风险项"))

import Top_rc
