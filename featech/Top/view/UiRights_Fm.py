#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""删除表对话框 UI."""

from PyQt5.QtCore import QCoreApplication, QMetaObject, Qt
# from PyQt5.QtGui import QStandardItem, QStandardItemModel
from PyQt5.QtWidgets import (QApplication, QFrame, QHBoxLayout, QListView,
                             QMainWindow, QPushButton, QSizePolicy,
                             QSpacerItem, QSplitter, QTableView, QVBoxLayout,
                             QWidget, QLabel, QComboBox)


class Ui_Dialog(object):
    """对话框 UI."""

    def setupUi(self, MainWindow):
        """UI 初始化."""
        MainWindow.setObjectName('MainWindow')
        MainWindow.resize(400, 400)
        self.centralWidget = QWidget(MainWindow)
        self.centralWidget.setObjectName("centralWidget")

        # vertical box, the principal layout
        self.mainVBox = QVBoxLayout(self.centralWidget)

        self.topHBox = QHBoxLayout()

        self.lbl = QLabel('lbl')
        self.comboBox = QComboBox()
        self.comboBox.setMinimumSize(150, 10)
        spacerItem = QSpacerItem(
            30, 10, QSizePolicy.Expanding, QSizePolicy.Minimum
        )
        self.topHBox.addWidget(self.lbl)
        self.topHBox.addWidget(self.comboBox)
        self.topHBox.addItem(spacerItem)

        # left frame
        self.leftFrame = QFrame()
        self.leftFrame.setFrameShape(QFrame.StyledPanel)
        self.leftFrame.setGeometry(0, 0, 200, 500)
        self.leftFrame.setMinimumSize(100, 200)
        self.leftFrame.setMaximumSize(200, 300)
        # self.leftFrame.setSizePolicy(QSizePolicy.Expanding,
        #                              QSizePolicy.Expanding)
        self.leftListView = QListView(self.leftFrame)
        self.leftListView.setWindowTitle('表清单')
        self.leftListView.setMinimumSize(100, 200)
        self.leftListView.setSizePolicy(QSizePolicy.Expanding,
                                        QSizePolicy.Expanding)
        self.leftListView.setEditTriggers(QListView.NoEditTriggers)

        # button frame
        self.buttonFrame = QFrame()
        self.buttonFrame.setFrameShape(QFrame.StyledPanel)
        self.buttonFrame.setFrameShadow(QFrame.Raised)
        self.buttonLayout = QHBoxLayout(self.buttonFrame)

        # button
        self.submitButton = QPushButton(self.buttonFrame)
        self.submitButton.setText('submitButton')
        self.exitButton = QPushButton(self.buttonFrame)
        self.exitButton.setText('exitButton')

        spacerItem = QSpacerItem(
            200, 10, QSizePolicy.Expanding, QSizePolicy.Minimum
        )
        self.buttonLayout.addItem(spacerItem)
        self.buttonLayout.addWidget(self.submitButton)
        self.buttonLayout.addWidget(self.exitButton)

        self.mainVBox.addLayout(self.topHBox)
        self.mainVBox.addWidget(self.leftListView)
        self.mainVBox.addWidget(self.buttonFrame)

        # bind centralWidget to MainWindow ****************************
        MainWindow.setCentralWidget(self.centralWidget)

        self.retranslationUi(MainWindow)
        QMetaObject.connectSlotsByName(MainWindow)

    def retranslationUi(self, MainWindow):
        """窗口标题命名."""
        _translate = QCoreApplication.translate
        MainWindow.setWindowTitle(_translate('MainWindow', '权限管理'))
        self.submitButton.setText(_translate('submitButton', '确认提交'))
        self.exitButton.setText(_translate('exitButton', '退出'))
        self.lbl.setText(_translate('lbl', '权限名称: '))


if __name__ == '__main__':
    import sys
    app = QApplication(sys.argv)
    MainWindow = QMainWindow()
    ui = Ui_Dialog()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
