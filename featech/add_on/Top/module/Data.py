import os
import threading

Lock = threading.Lock()

class Data(object):
    #保证是单例模式
    __instance = None
    def __new__(cls, *args, **kwargs):
        if not cls.__instance:
            try:
                Lock.acquire()
                # double check
                if not cls.__instance:
                    cls.__instance = super(Data, cls).__new__(cls, *args, **kwargs)
            finally:
                Lock.release()
        return cls.__instance

    def __init__(self):
        super(object, self).__init__()

        self.path = os.getcwd() + '\\'
        self.tools = 'tools\\'
        self.data = 'data\\'
        self.log = 'log\\'
        self.MySqlConfigFileName = 'MySQLServer.dat'

        if not os.path.exists(self.path + self.data):
            os.mkdir(self.path + self.data)

        if not os.path.exists(self.path + self.log):
            os.mkdir(self.path + self.log)
