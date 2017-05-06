import os
import sys
import threading
import datetime
from Top.module.Data import Data
from Top.module.Log import Log
from Top.module.DBOperate import DBOperate
from Top.module.Task import *
from Top.module.MySql import MySQL

g_Data = Data()
g_Log = Log(g_Data.log)
# g_DB = DBOperate(g_Data.path + g_Data.data + g_Data.MySqlConfigFileName)
g_DB = MySQL()
g_UserName = ''
g_Task = Task()
g_UserInfo = UserInfo()
