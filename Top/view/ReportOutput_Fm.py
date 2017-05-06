# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\ReportOutput.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_ReportOutput(object):
    def setupUi(self, ReportOutput):
        ReportOutput.setObjectName("ReportOutput")
        ReportOutput.resize(736, 577)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        ReportOutput.setWindowIcon(icon)
        self.groupBox = QtWidgets.QGroupBox(ReportOutput)
        self.groupBox.setGeometry(QtCore.QRect(3, 3, 731, 571))
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")

        self.retranslateUi(ReportOutput)
        QtCore.QMetaObject.connectSlotsByName(ReportOutput)

    def retranslateUi(self, ReportOutput):
        _translate = QtCore.QCoreApplication.translate
        ReportOutput.setWindowTitle(_translate("ReportOutput", "Dialog"))

import Top_rc
