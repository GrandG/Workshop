# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'add_on.ui'
#
# Created by: PyQt5 UI code generator 5.6
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_UserSetDialog(object):
    def setupUi(self, UserSetDialog):
        UserSetDialog.setObjectName("UserSetDialog")
        UserSetDialog.resize(590, 551)
        self.verticalLayout_2 = QtWidgets.QVBoxLayout(UserSetDialog)
        self.verticalLayout_2.setObjectName("verticalLayout_2")
        self.verticalLayout = QtWidgets.QVBoxLayout()
        self.verticalLayout.setObjectName("verticalLayout")
        self.infoTable = QtWidgets.QTableWidget(UserSetDialog)
        self.infoTable.setRowCount(0)
        self.infoTable.setObjectName("infoTable")
        self.infoTable.setColumnCount(8)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.infoTable.setHorizontalHeaderItem(0, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.infoTable.setHorizontalHeaderItem(1, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.infoTable.setHorizontalHeaderItem(2, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.infoTable.setHorizontalHeaderItem(3, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.infoTable.setHorizontalHeaderItem(4, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.infoTable.setHorizontalHeaderItem(5, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.infoTable.setHorizontalHeaderItem(6, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.infoTable.setHorizontalHeaderItem(7, item)
        self.infoTable.horizontalHeader().setVisible(True)
        self.infoTable.horizontalHeader().setCascadingSectionResizes(True)
        self.infoTable.horizontalHeader().setDefaultSectionSize(70)
        self.infoTable.horizontalHeader().setHighlightSections(True)
        self.infoTable.horizontalHeader().setSortIndicatorShown(True)
        self.infoTable.horizontalHeader().setStretchLastSection(True)
        self.infoTable.verticalHeader().setVisible(True)
        self.infoTable.verticalHeader().setCascadingSectionResizes(False)
        self.infoTable.verticalHeader().setHighlightSections(True)
        self.infoTable.verticalHeader().setSortIndicatorShown(False)
        self.infoTable.verticalHeader().setStretchLastSection(False)
        self.verticalLayout.addWidget(self.infoTable)
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        spacerItem = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout_2.addItem(spacerItem)
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.addRowBtn = QtWidgets.QPushButton(UserSetDialog)
        self.addRowBtn.setObjectName("addRowBtn")
        self.horizontalLayout.addWidget(self.addRowBtn)
        self.delRowBtn = QtWidgets.QPushButton(UserSetDialog)
        self.delRowBtn.setObjectName("delRowBtn")
        self.horizontalLayout.addWidget(self.delRowBtn)
        self.confirmBtn = QtWidgets.QPushButton(UserSetDialog)
        self.confirmBtn.setObjectName("confirmBtn")
        self.horizontalLayout.addWidget(self.confirmBtn)
        self.exitBtn = QtWidgets.QPushButton(UserSetDialog)
        self.exitBtn.setObjectName("exitBtn")
        self.horizontalLayout.addWidget(self.exitBtn)
        self.horizontalLayout_2.addLayout(self.horizontalLayout)
        self.verticalLayout.addLayout(self.horizontalLayout_2)
        self.verticalLayout_2.addLayout(self.verticalLayout)

        self.retranslateUi(UserSetDialog)
        self.exitBtn.clicked.connect(UserSetDialog.close)
        self.addRowBtn.clicked.connect(UserSetDialog.addRow)
        self.delRowBtn.clicked.connect(UserSetDialog.delRow)
        self.confirmBtn.clicked.connect(UserSetDialog.confirm)
        QtCore.QMetaObject.connectSlotsByName(UserSetDialog)

    def retranslateUi(self, UserSetDialog):
        _translate = QtCore.QCoreApplication.translate
        UserSetDialog.setWindowTitle(_translate("UserSetDialog", "Dialog"))
        item = self.infoTable.horizontalHeaderItem(0)
        item.setText(_translate("UserSetDialog", "用户名"))
        item = self.infoTable.horizontalHeaderItem(1)
        item.setText(_translate("UserSetDialog", "密码"))
        item = self.infoTable.horizontalHeaderItem(2)
        item.setText(_translate("UserSetDialog", "姓名"))
        item = self.infoTable.horizontalHeaderItem(3)
        item.setText(_translate("UserSetDialog", "邮箱地址"))
        item = self.infoTable.horizontalHeaderItem(4)
        item.setText(_translate("UserSetDialog", "邮箱密码"))
        item = self.infoTable.horizontalHeaderItem(5)
        item.setText(_translate("UserSetDialog", "工号"))
        item = self.infoTable.horizontalHeaderItem(6)
        item.setText(_translate("UserSetDialog", "部门"))
        item = self.infoTable.horizontalHeaderItem(7)
        item.setText(_translate("UserSetDialog", "权限"))
        self.addRowBtn.setText(_translate("UserSetDialog", "添加"))
        self.delRowBtn.setText(_translate("UserSetDialog", "删除"))
        self.confirmBtn.setText(_translate("UserSetDialog", "确定提交"))
        self.exitBtn.setText(_translate("UserSetDialog", "退出"))
