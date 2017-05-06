#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""Rights Management Dialog."""

import sys

from PyQt5.QtCore import Qt
from PyQt5.QtGui import QStandardItem, QStandardItemModel
from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox, QDialog
from module.g_Top import g_DB, g_Data


from view.UiRights_Fm import *


class RightsDialog(QDialog, Ui_Dialog):
    """Rights Management Dialog."""

    def __init__(self, Dialog):
        """参数: lst (list) 为左侧表, tableMapping (dict)为右侧表格."""
        super(RightsDialog, self).__init__()
        super().setupUi(Dialog)

        # select rights role list from database
        self.rightsList = self.getRightsList()

        # 初始化权限名称
        self.comboBox.addItem('<请选择权限名称>')
        if self.rightsList:
            for i in self.rightsList:
                self.comboBox.addItem(i)
        # 是否选中权限名称
        self.selectedCombo = ''

        # TODO (miles-20170502): 是否需要枚举所有 action?
        sql = 'select distinct ActionName from u_right_action'
        self.allAction = getData(sql, 'ActionName')
        # self.allAction = [
        #     'A_SaveNewTask',
        #     'A_EditTask',
        #     'A_ViewTask',
        #     'A_DeleteTask',
        #     'A_ChangeUser',
        #     'A_TB',
        #     'A_SB',
        #     'A_EmailServer',
        #     'A_UserManager',
        #     'A_EditUser',
        #     'A_RightControl',
        #     'A_CloseFunc',
        #     'A_Exit',
        #     'A_About',
        #     'A_ViewAllTask',
        #     'A_RuleQuery'
        # ]

        # role's action -> list
        self.currentAction = []

        # 新选的 action -> list
        self.checkedAction = []
        # 新取消的 action -> list
        self.uncheckedAction = []

        # action 列表
        self.listModel = QStandardItemModel()
        self.leftListView.setModel(self.listModel)
        # 初始化 action 列表
        self.initListView()

        # comboBox binding
        self.comboBox.activated[str].connect(self.onComboActivated)

        # listModel Checkbox binding
        self.listModel.itemChanged.connect(self.onListModelChanged)

        # exitButton
        self.exitButton.clicked.connect(self.clickExitButton)

        # delButton
        self.submitButton.clicked.connect(self.clickSubmitButton)

    @staticmethod
    def getRightsList() -> list:
        """获取权限名称列表."""
        sql = 'select * from general_info where type="U_RIGHT"'
        return getData(sql, 'name')

    def initListView(self):
        """初始化 action 列表."""
        if self.allAction:
            for i in self.allAction:
                item = QStandardItem(i)
                item.setCheckable(True)
                self.listModel.appendRow(item)

    def updateListView(self):
        """更新 action 列表."""
        self.listModel.clear()
        self.initListView()
        for text in self.currentAction:
            items = self.listModel.findItems(text, Qt.MatchExactly)
            for item in items:
                item.setCheckState(Qt.Checked)

    @staticmethod
    def clickExitButton():
        """退出."""
        app.quit()

    def clickSubmitButton(self):
        """提交数据."""

        # 未选择权限
        if self.selectedCombo not in self.rightsList:
            if (QMessageBox.warning(
                    self, '警告: ', '请选择权限名称!',
                    QMessageBox.Ok, QMessageBox.Ok) == QMessageBox.Ok):
                return

        # 不更改数据管理员的 action
        elif self.selectedCombo == '数据管理员':
            if (QMessageBox.warning(
                    self, '警告: ', '请选择权限名称!',
                    QMessageBox.Ok, QMessageBox.Ok) == QMessageBox.Ok):
                return
        else:
            ret = QMessageBox.question(
                self, '确认', '是否提交数据?',
                QMessageBox.Save | QMessageBox.Discard | QMessageBox.Cancel,
                QMessageBox.Save)
            if ret == QMessageBox.Save:
                for i in self.checkedAction:
                    sql = 'insert into u_right_action ' \
                        '(RightName, ActionName) values ("{}", "{}")'
                    g_DB.Execute(sql.format(self.selectedCombo, i))
                for i in self.uncheckedAction:
                    sql = 'delete from u_right_action where RightName="{}" ' \
                          'and ActionName="{}"'
                    g_DB.Execute(sql.format(self.selectedCombo, i))
                g_DB.commit()
                QMessageBox.warning(self, '成功', '提交成功')
                self.checkedAction = []
                self.uncheckedAction = []
                # app.quit()
            elif ret == QMessageBox.Discard:
                self.checkedAction = []
                self.uncheckedAction = []
                self.updateListView()
                return
            elif ret == QMessageBox.Cancel:
                return

    def onComboActivated(self, text):
        """选定权限角色时, 更新 action 列表."""
        sql = 'select * from u_right_action where RightName="{}"'.format(text)
        self.currentAction = getData(sql, 'ActionName')
        self.checkedAction = []
        self.uncheckedAction = []
        self.selectedCombo = text
        self.updateListView()

    def onListModelChanged(self, item):
        """更改新选择和新取消列表."""

        if item.checkState():
            # 添加新选择的 action
            if item.text() not in self.currentAction:
                self.checkedAction.append(item.text())

            # 从新取消的 action 中删除, 防止重复勾选与取消
            if item.text() in self.uncheckedAction:
                self.uncheckedAction.remove(item.text())
        else:
            # 添加新取消的 action
            if item.text() in self.currentAction:
                self.uncheckedAction.append(item.text())

            # 从新选 action 中删除, 防止重复勾选与取消
            if item.text() in self.checkedAction:
                self.checkedAction.remove(item.text())


def getData(sql, key):
    """从数据库查询 sql 语句, 并通过 key 获取结果"""
    if not g_DB.Execute(sql):
        return []
    res = g_DB.fetchAll()
    if not res:
        return []

    result = []
    for data in res:
        result.append(data[key])
    return result


if __name__ == '__main__':
    g_DB.ConnectFormFile(g_Data.path + g_Data.data +
                         g_Data.MySqlConfigFileName)
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = RightsDialog(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())
