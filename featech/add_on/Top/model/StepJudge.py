from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox
import sys
from Presenter.StepJudge_P import StepJudge_P
from module.g_Top import g_Task, g_DB

class StepJudge(StepJudge_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(StepJudge, self).__init__(Dialog, NeedShow)

        self._sql = self.GetSqlText()

    # 主页面点击下一步时对当前页面的数据合法性进行检查,并保存数据，检查完成返回True否则返回False
    def CheckAndSaveData(self):
        res = QMessageBox.question(self, ('确认进入下一步吗?'), ('确认选择'),
                                   QMessageBox.StandardButtons(QMessageBox.Yes | QMessageBox.No))
        if res == QMessageBox.No: return False

        if not self.CheckExpertExist(self.textEditFEAMExpert.toPlainText()): return False

        Expert = self.textEditFEAMExpert.toPlainText()
        Lst = Expert.split(';')
        ExpertLst = []
        for ex in Lst:
            ExpertLst.append(ex.replace(',', ''))

        ex =[]
        for Expert in ExpertLst:
            name = Expert.split(' ')[0].replace(',', '')
            if name:
                data = {}
                data.setdefault('TaskName', '"%s"' % g_Task.Task)
                data.setdefault('SubTaskName', '"%s"' % 'FMEAAPPROVE')
                data.setdefault('Owner', '"%s"' % name)
                data.setdefault('Status', '"%s"' % '未启动')

                g_DB.insert('u_FMEAApprove', data)

        return True

    #检查专家是否存在
    def CheckExpertExist(self, Expert):
        ExpertLst = Expert.split(';')
        if not ExpertLst:
            self.ShowMessage('请指定评审专家!')
            return False
        for ex in ExpertLst:
            name = ex.split(' ')
            if len(name) < 3:
                self.ShowMessage('评审专家信息不全')
                return False

            SQL = 'select UserName from u_user where UserName="' + name[0] + '"'
            if not g_DB.Execute(SQL): return False
            if g_DB.isEmpty():
                self.ShowMessage('指定的评审专家' + name[0] +'不存在,请确认')
                return False

        return True

    def JudgeIsOver(self):
        # SQL = self.GetSqlText()
        # SQL += ' where Filtered=1 and taskName="' + g_Task.Task + '"'
        #
        # res = g_DB.ExecuteAndReturn(SQL)
        # if not res: return False
        #
        # SQL = 'select * from information_schema.columns where table_schema="ids" and table_name="u_FMEADetail"'
        # res1 = g_DB.ExecuteAndReturn(SQL)
        # if not res: return False
        pass

    # RPN排序
    def RPNSort(self):
        self._sql = self.GetSqlText() + 'where taskName="' + g_Task.Task \
                   + '" and filtered=1 order by CalRPN desc'

    # 过滤风险
    def FilterTOPRisk(self):
        self._sql = self.GetSqlText() + 'where taskName="' + g_Task.Task \
                   + '"  and filtered=1 order by CalRPN desc limit ' + self.GetTopNo()

    # 显示所有风险项
    def ShowAll(self):
        self._sql = self.GetSqlText() + 'where taskName="' + g_Task.Task \
                   + '" and filtered=1 order by CalRPN desc'

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = StepJudge(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())