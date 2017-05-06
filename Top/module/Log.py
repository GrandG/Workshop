import logging
import base64
import sys
import datetime
import threading

Lock = threading.Lock()

class Log(object):
    #保证是单例模式
    # __instance = None
    # def __new__(cls, *args, **kwargs):
    #     if not cls.__instance:
    #         try:
    #             Lock.acquire()
    #             # double check
    #             if not cls.__instance:
    #                 cls.__instance = super(Log, cls).__new__(cls, *args, **kwargs)
    #         finally:
    #             Lock.release()
    #     return cls.__instance

    '''
    日志模块
    Info，Error类型的日志是对所有用户可见
    Debug，Critical类型日志只对开发人员可见，用于追踪错误
    '''

    def __init__(self, path):
        super(object, self).__init__()

        now = datetime.datetime.now()
        FileName = path + now.strftime('%Y%m%d%H%M%S') + '.log'

        logging.basicConfig(level=logging.DEBUG,
                            format='%(asctime)s %(levelname)s %(message)s',
                            datefmt='%H:%M:%S',
                            filename=FileName,
                            filemode='w',
                            )


    def _WriteLog(self, content, level):
        # 简易加密
        try:
            bytesString = content.encode(encoding="utf-8")
            encodestr = base64.b64encode(bytesString)
            log = encodestr.decode()
        except:
            return False

        if level == 'info':
            logging.info(log)
        elif level == 'debug':
            logging.debug(log)
        elif level == 'error':
            logging.error(log)
        elif level == 'critical':
            logging.critical(log)
        else:
            return False

        return True

        # 解码
        # decodestr = base64.b64decode(encodestr).decode()


    def LogDebug(self, content):
        # user表示的是当前用户名
        # Debug类型的日志需要添加代码文字
        content = 'user\t' + content + \
                  sys._getframe().f_back.f_code.co_filename + '\t' + \
                  str(sys._getframe().f_back.f_lineno)

        return self._WriteLog(content, 'debug')


    def LogInfo(self, content):
        # user表示的是当前用户名
        content = 'user\t' + content
        return self._WriteLog(content, 'info')


    def LogError(self, content):
        # user表示的是当前用户名
        # Error类型的日志需要添加代码文字
        content = 'user\t' + content + \
                  sys._getframe().f_back.f_code.co_filename + '\t' + \
                  str(sys._getframe().f_back.f_lineno)
        return self._WriteLog(content, 'error')


    def LogCritical(self, content):
        # user表示的是当前用户名
        # Critical类型的日志需要添加代码文字
        content = 'user\t' + content + \
                  sys._getframe().f_back.f_code.co_filename + '\t' + \
                  str(sys._getframe().f_back.f_lineno)
        return self._WriteLog(content, 'critical')


