# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\RaskGrade.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_RaskGrade(object):
    def setupUi(self, RaskGrade):
        RaskGrade.setObjectName("RaskGrade")
        RaskGrade.resize(738, 578)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        RaskGrade.setWindowIcon(icon)
        self.groupBox = QtWidgets.QGroupBox(RaskGrade)
        self.groupBox.setGeometry(QtCore.QRect(3, 2, 731, 571))
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")
        self.groupBox_2 = QtWidgets.QGroupBox(self.groupBox)
        self.groupBox_2.setGeometry(QtCore.QRect(0, 330, 721, 61))
        self.groupBox_2.setTitle("")
        self.groupBox_2.setObjectName("groupBox_2")
        self.horizontalLayoutWidget = QtWidgets.QWidget(self.groupBox_2)
        self.horizontalLayoutWidget.setGeometry(QtCore.QRect(0, 10, 341, 41))
        self.horizontalLayoutWidget.setObjectName("horizontalLayoutWidget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.horizontalLayoutWidget)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.pbInheritRask = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.pbInheritRask.setObjectName("pbInheritRask")
        self.horizontalLayout.addWidget(self.pbInheritRask)
        self.pbHandAddRask = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.pbHandAddRask.setObjectName("pbHandAddRask")
        self.horizontalLayout.addWidget(self.pbHandAddRask)
        self.pbDelHandRask = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.pbDelHandRask.setObjectName("pbDelHandRask")
        self.horizontalLayout.addWidget(self.pbDelHandRask)
        self.groupBox_3 = QtWidgets.QGroupBox(self.groupBox)
        self.groupBox_3.setGeometry(QtCore.QRect(0, 390, 731, 181))
        self.groupBox_3.setTitle("")
        self.groupBox_3.setObjectName("groupBox_3")
        self.label = QtWidgets.QLabel(self.groupBox_3)
        self.label.setGeometry(QtCore.QRect(6, 10, 161, 16))
        self.label.setObjectName("label")
        self.plainTextEditExpertList = QtWidgets.QPlainTextEdit(self.groupBox_3)
        self.plainTextEditExpertList.setGeometry(QtCore.QRect(0, 30, 731, 151))
        self.plainTextEditExpertList.setObjectName("plainTextEditExpertList")

        self.retranslateUi(RaskGrade)
        QtCore.QMetaObject.connectSlotsByName(RaskGrade)

    def retranslateUi(self, RaskGrade):
        _translate = QtCore.QCoreApplication.translate
        RaskGrade.setWindowTitle(_translate("RaskGrade", "Dialog"))
        self.pbInheritRask.setText(_translate("RaskGrade", "继承前一版风险"))
        self.pbHandAddRask.setText(_translate("RaskGrade", "手动增加风险"))
        self.pbDelHandRask.setText(_translate("RaskGrade", "删除手动增加风险"))
        self.label.setText(_translate("RaskGrade", "请指定FMEA风险评分专家："))

import Top_rc
