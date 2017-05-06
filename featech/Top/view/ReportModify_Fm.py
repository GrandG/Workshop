# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\ReportModify.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_ReportModify(object):
    def setupUi(self, ReportModify):
        ReportModify.setObjectName("ReportModify")
        ReportModify.resize(736, 577)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        ReportModify.setWindowIcon(icon)
        self.groupBox = QtWidgets.QGroupBox(ReportModify)
        self.groupBox.setGeometry(QtCore.QRect(3, 3, 731, 571))
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")

        self.retranslateUi(ReportModify)
        QtCore.QMetaObject.connectSlotsByName(ReportModify)

    def retranslateUi(self, ReportModify):
        _translate = QtCore.QCoreApplication.translate
        ReportModify.setWindowTitle(_translate("ReportModify", "Dialog"))

import Top_rc
