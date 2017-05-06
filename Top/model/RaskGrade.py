from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.RaskGrade_P import RaskGrade_P
from module.g_Top import *

class RaskGrade(RaskGrade_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(RaskGrade, self).__init__(Dialog, NeedShow)
        pass

    # 主页面点击下一步时对当前页面的数据合法性进行检查,并保存数据，检查完成返回True否则返回False
    def CheckAndSaveData(self):
        return True

    # 继承风险
    def InheritRask(self):
        leftstr = g_Task.Task[-6]
        SQL = 'select distinct TaskName from u_fmeadetail'
        SQL += ' where TaskName <>"' + g_Task.Task + '"'
        SQL += ' and TaskName like "' + leftstr + '%" order by id desc'

        if not g_DB.Execute(SQL): return False
        res = g_DB.fetchAll()
        if not res: return False

        lastSameTask = res[0]['TaskName']
        SQL = self.GetLastReleaseText()
        SQL += ' where taskName="' + lastSameTask + '"'

        if not g_DB.Execute(SQL): return False
        res = g_DB.fetchAll()
        if not res: return False
        for data in res:
            d = {}
            d.setdefault('TaskName', '"%s"' % g_Task.Task)
            d.setdefault('Type', '"%s"' % '上一版本继承风险')
            d.setdefault('SubTaskName', '"%s"' % 'FMEA')
            for key in data.keys():
                data[key] = '"%s"' % data[key]
            d.update(data)

            condition = ' TaskName <>"' + g_Task.Task + '"'
            condition += ' and TaskName like "' + leftstr + '%"'
            if not g_DB.insert('u_fmeadetail', d, condition): return False


    # 手动增加风险
    def HandAddRask(self):
        # SQL = 'select id,type,TaskName,SubTaskName,Code,Product,\
        #         Class,FMEA_Effect,FMEA_Mode,FMEA_Reason,FMEA_ProposalGroup,\
        #         FMEA_Proposal,FMEA_Det,FMEA_Occ,FMEA_Sev,Filtered,FMEAItemDescription  \
        #         from u_Fmeadetail'
        # SQL = 'select * from information_schema.columns where table_schema="ids" \
        #        and table_name="u_FMEADetail"'
        #
        # res = g_DB.ExecuteAndReturn(SQL)
        # if not res: return False
        #
        # SQL = self.GetFMEADetailSql() + ' where taskname="' + g_Task.Task + \
        #         '" order by filtered desc'
        # res1 = g_DB.ExecuteAndReturn(SQL)
        # if not res: return False
        #
        # for d in res1[0].keys():
        #     if g_DB.Locate('column_name', d, res):pass
        data = {}
        data.setdefault('Type', '"手动添加"')
        data.setdefault('TaskName', '"%s"' % g_Task.Task)
        data.setdefault('SubTaskName', '"FMEA"')
        #还有其他属性是否需要添加？如何添加？

        g_DB.insert('u_fmeadetail', data)

        pass

    # 删除手动风险
    def DelHandRask(self):
        SQL = self.GetFMEADetailSql() + ' where taskname="' + g_Task.Task + \
                     '" order by filtered desc'

        res = g_DB.ExecuteAndReturn(SQL)
        if not res: return False

        if res[0]['Type'] == '手动添加':
            SQL = 'DELETE FROM u_fmeadetail WHERE taskname="' + g_Task.Task + '"'
            if g_DB.Execute(SQL) and g_DB.commit():
                self._ShowMessage('删除成功')
        else:
            self._ShowMessage('只有手动增加的风险才可以删除!系统识别风险只能取消选择')

        pass

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = RaskGrade(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())