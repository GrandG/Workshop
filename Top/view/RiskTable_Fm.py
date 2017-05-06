# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\RiskTable.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_RiskTable(object):
    def setupUi(self, RiskTable):
        RiskTable.setObjectName("RiskTable")
        RiskTable.resize(719, 579)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        RiskTable.setWindowIcon(icon)
        self.groupBox = QtWidgets.QGroupBox(RiskTable)
        self.groupBox.setGeometry(QtCore.QRect(4, 4, 711, 571))
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")
        self.tableView = QtWidgets.QTableView(self.groupBox)
        self.tableView.setGeometry(QtCore.QRect(5, 4, 701, 561))
        self.tableView.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.tableView.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.tableView.setSizeAdjustPolicy(QtWidgets.QAbstractScrollArea.AdjustIgnored)
        self.tableView.setVerticalScrollMode(QtWidgets.QAbstractItemView.ScrollPerPixel)
        self.tableView.setShowGrid(True)
        self.tableView.setGridStyle(QtCore.Qt.SolidLine)
        self.tableView.setSortingEnabled(False)
        self.tableView.setWordWrap(True)
        self.tableView.setCornerButtonEnabled(True)
        self.tableView.setObjectName("tableView")

        self.retranslateUi(RiskTable)
        QtCore.QMetaObject.connectSlotsByName(RiskTable)

    def retranslateUi(self, RiskTable):
        _translate = QtCore.QCoreApplication.translate
        RiskTable.setWindowTitle(_translate("RiskTable", "Dialog"))

import Top_rc
