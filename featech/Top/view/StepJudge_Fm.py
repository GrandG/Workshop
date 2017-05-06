# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\StepJudge.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_StepJudge(object):
    def setupUi(self, StepJudge):
        StepJudge.setObjectName("StepJudge")
        StepJudge.resize(738, 579)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        StepJudge.setWindowIcon(icon)
        self.groupBox = QtWidgets.QGroupBox(StepJudge)
        self.groupBox.setGeometry(QtCore.QRect(4, 4, 731, 571))
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")
        self.groupBox_10 = QtWidgets.QGroupBox(self.groupBox)
        self.groupBox_10.setGeometry(QtCore.QRect(5, 5, 721, 451))
        self.groupBox_10.setTitle("")
        self.groupBox_10.setObjectName("groupBox_10")
        self.groupBoxDate = QtWidgets.QGroupBox(self.groupBox_10)
        self.groupBoxDate.setGeometry(QtCore.QRect(0, 0, 715, 421))
        self.groupBoxDate.setTitle("")
        self.groupBoxDate.setObjectName("groupBoxDate")
        self.pBtnRPNSort = QtWidgets.QPushButton(self.groupBox_10)
        self.pBtnRPNSort.setGeometry(QtCore.QRect(6, 422, 121, 23))
        self.pBtnRPNSort.setObjectName("pBtnRPNSort")
        self.spinBox = QtWidgets.QSpinBox(self.groupBox_10)
        self.spinBox.setGeometry(QtCore.QRect(320, 423, 91, 22))
        self.spinBox.setObjectName("spinBox")
        self.pBtnFilterTOPRisk = QtWidgets.QPushButton(self.groupBox_10)
        self.pBtnFilterTOPRisk.setGeometry(QtCore.QRect(430, 423, 121, 23))
        self.pBtnFilterTOPRisk.setObjectName("pBtnFilterTOPRisk")
        self.pBtnShowAll = QtWidgets.QPushButton(self.groupBox_10)
        self.pBtnShowAll.setGeometry(QtCore.QRect(570, 423, 121, 23))
        self.pBtnShowAll.setObjectName("pBtnShowAll")
        self.groupBox_11 = QtWidgets.QGroupBox(self.groupBox)
        self.groupBox_11.setGeometry(QtCore.QRect(6, 456, 721, 111))
        self.groupBox_11.setTitle("")
        self.groupBox_11.setObjectName("groupBox_11")
        self.label_7 = QtWidgets.QLabel(self.groupBox_11)
        self.label_7.setGeometry(QtCore.QRect(10, 10, 161, 16))
        self.label_7.setObjectName("label_7")
        self.textEditFEAMExpert = QtWidgets.QTextEdit(self.groupBox_11)
        self.textEditFEAMExpert.setGeometry(QtCore.QRect(0, 30, 721, 81))
        self.textEditFEAMExpert.setObjectName("textEditFEAMExpert")

        self.retranslateUi(StepJudge)
        QtCore.QMetaObject.connectSlotsByName(StepJudge)

    def retranslateUi(self, StepJudge):
        _translate = QtCore.QCoreApplication.translate
        StepJudge.setWindowTitle(_translate("StepJudge", "Dialog"))
        self.pBtnRPNSort.setText(_translate("StepJudge", "RPN风险排序"))
        self.pBtnFilterTOPRisk.setText(_translate("StepJudge", "过滤TOP(N)风险项"))
        self.pBtnShowAll.setText(_translate("StepJudge", "显示所有风险项"))
        self.label_7.setText(_translate("StepJudge", "请指定FEMA措施评审专家："))

import Top_rc
