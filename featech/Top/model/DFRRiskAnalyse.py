from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox
import sys
from Presenter.DFRRiskAnalyse_P import DFRRiskAnalyse_P
from module.g_Top import *
import xlrd
import os

class DFRRiskAnalyse(DFRRiskAnalyse_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(DFRRiskAnalyse, self).__init__(Dialog, NeedShow)
        self.InputData = None
        pass

    # 主页面点击下一步时对当前页面的数据合法性进行检查,并保存数据，检查完成返回True否则返回False
    def CheckAndSaveData(self):
        if not self.NextConfirm(): return False
        else:return True

    # 获取规则列表
    def GetRuleList(self):
        SQL = 'select name from general_info where type="S_DFRLIB"'
        res = g_DB.ExecuteAndReturn(SQL)
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

        return g_DB.ExecuteAndReturn(SQL)

    def AnalyzeRule(self):
        def Getdigit(s):
            import re
            return re.sub("\D", "", s)

        def StrHaveLst(s, lst):
            for l in lst:
                if l in s:
                    return l
            return ''

        CompareSymbols = {'<':['小于','以下','不大于'], '>':['大于','以上','超过'], '=':['等于','相当于']}
        names = ['单板表面','电池', 'BGA器件']
        attributes = ['相对湿度', '重量', '距离', '螺钉位置']
        units = ['mm', 'MM', '毫米', '%', '％', 'kg', 'Kg','KG', 'kG', 'g','G', '千克', '克']

        data = self.GetRuleList()
        res = []

        for d in data:
            dict = {}
            RulrContent = d['RuleContent']
            digit = Getdigit(RulrContent)
            if not digit: continue          #暂时只对量化的数据进行处理
            dict.setdefault('digit', float(digit))

            name = StrHaveLst(RulrContent, names)
            if not name: continue
            dict.setdefault('name', name)

            attribute = StrHaveLst(RulrContent, attributes)
            if not attribute: continue
            dict.setdefault('attribute', attribute)

            unit = StrHaveLst(RulrContent, units)
            if not unit: continue
            dict.setdefault('unit', unit)

            Symbol = False
            for key in CompareSymbols.keys():
                if StrHaveLst(RulrContent,CompareSymbols[key]):
                    Symbol = key
                    break
            if not Symbol: continue
            dict.setdefault('Symbol', Symbol)
            dict.setdefault('code', d['code'])
            res.append(dict)
            print(d['code'])

        self.InputData = res
        return res

    # 获取pcb数据
    def GetPcbData(self):
        SQL = 'select * from u_r_pcb_product where TaskName="' + g_Task.Task + '"'
        if not g_DB.Execute(SQL): return False
        return g_DB.fetchRow()

    def MergeBomAndBrd(self):
        pass

    #提交分析结果
    def DFRResultExport(self):
        '''
        还缺少从界面获取codelist,未完成
        '''

        SQL = 'select name from general_info where type="S_DFRLIB"'
        res = g_DB.ExecuteAndReturn(SQL)
        if not res: return False

        SQL = 'select * from ('
        IsFirst = True
        for data in res:
            if not IsFirst: SQL += ' UNION'
            SQL += ' select Code,Class,FMEA_Effect,FMEA_Mode,FMEA_Reason,FMEA_ProposalGroup,'
            SQL += ' FMEA_Proposal from ' + data.get('name', '')
            IsFirst = True
        SQL += ') as ruleQuery where Code in ("")'

        res1 = g_DB.ExecuteAndReturn(SQL)
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

    # 将BOM表中的数据读出
    def GetBOMData(self):
        # FileName = self.GetBOMFileName()
        # if not FileName: return False
        # if not os.path.exists(FileName): return False
        FileName = 'F:/test/BOM.xls'        #目前只做测试用

        f = xlrd.open_workbook(FileName)
        table = f.sheets()[0]

        nrows = table.nrows
        ncols = table.ncols
        data = []

        for i in range(0, nrows):
            d = []
            for j in range(0, ncols):
                s = table.cell(i, j).value
                if type(s) != type('a'):
                    s = str(int(s))

                d.append(s.strip())
            data.append(d)
        return data

    # 获取BOM表的位置
    def GetBOMFileName(self):
        destPath = g_Data.path + 'Project\\' + g_Task.task + '\\'
        SQL = 'select * from u_r_pcb_product where TaskName="' + g_Task.Task + '"'
        res = g_DB.ExecuteAndReturn(SQL)
        if not res: return False

        PCBCode = res[0]['PCBCode']

        return destPath + '_' + PCBCode + '_Bom.xls'

    # 将BOM数据存储到虚拟表中
    def ExportBomToDB(self):
        BomData = self.GetBomDataFromView()
        title = BomData[0]
        del BomData[0]
        SQL = 'CREATE TEMPORARY TABLE t_Bom ( ID int(11) NOT NULL AUTO_INCREMENT'

        for name in title:
            SQL += ',' + name + 'VARCHAR(10)'
        SQL += ', PRIMARY KEY (ID))'

        if not g_DB.Execute(SQL): return False

        for data in BomData:
            d = {}
            for i in range(0, len(title)):
                d.setdefault(title[i], '"%s"' % data[i])
            g_DB.insert('t_Bom', d)




if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = DFRRiskAnalyse(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())