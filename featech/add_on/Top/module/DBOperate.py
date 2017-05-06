import pymysql
import pickle
import os
import threading
from Top.module.Crypto import *

Lock = threading.Lock()

class DBOperate(object):
    # # 保证是单例模式
    # __instance = None
    #
    # def __new__(cls, *args, **kwargs):
    #     if not cls.__instance:
    #         try:
    #             Lock.acquire()
    #             # double check
    #             if not cls.__instance:
    #                 cls.__instance = super(DBOperate, cls).__new__(cls, *args, **kwargs)
    #         finally:
    #             Lock.release()
    #     return cls.__instance

    def __init__(self, FileName):
        super(DBOperate, self).__init__()

        data = {}
        try:
            if os.path.exists(FileName):
                f = open(FileName, 'rb')
                data = pickle.load(f)
                data = deciphering_data(data)
                f.close()
        except:
            self.Error = '数据库文件错误'


        self._ServerAdds = data.get('ServerAdds', '127.0.0.1')
        self._ServerPort = data.get('ServerPort', '3306')
        self._UserName = data.get('UserName', 'root')
        self._Password = data.get('Password', 'wanli')
        self._DB = data.get('DB', 'ids')

        self._Isconnection = False

    # def __del__(self):
    #     self.close()


    def connection(self):
        try:
            self._connection = pymysql.connect(host = self._ServerAdds,
                                          port = int(self._ServerPort),
                                          user = self._UserName,
                                          password = self._Password,
                                          db = self._DB,
                                          charset = 'utf8mb4',
                                          cursorclass = pymysql.cursors.DictCursor)
            self._Isconnection = True
            self._cursor = self._connection.cursor()
            return True

        except Exception as e:
            # 如果失败表示数据库配置有误
            self.Error = "连接数据失败"
            return False


    def close(self):
        if self._Isconnection:
            self._connection.close()
            self._Isconnection = False

    def Execute(self, SQLStr):
        if len(SQLStr) == 0:
            self.Error = 'SQL语句错误！'
            return False
        try:
            self._cursor.execute(SQLStr)
            return True
        except Exception as e:
            self.Error = "Execute database exception, " + str(e)
            return False

    def fetch_all(self):
        res = False
        if (self._Isconnection and self._cursor):
            res = self._cursor.fetchall()
        return res

    def IsEmpty(self):
        if self.fetch_all(): return True
        else: return False

    def Update(self, sql):
        flag = False
        if (self._Isconnection and self._cursor):
            try:
                self._cursor.execute(sql)
                self._conn.commit()
                return True
            except Exception as e:
                self.Error = "update database exception, " + str(e)
                return False

        return flag

    def Commit(self):
        try:
            self._connection.commit()
            return True
        except Exception as e:
            self.Error = "Commit faile: " + str(e)
            return False

    def rollback(self):
        self.connection.rollback()

    #将字典以key-value对的形式存储到数据库
    def InsertDictToData(self, table, data_dict, condition = ''):
        key = ",".join(k for k in data_dict.keys())
        value = ",".join(k for k in data_dict.values())

        if len(condition) == 0:
            SQL = r'INSERT INTO %s (%s)VALUE (%s)' % (table, key, value)
        else:
            SQL = r'INSERT INTO %s (%s)VALUE (%s) WHERE %s' % (table, key, value, condition)

        if not self.Execute(SQL):
            return False

        if not self.Commit():
            return False

        return True
