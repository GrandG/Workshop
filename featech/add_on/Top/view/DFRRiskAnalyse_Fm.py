# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\DFRRiskAnalyse.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_DFRRiskAnalyse(object):
    def setupUi(self, DFRRiskAnalyse):
        DFRRiskAnalyse.setObjectName("DFRRiskAnalyse")
        DFRRiskAnalyse.resize(742, 584)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        DFRRiskAnalyse.setWindowIcon(icon)
        self.groupBox = QtWidgets.QGroupBox(DFRRiskAnalyse)
        self.groupBox.setGeometry(QtCore.QRect(6, 8, 731, 571))
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")
        self.tabWidget_3 = QtWidgets.QTabWidget(self.groupBox)
        self.tabWidget_3.setGeometry(QtCore.QRect(3, 1, 731, 301))
        self.tabWidget_3.setObjectName("tabWidget_3")
        self.tabInputDescribe = QtWidgets.QWidget()
        self.tabInputDescribe.setObjectName("tabInputDescribe")
        self.tabWidget_3.addTab(self.tabInputDescribe, "")
        self.tabPC8 = QtWidgets.QWidget()
        self.tabPC8.setObjectName("tabPC8")
        self.tabWidget_3.addTab(self.tabPC8, "")
        self.taBOM = QtWidgets.QWidget()
        self.taBOM.setObjectName("taBOM")
        self.tabWidget_3.addTab(self.taBOM, "")
        self.groupBox_2 = QtWidgets.QGroupBox(self.groupBox)
        self.groupBox_2.setGeometry(QtCore.QRect(0, 300, 731, 271))
        self.groupBox_2.setTitle("")
        self.groupBox_2.setObjectName("groupBox_2")
        self.groupBox_3 = QtWidgets.QGroupBox(self.groupBox_2)
        self.groupBox_3.setGeometry(QtCore.QRect(0, 5, 360, 221))
        self.groupBox_3.setObjectName("groupBox_3")
        self.tableWidgetResult = QtWidgets.QTableWidget(self.groupBox_3)
        self.tableWidgetResult.setGeometry(QtCore.QRect(3, 16, 355, 201))
        self.tableWidgetResult.setObjectName("tableWidgetResult")
        self.tableWidgetResult.setColumnCount(0)
        self.tableWidgetResult.setRowCount(0)
        self.groupBox_4 = QtWidgets.QGroupBox(self.groupBox_2)
        self.groupBox_4.setGeometry(QtCore.QRect(367, 5, 360, 221))
        self.groupBox_4.setObjectName("groupBox_4")
        self.tableWidgetResultDetail = QtWidgets.QTableWidget(self.groupBox_4)
        self.tableWidgetResultDetail.setGeometry(QtCore.QRect(3, 18, 355, 201))
        self.tableWidgetResultDetail.setObjectName("tableWidgetResultDetail")
        self.tableWidgetResultDetail.setColumnCount(0)
        self.tableWidgetResultDetail.setRowCount(0)
        self.pbStartCheck = QtWidgets.QPushButton(self.groupBox_2)
        self.pbStartCheck.setGeometry(QtCore.QRect(462, 236, 111, 23))
        self.pbStartCheck.setObjectName("pbStartCheck")
        self.pbSubmitResult = QtWidgets.QPushButton(self.groupBox_2)
        self.pbSubmitResult.setGeometry(QtCore.QRect(600, 236, 111, 23))
        self.pbSubmitResult.setObjectName("pbSubmitResult")
        self.pbBrdData = QtWidgets.QPushButton(self.groupBox_2)
        self.pbBrdData.setGeometry(QtCore.QRect(40, 236, 111, 23))
        self.pbBrdData.setObjectName("pbBrdData")

        self.retranslateUi(DFRRiskAnalyse)
        self.tabWidget_3.setCurrentIndex(1)
        QtCore.QMetaObject.connectSlotsByName(DFRRiskAnalyse)

    def retranslateUi(self, DFRRiskAnalyse):
        _translate = QtCore.QCoreApplication.translate
        DFRRiskAnalyse.setWindowTitle(_translate("DFRRiskAnalyse", "Dialog"))
        self.tabWidget_3.setTabText(self.tabWidget_3.indexOf(self.tabInputDescribe), _translate("DFRRiskAnalyse", " 输入选项描叙"))
        self.tabWidget_3.setTabText(self.tabWidget_3.indexOf(self.tabPC8), _translate("DFRRiskAnalyse", "PC8布局图"))
        self.tabWidget_3.setTabText(self.tabWidget_3.indexOf(self.taBOM), _translate("DFRRiskAnalyse", "BOM表数据"))
        self.groupBox_3.setTitle(_translate("DFRRiskAnalyse", "DFR规则检查结果查看"))
        self.groupBox_4.setTitle(_translate("DFRRiskAnalyse", "DFR规则检查详细结果查看"))
        self.pbStartCheck.setText(_translate("DFRRiskAnalyse", "启动规则检查"))
        self.pbSubmitResult.setText(_translate("DFRRiskAnalyse", "提交当前分析结果"))
        self.pbBrdData.setText(_translate("DFRRiskAnalyse", "查看Brd数据"))

import Top_rc
