from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.DFRRiskAnalyse_P import DFRRiskAnalyse_P
from module.g_Top import *

class DFRRiskAnalyse(DFRRiskAnalyse_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(DFRRiskAnalyse, self).__init__(Dialog, NeedShow)
        pass

    # 主页面点击下一步时对当前页面的数据合法性进行检查,并保存数据，检查完成返回True否则返回False
    def CheckAndSaveData(self):
        return True

    def GetRuleList(self):
        SQL = 'select name from general_info where type="S_DFRLIB"'
        if not g_DB.Execute(SQL):
            return False
        res = g_DB.fetch_all()
        if not res: return False

        SQL = 'select * from ('
        IsFirst = True

        for d in res:
            if not IsFirst: SQL += ' UNION '
            SQL += 'select code,RuleContent,Function,'
            SQL += 'TrigCond,Product,class,Env,Tool from '
            SQL += d.get('name', '')
            IsFirst = False

        SQL += ') as ruleQuery '
        SQL += 'where (Product="通用") or (product like "%' + g_Task.ProductType + '%")'

        if not g_DB.Execute(SQL):
            return False

        return g_DB.fetch_all()

    def GetPcbData(self):
        SQL = 'select * from u_r_pcb_product where TaskName="' + g_Task.Task + '"'
        if not g_DB.Execute(SQL): return False
        return g_DB.fetchAll()[0]

    def ExportBomToDB(self):
        FileName = g_Data.path + 'OutputFormat\\U_BOM.dat'
        pass

    def MergeBomAndBrd(self):
        pass

    #提交分析结果
    def DFRResultExport(self):
        '''
        还缺少从界面获取codelist,未完成
        '''

        SQL = 'select name from general_info where type="S_DFRLIB"'
        if not g_DB.Execute(SQL): return False
        res = g_DB.fetchAll()
        if not res: return False

        SQL = 'select * from ('
        IsFirst = True
        for data in res:
            if not IsFirst: SQL += ' UNION'
            SQL += ' select Code,Class,FMEA_Effect,FMEA_Mode,FMEA_Reason,FMEA_ProposalGroup,'
            SQL += ' FMEA_Proposal from ' + data.get('name', '')
            IsFirst = True
        SQL += ') as ruleQuery where Code in ("")'

        if not g_DB.Execute(SQL): return False
        res1 = g_DB.fetchAll()
        if not res1: return False

        pcbData = self.GetPcbData()

        SQL = 'delete from u_FMEADetail where subTaskName="FMEA" and TaskName="' + g_Task.Task + '"'
        SQL += ' and product="' + pcbData['pcbcode'] + '"'
        if not g_DB.Execute(SQL): return False

        condition = 'subTaskName="FMEA" and TaskName="' + g_Task.Task + '"' \
                    + ' and Product="' + pcbData['pcbcode'] + '"'
        for data in res1:
            d = {}
            d.setdefault('TaskName', '"%s"' % g_Task.Task)
            d.setdefault('SubTaskName', '"%s"' % 'FMEA')
            d.setdefault('Type', '"%s"' % '自动识别风险')
            d.setdefault('Product', pcbData['pcbcode'])
            d.setdefault('Product', pcbData['pcbcode'])

            data['Code'] = g_Task.Task + '_' + data['Code']
            for key in data.keys():
                data[key] = '"%s"' % data[key]
            d.update(data)

            if not g_DB.insert('u_FMEADetail', d, condition): return False

        if not g_DB.update('u_r_pcb_product', {'DFRFlag':'1'},'TaskName="' + g_Task.Task + '"'):
            return False

        return True

    def ExtractBrdData(self, cmdFN, outputFN, FieldFN, outputGrid, sp, fdsize=50):
        datapath = g_Data.path + 'Project\\' + g_Task.Task + '\\'\
                   + g_Task.Task + '_' + self.GetPcbData()['pcbcode']
        extractPath = '"' + g_Data.path + 'extracta.exe"'
        brdFullPath = '"' + datapath + '_Brd.brd"'
        cmdFullPath = '"' + g_Data.path + 'OutputFormat\\' + cmdFN + '"'
        outputFullPath = '"' + g_Data.path + outputFN + '"'
        recStrList = []
        strList = []
        fieldStrList = []



if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = DFRRiskAnalyse(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())