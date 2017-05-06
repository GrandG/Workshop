import os
import sys
import threading
import datetime
from module.Data import Data
from module.Log import Log
from module.DBOperate import DBOperate
from module.Task import *
from module.MySql import MySQL

g_Data = Data()
g_Log = Log(g_Data.log)
# g_DB = DBOperate(g_Data.path + g_Data.data + g_Data.MySqlConfigFileName)
g_DB = MySQL()
g_UserName = ''
g_Task = Task()
g_UserInfo = UserInfo()
