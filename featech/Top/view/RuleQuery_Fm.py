# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\RuleQuery.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_RuleQuery(object):
    def setupUi(self, RuleQuery):
        RuleQuery.setObjectName("RuleQuery")
        RuleQuery.resize(742, 584)
        self.verticalLayoutWidget = QtWidgets.QWidget(RuleQuery)
        self.verticalLayoutWidget.setGeometry(QtCore.QRect(0, 540, 741, 41))
        self.verticalLayoutWidget.setObjectName("verticalLayoutWidget")
        self.verticalLayout = QtWidgets.QVBoxLayout(self.verticalLayoutWidget)
        self.verticalLayout.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout.setObjectName("verticalLayout")
        self.groupBox = QtWidgets.QGroupBox(self.verticalLayoutWidget)
        self.groupBox.setTitle("")
        self.groupBox.setObjectName("groupBox")
        self.horizontalLayoutWidget = QtWidgets.QWidget(self.groupBox)
        self.horizontalLayoutWidget.setGeometry(QtCore.QRect(476, 0, 221, 41))
        self.horizontalLayoutWidget.setObjectName("horizontalLayoutWidget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.horizontalLayoutWidget)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.pushButtonFilter = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.pushButtonFilter.setObjectName("pushButtonFilter")
        self.horizontalLayout.addWidget(self.pushButtonFilter)
        self.pushButtonQuit = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.pushButtonQuit.setObjectName("pushButtonQuit")
        self.horizontalLayout.addWidget(self.pushButtonQuit)
        self.verticalLayout.addWidget(self.groupBox)
        self.verticalLayoutWidget_2 = QtWidgets.QWidget(RuleQuery)
        self.verticalLayoutWidget_2.setGeometry(QtCore.QRect(0, 60, 741, 481))
        self.verticalLayoutWidget_2.setObjectName("verticalLayoutWidget_2")
        self.verticalLayout_2 = QtWidgets.QVBoxLayout(self.verticalLayoutWidget_2)
        self.verticalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.tableWidget = QtWidgets.QTableWidget(self.verticalLayoutWidget_2)
        self.tableWidget.setColumnCount(8)
        self.tableWidget.setObjectName("tableWidget")
        self.tableWidget.setRowCount(0)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(0, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(1, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(2, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(3, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(4, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(5, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(6, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(7, item)
        self.tableWidget.horizontalHeader().setDefaultSectionSize(90)
        self.verticalLayout_2.addWidget(self.tableWidget)
        self.verticalLayoutWidget_3 = QtWidgets.QWidget(RuleQuery)
        self.verticalLayoutWidget_3.setGeometry(QtCore.QRect(0, 0, 741, 61))
        self.verticalLayoutWidget_3.setObjectName("verticalLayoutWidget_3")
        self.verticalLayout_3 = QtWidgets.QVBoxLayout(self.verticalLayoutWidget_3)
        self.verticalLayout_3.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_3.setObjectName("verticalLayout_3")
        self.groupBox_2 = QtWidgets.QGroupBox(self.verticalLayoutWidget_3)
        self.groupBox_2.setTitle("")
        self.groupBox_2.setObjectName("groupBox_2")
        self.label = QtWidgets.QLabel(self.groupBox_2)
        self.label.setGeometry(QtCore.QRect(20, 20, 101, 16))
        self.label.setObjectName("label")
        self.lineEditKeywords = QtWidgets.QLineEdit(self.groupBox_2)
        self.lineEditKeywords.setGeometry(QtCore.QRect(130, 20, 591, 20))
        self.lineEditKeywords.setObjectName("lineEditKeywords")
        self.verticalLayout_3.addWidget(self.groupBox_2)

        self.retranslateUi(RuleQuery)
        QtCore.QMetaObject.connectSlotsByName(RuleQuery)

    def retranslateUi(self, RuleQuery):
        _translate = QtCore.QCoreApplication.translate
        RuleQuery.setWindowTitle(_translate("RuleQuery", "查看当前任务"))
        self.pushButtonFilter.setText(_translate("RuleQuery", "过滤"))
        self.pushButtonQuit.setText(_translate("RuleQuery", "退出"))
        item = self.tableWidget.horizontalHeaderItem(0)
        item.setText(_translate("RuleQuery", "任务名称"))
        item = self.tableWidget.horizontalHeaderItem(1)
        item.setText(_translate("RuleQuery", "任务描述"))
        item = self.tableWidget.horizontalHeaderItem(2)
        item.setText(_translate("RuleQuery", "子任务中间结果"))
        item = self.tableWidget.horizontalHeaderItem(3)
        item.setText(_translate("RuleQuery", "子任务责任人"))
        item = self.tableWidget.horizontalHeaderItem(4)
        item.setText(_translate("RuleQuery", "子任务名称"))
        item = self.tableWidget.horizontalHeaderItem(5)
        item.setText(_translate("RuleQuery", "子任务起始日期"))
        item = self.tableWidget.horizontalHeaderItem(6)
        item.setText(_translate("RuleQuery", "子任务结束日期"))
        item = self.tableWidget.horizontalHeaderItem(7)
        item.setText(_translate("RuleQuery", "子任务实际完成日期"))
        self.label.setText(_translate("RuleQuery", "规则关键字过滤："))

