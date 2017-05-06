from view.add_on import Ui_UserSetDialog
from PyQt5.QtWidgets import QDialog
from PyQt5 import QtCore


class UI(QDialog, Ui_UserSetDialog):
    def __init__(self, data):
        super().__init__()
        self.setupUi()
        self.data = data

    # def show_data(self):
    #     translate = QtCore.QCoreApplication.translate  # 移位
    #     table = self.infoTable
    #     rowCount = table.rowCount()
    #     table.setRowCount(rowCount + 1)  # 增加新行
    #
    #     for k, v in self._user.items():  # 显示信息
    #         item = QtWidgets.QTableWidgetItem()
    #         self.infoTable.setItem(rowCount, self._column[k], item)
    #         item = self.infoTable.item(rowCount, self._column[k])
    #         item.setText(translate("Dialog", v))
