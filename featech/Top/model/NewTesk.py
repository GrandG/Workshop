from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys
from Presenter.NewTask_P import NewTesk_P
from module.g_Top import g_DB, g_Log, g_Task
import time

class NewTesk(NewTesk_P):
    def __init__(self, Dialog=None, NeedShow=True):
        super(NewTesk, self).__init__(Dialog, NeedShow)
        pass

    # 主页面点击下一步时对当前页面的数据合法性进行检查,并保存数据，检查完成返回True否则返回False
    def CheckAndSaveData(self):
        return True

    #从数据库获取产品信息
    def GetProductInfo(self):
        SQL = r'select distinct class from dfr_productline'
        result = []
        if g_DB.Execute(SQL):
            res = g_DB.fetchAll()
            if res:
                for data in res:
                    for key in data:
                        result.append(data[key])
            g_Log.LogInfo('获取产品信息成功')
        else:
            g_Log.LogError('获取产品信息失败')
            g_Log.LogDebug('SQL语句:' + SQL)
            g_Log.LogDebug('失败原因:' + g_DB.error)

        return result

    # 从数据库获取产品族信息
    def GetProductFamilyInfo(self, ProductType):
        SQL = r'select productFamily from dfr_productline where Class="' + ProductType + '"'
        result = []
        if g_DB.Execute(SQL):
            res = g_DB.fetchAll()
            if res:
                for data in res:
                    for key in data:
                        result.append(data[key])

            g_Log.LogInfo('从数据库获取产品族信息成功')
        else:
            g_Log.LogError('从数据库获取产品族信息失败')
            g_Log.LogDebug('SQL语句:' + SQL)

        return result

    # 从数据库获取环境信息
    def GetEnvInfo(self):
        SQL = r'select distinct Env from dfr_productline'
        result = []
        if g_DB.Execute(SQL):
            res = g_DB.fetchAll()
            if res:
                for data in res:
                    for key in data:
                        result.append(data[key])
            g_Log.LogInfo('获取环境信息成功')
        else:
            g_Log.LogError('获取环境信息失败')
            g_Log.LogDebug('SQL语句:' + SQL)
        return result

    # 判断数据库中是否存在名为TaskName的任务
    def IsExistTask(self, TaskName):
        SQL = 'SELECT * FROM U_Task WHERE TaskName="'+ TaskName + '"'
        if g_DB.Execute(SQL):
            return not g_DB.isEmpty()

        #如果数据库操作失败则返回存在
        return True

    #提交任务
    def SubmitTask(self):
        data,PCBCode = self.GetDataFromView()
        if not data:
            return False

        if not g_DB.insert('u_task', data):
            return False

        SQL = r'select * from c_taskroledef order by code'

        now = str(time.strftime("%Y/%m/%d", time.localtime()))
        data1 = {}
        data1.setdefault('TaskName', data['TaskName'])
        data1.setdefault('SubTaskStartDate', '"%s"' % now)
        data1.setdefault('SubTaskEndDate', '"%s"' % now)
        data1.setdefault('SubTaskRealDate', '"%s"' % now)
        data1.setdefault('SubTaskOwner', data['TaskOwner'])

        IsFirst = True
        res = g_DB.ExecuteAndReturn(SQL)
        if not res: return False
        for d in res:
            data1['SubTaskID'] = '"%d"' % d.get('Code', '')
            data1['SubTaskName'] = '"%s"' % d.get('Role', '')
            if IsFirst:
                data1['SubTaskStatus'] = '"%s"' % '进行中'
            else:
                data1['SubTaskStatus'] = '"%s"' % '未启动'

            if not g_DB.insert('u_taskdetail', data1):
                return False

            IsFirst = False

        #该需求待定
        # for code in PCBCode.split(','):
        #     data1['PCBCode'] = '"%s"' % code
        #     SQL = 'UPDATE u_r_PCB_Product SET PCBCode = %s WHERE TaskName = %s' % (('"%s"' % code), data['TaskName'])
        #     if not g_DB.Execute(SQL):
        #         return False

        g_Task.Task = data['TaskName'][1:-1]
        g_Task.ProductType = data['ProductType'][1:-1]
        g_Task.ProductEnv = data['Env'][1:-1]

        #数据库执行正确
        return True

    def GetDataError(self):
        return g_DB.error

if __name__ == '__main__':
    app = QApplication(sys.argv)
    mainWindow = QMainWindow()
    ui = NewTesk(mainWindow)
    mainWindow.show()
    sys.exit(app.exec())