from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
import os
import shutil
import math
from Presenter.InfoInput_P import InfoInput_P
from module.g_Top import g_DB, g_Task, g_Data, g_Log
import time

class InfoInput(InfoInput_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(InfoInput, self).__init__(Dialog, NeedShow)
        pass

    # 主页面点击下一步时对当前页面的数据合法性进行检查,并保存数据，检查完成返回True否则返回False
    def CheckAndSaveData(self):
        if not self.NextConfirm(): return False
        else:return True

    def GetRuleListInput(self):
        SQL = 'select name from general_info where type="S_DFRLIB"'
        res = g_DB.ExecuteAndReturn(SQL)
        if not res: return False

        SQL = 'select distinct inputtype,inputmethod,inputoption from dfr_inputfact,dfr_r_rule_input,('
        IsFirst = True

        for d in res:
            if not IsFirst: SQL += ' UNION '
            SQL += 'select code,RuleContent,product'
            SQL += ' from '+ d.get('name', '')
            IsFirst = False

        SQL += ') as ruleQuery '
        SQL += 'where ((Product="通用") or (Product like "%' + g_Task.ProductType + '%"))'
        SQL += 'and ruleQuery.code=dfr_r_rule_input.ruleID and dfr_r_rule_input.inputID=dfr_inputfact.code '
        SQL += 'order by inputtype'

        res1 = g_DB.ExecuteAndReturn(SQL)
        if not res1: return False

        IsFirst = True
        top = 15
        for d1 in res1:
            SQL = 'select distinct dfr_inputfact.code as code,InputDescription,InputMethod,InputOption,TrigCond'
            SQL += ' from dfr_inputfact,dfr_r_rule_input,('
            for d in res:
                if not IsFirst: SQL += ' UNION '
                SQL += 'select code,RuleContent,product'
                SQL += ' from ' + d.get('name', '')
                IsFirst = False

            SQL += ') as ruleQuery '
            SQL += 'where ((Product="通用") or (Product like "%' + g_Task.ProductType + '%"))'
            SQL += 'and ruleQuery.code=dfr_r_rule_input.ruleID and dfr_r_rule_input.InputID=dfr_inputfact.Code '
            SQL += 'and InputType="' + d1['inputtype'] + '"'

            res2 = g_DB.ExecuteAndReturn(SQL)
            if not res2: return False

            RowCount = math.ceil(len(res1) + 1 / 5)
            height = 30 + RowCount * 22
            size = [5, top, 700, height]
            top += height + 20

            CheckBoXList = self.CreateCheckBoXList(res1[0]['inputtype'], size, RowCount)

            Row = 1
            Col = 0
            for d in res2:
                self.AddCheckBox(CheckBoXList, Row, Col, d['InputDescription'])
                Col += 1
                if Col == 5:
                    Row += 1
                    Col = 0

    # 提交数据的执行函数
    def Submit(self):
        try:
            result = False
            destPath = g_Data.path + 'Project\\' + g_Task.task + '\\'
            if not os.path.exists(destPath):
                os.mkdir(destPath)

            SQL = 'select * from u_r_pcb_product where TaskName="' + g_Task.Task + '"'

            res = g_DB.ExecuteAndReturn(SQL)
            if not res: return result

            PCBCode = res[0]['PCBCode']
            ExcelFileName = destPath + g_Task.Task + PCBCode + '_Input.xls'
            if not self._SaveDataToExcel(ExcelFileName):
                g_Log.LogError('存储Excel错误')
                return result

            BDMPos, BrdPos = self.GetFileName()
            shutil.copy(BDMPos, destPath + '_' + PCBCode + '_Bom.xls')
            shutil.copy(BrdPos, destPath + '_' + PCBCode + '_Brd.brd')

            data = {}
            data.setdefault('brd_LocalPath', '"%s"' % BrdPos)
            data.setdefault('Bom_LocalPath', '"%s"' % BDMPos)
            data.setdefault('Input_LocalPath', '"%s"' % ExcelFileName)
            data.setdefault('InputFlag', '1')

            if not g_DB.insert('u_r_pcb_product', data, 'TaskName="'+g_Task.Task + '"'):
                return result

            result = True
            return result
        finally:
            if result:
                self._ShowMessage((PCBCode + '单板信息提交完成!'))
            else:
                self._ShowMessage(('单板信息提交失败!'))

    def _SaveDataToExcel(self, FileName):
        # AllCheckList = self.GetAllCheckBoXList()
        #暂时不实现
        return True
        pass

    def UpdateSubTaskStatus(self):
        SQL = 'select * from U_TaskDetail where TaskName="' + g_Task.Task + '"'
        SQL += ' and SubTaskID = 1'

        now = str(time.strftime("%Y/%m/%d", time.localtime()))
        data = {}
        data.setdefault('SubTaskRealDate', '"%s"' % now)
        data.setdefault('SubTaskStatus', '"已完成"')

        g_DB.insert('U_TaskDetail', data, 'TaskName="' + g_Task.Task + '"')

        data = {}
        now = str(time.strftime("%Y/%m/%d", time.localtime()))
        data.setdefault('SubTaskRealDate', '"%s"' % now)
        data.setdefault('SubTaskStatus', '"已完成"')
        condition = 'TaskName="' + g_Task.Task + '" and SubTaskID=1'
        g_DB.insert('U_TaskDetail', data, condition)

        data = {}
        data.setdefault('SubTaskStatus', '"进行中"')
        condition = 'TaskName="' + g_Task.Task + '" and SubTaskID=2'
        g_DB.insert('U_TaskDetail', data, condition)

        data = {}
        data.setdefault('SubTaskStatus', '"未启动"')
        condition = 'TaskName="' + g_Task.Task + '" and SubTaskID>2'
        g_DB.insert('U_TaskDetail', data, condition)

        # ????????
        data = {}
        data.setdefault('TaskStatus', '-10000')
        data.setdefault('TaskStatus', '2')
        condition = 'TaskName="' + g_Task.Task + '"'
        g_DB.insert('U_TaskDetail', data, condition)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = InfoInput(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())