# /usr/bin/python
# coding: utf-8
import pymysql
from module.Singleton import singleton
import os
import pickle
from module.Crypto import *

OperationalError = pymysql.OperationalError

@singleton
class MySQL(object):
    def __init__(self):
        self.error = ''
        self._isConnection = False
        self._conn = None
        self._cur = None

    def connect(self, host=None, user=None, password=None, db=None, port=3306, charset="utf8"):
        '''
        :func  connect      通过指定参数连接数据库
        :return:            连接状态                bool
        '''
        try:
            self._conn = pymysql.connect(host=host, port=port, user=user, passwd=password, db=db)
            self._conn.autocommit(False)
            self._conn.set_charset(charset)
            self._cur = self._conn.cursor()
            self._isConnection = True
        except pymysql.Error as e:
            self.error = "Mysql connect error %d: %s" % (e.args[0], e.args[1])

        return self._isConnection

    def connectFromFile(self, fileName):
        '''
        :func  connectFromFile  通过文件连接数据库
        :param fileName:        指定读取主目录下的fileName   str
        :return:                连接状态                    bool
        '''
        if fileName:
            conFile = os.path.dirname(__file__).replace('\\', '/') + '/' + fileName
            try:
                self._conn = pymysql.connect(read_default_file=conFile)
                self._conn.autocommit(False)
                self._cur = self._conn.cursor()
                self._isConnection = True
            except pymysql.Error as e:
                self.error = "Mysql connect error %d: %s" % (e.args[0], e.args[1])

        return self._isConnection

    def ConnectFormFile(self, fileName):
        data = {}
        try:
            if os.path.exists(fileName):
                f = open(fileName, 'rb')
                data = pickle.load(f)
                data = deciphering_dict(data)
                f.close()
        except:
            self.error = '数据库文件错误'
            return False

        _ServerAdds = data.get('ServerAdds', '127.0.0.1')
        _ServerPort = data.get('ServerPort', '3306')
        _UserName = data.get('UserName', 'root')
        _Password = data.get('Password', 'wanli')
        _DB = data.get('DB', 'ids')

        try:
            self._conn = pymysql.connect(host=_ServerAdds, port=int(_ServerPort),
                                         user=_UserName, passwd=_Password, db=_DB,
                                         charset='utf8mb4',
                                         cursorclass=pymysql.cursors.DictCursor)
            self._conn.autocommit(False)
            self._cur = self._conn.cursor()
            self._isConnection = True
        except Exception as e:
            self.error = "Mysql connect error " + str(e)
            return False

        return self._isConnection

    def GetConnectState(self):
        return self._isConnection

    def query(self, sql):
        '''
        :func   query   查询
        :param sql:     sql语句     str
        :return:        查询状态    bool
        '''
        return self.excute(sql)

    def fetchRow(self):
        '''
        :func   fetchRow    获取结果的一行数据
        :return:            结果                set
        '''
        result = self._cur.fetchone()
        return result

    def fetchAll(self):
        res = False
        if (self._isConnection and self._cur):
            res = self._cur.fetchall()
        return res

    def isEmpty(self):
        '''
        :func   isEmpty     结果是否为空
        :return:            结果状态      bool
        '''
        return not bool(self.rowcount())

    def insert(self, table_name, data, condition='', NeedCommit = True):
        key = ",".join(k for k in data.keys())
        value = ",".join(k for k in data.values())

        if len(condition) == 0:
            SQL = r'INSERT INTO %s (%s)VALUE (%s)' % (table_name, key, value)
        else:
            SQL = r'INSERT INTO %s (%s)VALUE (%s) WHERE %s' % (table_name, key, value, condition)

        if not self.Execute(SQL):
            return False

        if NeedCommit: return self.commit()
        else: return True

    def update(self, table_name, data, condition = '', NeedCommit = True):
        '''
        :func   update      更新数据库
        :param table_name:  数据库表名    str
        :param data:        新数据        dict
        :param condition:   条件          str
        :return:            执行状态      bool
        '''

        value = ",".join(k + '=' + data[k]  for k in data.keys())
        if len(condition) == 0:
            SQL = r'UPDATE %s SET %s' % (table_name, value)
        else:
            SQL = r'UPDATE %s SET %s WHERE %s' % (table_name, value, condition)

        if not self.Execute(SQL):
            return False

        if NeedCommit: return self.commit()
        else: return True

        if not self.Execute(SQL):
            return False

        if NeedCommit: return self.commit()
        else: return True

    def delete(self, table_name, condition):
        '''
        :func   delete         删除数据
        :param table_name:     数据库表名   str
        :param condition:      条件         str
        :return:               执行状态     bool
        '''
        _prefix = "".join(['DELETE FROM  `', table_name, '`', ' WHERE '])
        _sql = "".join([_prefix, condition])
        return self.Execute(_sql)

    def getLastInsertId(self):
        '''
        :func       获取最后一次操作的ID
        :return:    数据的ID               int
        '''
        return self._cur.lastrowid

    def rowcount(self):
        '''
        :func   rowcount    操作数据的总行数
        :return:            总行数             int
        '''
        return self._cur.rowcount

    def Execute(self, sql):
        '''
        :func   excute  执行操作
        :param sql:     sql语句     str
        :return:        执行状态    bool
        '''
        if len(sql):
            try:
                self._cur.execute(sql)
            except Exception as e:
                self.error = "Mysql query error:%s SQL:%s" % (e, sql)
                return False

        return True

    def excuteMany(self, table_name, fields, data, condition=''):
        '''
        :func   excuteMany  插入多行数据
        :param table_name:  数据表名称   str
        :param fields:      列名称       list or str
        :param data:        数据列表     list(内含set)
        :param condition:   条件         str
        :return:            执行状态     bool
        '''
        if not data:
            return
        _prefix = "".join(['INSERT INTO `', table_name, '`'])
        if isinstance(fields, str):
            _fields = fields
        else:
            _fields = ",".join(fields)
        if len(condition) > 0:
            condition = "WHERE " + condition
        _positions = ",".join("%s" for i in range(len(data[0])))
        _sql = "".join([_prefix, "(", _fields, ") VALUES (", _positions, ") ", condition])
        try:
            self._cur.Executemany(_sql, data)
        except Exception as e:
            self.error = "Mysql query error:%s SQL:%s" % (e, _sql.format(data))

        return self.isEmpty()

    def commit(self):
        '''
        :func   commit  确认提交
        :return:        执行状态    bool
        '''
        try:
            self._conn.commit()
            return True
        except Exception as e:
            self.error = "Commit fail: " + str(e)
            return False

    def rollback(self):
        '''
        :func   rollback    撤销操作
        :return:            执行状态    bool
        '''
        try:
            self._conn.rollback()
            return True
        except Exception as e:
            self.error = "Rollback fail: " + str(e)
            return False

    def close(self):
        '''
        :func   close   关闭数据库
        :return:        执行状态    bool
        '''
        try:
            if self._isConnection:
                self._cur.close()
                self._conn.close()
                self._isConnection = False
            return True
        except Exception as e:
            return False

    def ExecuteAndReturn(self, sql):
        if self.Execute(sql):
            return self.fetchAll()

        return False

    # 判断data中是否有key为column_name， 值为value的数据对
    def Locate(self, column_name, value, data):
        for d in data:
            if d.get(column_name, '') == value: return True

        return False