# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\ServerConfigure.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_DlgServerConfigure(object):
    def setupUi(self, DlgServerConfigure):
        DlgServerConfigure.setObjectName("DlgServerConfigure")
        DlgServerConfigure.resize(576, 360)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        DlgServerConfigure.setWindowIcon(icon)
        self.label = QtWidgets.QLabel(DlgServerConfigure)
        self.label.setGeometry(QtCore.QRect(20, 30, 101, 16))
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        self.label.setFont(font)
        self.label.setObjectName("label")
        self.label_2 = QtWidgets.QLabel(DlgServerConfigure)
        self.label_2.setGeometry(QtCore.QRect(20, 70, 101, 16))
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        self.label_2.setFont(font)
        self.label_2.setObjectName("label_2")
        self.label_3 = QtWidgets.QLabel(DlgServerConfigure)
        self.label_3.setGeometry(QtCore.QRect(20, 110, 101, 16))
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        self.label_3.setFont(font)
        self.label_3.setObjectName("label_3")
        self.label_4 = QtWidgets.QLabel(DlgServerConfigure)
        self.label_4.setGeometry(QtCore.QRect(20, 150, 101, 16))
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        self.label_4.setFont(font)
        self.label_4.setObjectName("label_4")
        self.label_5 = QtWidgets.QLabel(DlgServerConfigure)
        self.label_5.setGeometry(QtCore.QRect(20, 190, 101, 16))
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        self.label_5.setFont(font)
        self.label_5.setObjectName("label_5")
        self.label_6 = QtWidgets.QLabel(DlgServerConfigure)
        self.label_6.setGeometry(QtCore.QRect(20, 230, 101, 16))
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        self.label_6.setFont(font)
        self.label_6.setObjectName("label_6")
        self.label_7 = QtWidgets.QLabel(DlgServerConfigure)
        self.label_7.setGeometry(QtCore.QRect(20, 270, 101, 16))
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        self.label_7.setFont(font)
        self.label_7.setObjectName("label_7")
        self.lineEditDump = QtWidgets.QLineEdit(DlgServerConfigure)
        self.lineEditDump.setGeometry(QtCore.QRect(140, 30, 351, 20))
        self.lineEditDump.setObjectName("lineEditDump")
        self.lineEditDBFilePath = QtWidgets.QLineEdit(DlgServerConfigure)
        self.lineEditDBFilePath.setGeometry(QtCore.QRect(140, 268, 351, 20))
        self.lineEditDBFilePath.setObjectName("lineEditDBFilePath")
        self.lineEditServerAdds = QtWidgets.QLineEdit(DlgServerConfigure)
        self.lineEditServerAdds.setGeometry(QtCore.QRect(140, 70, 401, 20))
        self.lineEditServerAdds.setObjectName("lineEditServerAdds")
        self.lineEditServerPort = QtWidgets.QLineEdit(DlgServerConfigure)
        self.lineEditServerPort.setGeometry(QtCore.QRect(140, 110, 401, 20))
        self.lineEditServerPort.setObjectName("lineEditServerPort")
        self.lineEditUserName = QtWidgets.QLineEdit(DlgServerConfigure)
        self.lineEditUserName.setGeometry(QtCore.QRect(140, 150, 401, 20))
        self.lineEditUserName.setObjectName("lineEditUserName")
        self.lineEditPassword = QtWidgets.QLineEdit(DlgServerConfigure)
        self.lineEditPassword.setGeometry(QtCore.QRect(140, 188, 401, 20))
        self.lineEditPassword.setEchoMode(QtWidgets.QLineEdit.Password)
        self.lineEditPassword.setObjectName("lineEditPassword")
        self.lineEditDB = QtWidgets.QLineEdit(DlgServerConfigure)
        self.lineEditDB.setGeometry(QtCore.QRect(140, 226, 401, 20))
        self.lineEditDB.setObjectName("lineEditDB")
        self.horizontalLayoutWidget = QtWidgets.QWidget(DlgServerConfigure)
        self.horizontalLayoutWidget.setGeometry(QtCore.QRect(20, 304, 531, 31))
        self.horizontalLayoutWidget.setObjectName("horizontalLayoutWidget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.horizontalLayoutWidget)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setSpacing(8)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.pbSetupODBC = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.pbSetupODBC.setObjectName("pbSetupODBC")
        self.horizontalLayout.addWidget(self.pbSetupODBC)
        self.pbSaveInfo = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.pbSaveInfo.setObjectName("pbSaveInfo")
        self.horizontalLayout.addWidget(self.pbSaveInfo)
        self.pbReductionDB = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.pbReductionDB.setObjectName("pbReductionDB")
        self.horizontalLayout.addWidget(self.pbReductionDB)
        self.qbQuit = QtWidgets.QPushButton(self.horizontalLayoutWidget)
        self.qbQuit.setObjectName("qbQuit")
        self.horizontalLayout.addWidget(self.qbQuit)
        self.toolButtonDumpPath = QtWidgets.QToolButton(DlgServerConfigure)
        self.toolButtonDumpPath.setGeometry(QtCore.QRect(491, 30, 51, 20))
        self.toolButtonDumpPath.setObjectName("toolButtonDumpPath")
        self.toolButtonDBFilePath = QtWidgets.QToolButton(DlgServerConfigure)
        self.toolButtonDBFilePath.setGeometry(QtCore.QRect(492, 268, 51, 20))
        self.toolButtonDBFilePath.setObjectName("toolButtonDBFilePath")

        self.retranslateUi(DlgServerConfigure)
        QtCore.QMetaObject.connectSlotsByName(DlgServerConfigure)

    def retranslateUi(self, DlgServerConfigure):
        _translate = QtCore.QCoreApplication.translate
        DlgServerConfigure.setWindowTitle(_translate("DlgServerConfigure", "参数配置"))
        self.label.setText(_translate("DlgServerConfigure", "mysqldump路径："))
        self.label_2.setText(_translate("DlgServerConfigure", "服务器地址："))
        self.label_3.setText(_translate("DlgServerConfigure", "服务器端口："))
        self.label_4.setText(_translate("DlgServerConfigure", "用户名："))
        self.label_5.setText(_translate("DlgServerConfigure", "密码："))
        self.label_6.setText(_translate("DlgServerConfigure", "数据库："))
        self.label_7.setText(_translate("DlgServerConfigure", "数据库文件路径："))
        self.pbSetupODBC.setText(_translate("DlgServerConfigure", "1.安装ODBC驱动"))
        self.pbSaveInfo.setText(_translate("DlgServerConfigure", "2.保存连接服务器信息"))
        self.pbReductionDB.setText(_translate("DlgServerConfigure", "3.还原数据库"))
        self.qbQuit.setText(_translate("DlgServerConfigure", "退出"))
        self.toolButtonDumpPath.setText(_translate("DlgServerConfigure", "..."))
        self.toolButtonDBFilePath.setText(_translate("DlgServerConfigure", "..."))

import Top_rc
