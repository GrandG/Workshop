# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\code\Top\ui\MainWindow.ui'
#
# Created by: PyQt5 UI code generator 5.8.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(898, 708)
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/new/wl/Logo_ico.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        MainWindow.setWindowIcon(icon)
        MainWindow.setToolTipDuration(-1)
        MainWindow.setStatusTip("")
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.widget = QtWidgets.QWidget(self.centralwidget)
        self.widget.setGeometry(QtCore.QRect(2, 2, 891, 661))
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(8)
        sizePolicy.setVerticalStretch(9)
        sizePolicy.setHeightForWidth(self.widget.sizePolicy().hasHeightForWidth())
        self.widget.setSizePolicy(sizePolicy)
        self.widget.setObjectName("widget")
        self.tabWidget = QtWidgets.QTabWidget(self.widget)
        self.tabWidget.setGeometry(QtCore.QRect(2, 4, 891, 651))
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.tabWidget.sizePolicy().hasHeightForWidth())
        self.tabWidget.setSizePolicy(sizePolicy)
        self.tabWidget.setSizeIncrement(QtCore.QSize(0, 0))
        font = QtGui.QFont()
        font.setFamily("宋体")
        font.setPointSize(10)
        self.tabWidget.setFont(font)
        self.tabWidget.setMouseTracking(False)
        self.tabWidget.setFocusPolicy(QtCore.Qt.NoFocus)
        self.tabWidget.setContextMenuPolicy(QtCore.Qt.DefaultContextMenu)
        self.tabWidget.setAcceptDrops(False)
        self.tabWidget.setInputMethodHints(QtCore.Qt.ImhNone)
        self.tabWidget.setTabPosition(QtWidgets.QTabWidget.North)
        self.tabWidget.setTabShape(QtWidgets.QTabWidget.Rounded)
        self.tabWidget.setElideMode(QtCore.Qt.ElideNone)
        self.tabWidget.setUsesScrollButtons(False)
        self.tabWidget.setDocumentMode(False)
        self.tabWidget.setTabsClosable(False)
        self.tabWidget.setMovable(False)
        self.tabWidget.setTabBarAutoHide(False)
        self.tabWidget.setObjectName("tabWidget")
        self.tabMain = QtWidgets.QWidget()
        self.tabMain.setObjectName("tabMain")
        self.widget_2 = QtWidgets.QWidget(self.tabMain)
        self.widget_2.setGeometry(QtCore.QRect(-1, 0, 141, 621))
        self.widget_2.setObjectName("widget_2")
        self.verticalLayoutWidget = QtWidgets.QWidget(self.widget_2)
        self.verticalLayoutWidget.setGeometry(QtCore.QRect(10, 0, 111, 331))
        self.verticalLayoutWidget.setObjectName("verticalLayoutWidget")
        self.verticalLayout = QtWidgets.QVBoxLayout(self.verticalLayoutWidget)
        self.verticalLayout.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout.setObjectName("verticalLayout")
        self.pBtnNewTask = QtWidgets.QPushButton(self.verticalLayoutWidget)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(":/new/wl/Now.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pBtnNewTask.setIcon(icon1)
        self.pBtnNewTask.setObjectName("pBtnNewTask")
        self.verticalLayout.addWidget(self.pBtnNewTask)
        self.pBtnInfoInput = QtWidgets.QPushButton(self.verticalLayoutWidget)
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(":/new/wl/sure.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pBtnInfoInput.setIcon(icon2)
        self.pBtnInfoInput.setAutoRepeatInterval(100)
        self.pBtnInfoInput.setObjectName("pBtnInfoInput")
        self.verticalLayout.addWidget(self.pBtnInfoInput)
        self.pBtnDFRAnalyse = QtWidgets.QPushButton(self.verticalLayoutWidget)
        self.pBtnDFRAnalyse.setIcon(icon2)
        self.pBtnDFRAnalyse.setObjectName("pBtnDFRAnalyse")
        self.verticalLayout.addWidget(self.pBtnDFRAnalyse)
        self.pBtnRiskGrade = QtWidgets.QPushButton(self.verticalLayoutWidget)
        self.pBtnRiskGrade.setIcon(icon2)
        self.pBtnRiskGrade.setObjectName("pBtnRiskGrade")
        self.verticalLayout.addWidget(self.pBtnRiskGrade)
        self.pBtnStepJudge = QtWidgets.QPushButton(self.verticalLayoutWidget)
        self.pBtnStepJudge.setIcon(icon2)
        self.pBtnStepJudge.setObjectName("pBtnStepJudge")
        self.verticalLayout.addWidget(self.pBtnStepJudge)
        self.pBtnStepEdit = QtWidgets.QPushButton(self.verticalLayoutWidget)
        self.pBtnStepEdit.setIcon(icon2)
        self.pBtnStepEdit.setObjectName("pBtnStepEdit")
        self.verticalLayout.addWidget(self.pBtnStepEdit)
        self.pBtnRiskTable = QtWidgets.QPushButton(self.verticalLayoutWidget)
        self.pBtnRiskTable.setIcon(icon2)
        self.pBtnRiskTable.setObjectName("pBtnRiskTable")
        self.verticalLayout.addWidget(self.pBtnRiskTable)
        self.pBtnReportOutput = QtWidgets.QPushButton(self.verticalLayoutWidget)
        self.pBtnReportOutput.setIcon(icon2)
        self.pBtnReportOutput.setObjectName("pBtnReportOutput")
        self.verticalLayout.addWidget(self.pBtnReportOutput)
        self.pBtnReportModify = QtWidgets.QPushButton(self.verticalLayoutWidget)
        self.pBtnReportModify.setIcon(icon2)
        self.pBtnReportModify.setObjectName("pBtnReportModify")
        self.verticalLayout.addWidget(self.pBtnReportModify)
        self.line = QtWidgets.QFrame(self.tabMain)
        self.line.setGeometry(QtCore.QRect(140, 0, 5, 621))
        self.line.setFrameShape(QtWidgets.QFrame.VLine)
        self.line.setFrameShadow(QtWidgets.QFrame.Sunken)
        self.line.setObjectName("line")
        self.pBtnNext = QtWidgets.QPushButton(self.tabMain)
        self.pBtnNext.setGeometry(QtCore.QRect(668, 590, 91, 23))
        self.pBtnNext.setObjectName("pBtnNext")
        self.pBtnQuit = QtWidgets.QPushButton(self.tabMain)
        self.pBtnQuit.setGeometry(QtCore.QRect(780, 590, 91, 23))
        self.pBtnQuit.setObjectName("pBtnQuit")
        self.gridLayoutWidget = QtWidgets.QWidget(self.tabMain)
        self.gridLayoutWidget.setGeometry(QtCore.QRect(140, 0, 741, 581))
        self.gridLayoutWidget.setObjectName("gridLayoutWidget")
        self.FormLayout = QtWidgets.QGridLayout(self.gridLayoutWidget)
        self.FormLayout.setContentsMargins(0, 0, 0, 0)
        self.FormLayout.setObjectName("FormLayout")
        self.tabWidget.addTab(self.tabMain, "")
        self.tab_2 = QtWidgets.QWidget()
        self.tab_2.setObjectName("tab_2")
        self.tabWidget.addTab(self.tab_2, "")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 898, 23))
        self.menubar.setObjectName("menubar")
        self.menu_Tesk = QtWidgets.QMenu(self.menubar)
        self.menu_Tesk.setObjectName("menu_Tesk")
        self.menu_Switch = QtWidgets.QMenu(self.menubar)
        self.menu_Switch.setObjectName("menu_Switch")
        self.menu_Look = QtWidgets.QMenu(self.menubar)
        self.menu_Look.setObjectName("menu_Look")
        self.menu_View = QtWidgets.QMenu(self.menubar)
        self.menu_View.setObjectName("menu_View")
        self.menu_Set = QtWidgets.QMenu(self.menubar)
        self.menu_Set.setObjectName("menu_Set")
        self.menu_Help = QtWidgets.QMenu(self.menubar)
        self.menu_Help.setObjectName("menu_Help")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setToolTipDuration(-1)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.A_SaveNewTask = QtWidgets.QAction(MainWindow)
        icon3 = QtGui.QIcon()
        icon3.addPixmap(QtGui.QPixmap(":/bmp/pic/save.bmp"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.A_SaveNewTask.setIcon(icon3)
        self.A_SaveNewTask.setObjectName("A_SaveNewTask")
        self.A_ViewTask = QtWidgets.QAction(MainWindow)
        self.A_ViewTask.setObjectName("A_ViewTask")
        self.A_ViewAllTask = QtWidgets.QAction(MainWindow)
        self.A_ViewAllTask.setObjectName("A_ViewAllTask")
        self.A_EditTask = QtWidgets.QAction(MainWindow)
        self.A_EditTask.setObjectName("A_EditTask")
        self.A_Quit = QtWidgets.QAction(MainWindow)
        self.A_Quit.setObjectName("A_Quit")
        self.A_ChangeUser = QtWidgets.QAction(MainWindow)
        self.A_ChangeUser.setObjectName("A_ChangeUser")
        self.A_RuleQuery = QtWidgets.QAction(MainWindow)
        self.A_RuleQuery.setObjectName("A_RuleQuery")
        self.A_TB = QtWidgets.QAction(MainWindow)
        self.A_TB.setCheckable(True)
        self.A_TB.setChecked(True)
        self.A_TB.setObjectName("A_TB")
        self.A_SB = QtWidgets.QAction(MainWindow)
        self.A_SB.setCheckable(True)
        self.A_SB.setChecked(True)
        self.A_SB.setObjectName("A_SB")
        self.A_EditUser = QtWidgets.QAction(MainWindow)
        self.A_EditUser.setObjectName("A_EditUser")
        self.A_RightControl = QtWidgets.QAction(MainWindow)
        self.A_RightControl.setObjectName("A_RightControl")
        self.A_UserManager = QtWidgets.QAction(MainWindow)
        self.A_UserManager.setObjectName("A_UserManager")
        self.A_About = QtWidgets.QAction(MainWindow)
        self.A_About.setObjectName("A_About")
        self.menu_Tesk.addAction(self.A_SaveNewTask)
        self.menu_Tesk.addAction(self.A_ViewTask)
        self.menu_Tesk.addAction(self.A_ViewAllTask)
        self.menu_Tesk.addAction(self.A_EditTask)
        self.menu_Tesk.addAction(self.A_Quit)
        self.menu_Switch.addAction(self.A_ChangeUser)
        self.menu_Look.addAction(self.A_RuleQuery)
        self.menu_View.addAction(self.A_TB)
        self.menu_View.addAction(self.A_SB)
        self.menu_Set.addAction(self.A_EditUser)
        self.menu_Set.addAction(self.A_RightControl)
        self.menu_Set.addAction(self.A_UserManager)
        self.menu_Help.addAction(self.A_About)
        self.menubar.addAction(self.menu_Tesk.menuAction())
        self.menubar.addAction(self.menu_Switch.menuAction())
        self.menubar.addAction(self.menu_Look.menuAction())
        self.menubar.addAction(self.menu_View.menuAction())
        self.menubar.addAction(self.menu_Set.menuAction())
        self.menubar.addAction(self.menu_Help.menuAction())

        self.retranslateUi(MainWindow)
        self.tabWidget.setCurrentIndex(0)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "元王IDS集成设计仿真平台"))
        self.pBtnNewTask.setText(_translate("MainWindow", "新建任务"))
        self.pBtnInfoInput.setText(_translate("MainWindow", "信息输入"))
        self.pBtnDFRAnalyse.setText(_translate("MainWindow", "DFR分析"))
        self.pBtnRiskGrade.setText(_translate("MainWindow", "风险评分"))
        self.pBtnStepJudge.setText(_translate("MainWindow", "措施评审"))
        self.pBtnStepEdit.setText(_translate("MainWindow", "措施修订"))
        self.pBtnRiskTable.setText(_translate("MainWindow", "风险评估"))
        self.pBtnReportOutput.setText(_translate("MainWindow", "报告输出"))
        self.pBtnReportModify.setText(_translate("MainWindow", "报告修改"))
        self.pBtnNext.setText(_translate("MainWindow", "下一步"))
        self.pBtnQuit.setText(_translate("MainWindow", "退出"))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tabMain), _translate("MainWindow", "主页"))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab_2), _translate("MainWindow", "Tab 2"))
        self.menu_Tesk.setTitle(_translate("MainWindow", "任务(&W)"))
        self.menu_Switch.setTitle(_translate("MainWindow", "切换用户(&X)"))
        self.menu_Look.setTitle(_translate("MainWindow", "查看(&Y)"))
        self.menu_View.setTitle(_translate("MainWindow", "外观(&V)"))
        self.menu_Set.setTitle(_translate("MainWindow", "设置(&Z)"))
        self.menu_Help.setTitle(_translate("MainWindow", "帮助(&H)"))
        self.A_SaveNewTask.setText(_translate("MainWindow", "新建任务"))
        self.A_ViewTask.setText(_translate("MainWindow", "查看当前任务"))
        self.A_ViewAllTask.setText(_translate("MainWindow", "查看所有任务"))
        self.A_EditTask.setText(_translate("MainWindow", "编辑任务"))
        self.A_Quit.setText(_translate("MainWindow", "退    出"))
        self.A_ChangeUser.setText(_translate("MainWindow", "切换用户"))
        self.A_RuleQuery.setText(_translate("MainWindow", "规则查询"))
        self.A_TB.setText(_translate("MainWindow", "工具栏"))
        self.A_SB.setText(_translate("MainWindow", "状态栏"))
        self.A_EditUser.setText(_translate("MainWindow", "用户信息编辑"))
        self.A_RightControl.setText(_translate("MainWindow", "用户权限控制"))
        self.A_UserManager.setText(_translate("MainWindow", "用户管理"))
        self.A_About.setText(_translate("MainWindow", "关于..."))

import Top_rc
