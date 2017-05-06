from module.Singleton import singleton

# @singleton
class Task:
    def __init__(self):
        self._Task = ''
        self._btnTask = ''
        self._owner = ''
        self._Func = ''
        self._ProductType = ''
        self._ProductCode = ''
        self._ProductEnv = ''

    @property
    def Task(self):
        return self._Task

    @Task.setter
    def Task(self, Task):
        if not isinstance(Task, str):
            raise ValueError('{}不是字符串'.format(Task))
        self._Task = Task

    @property
    def btnTask(self):
        return self._btnTask

    @btnTask.setter
    def btnTask(self, btnTask):
        if not isinstance(btnTask, str):
            raise ValueError('{}不是字符串'.format(btnTask))
        self._btnTask = btnTask

    @property
    def owner(self):
        return self._owner

    @owner.setter
    def owner(self, owner):
        if not isinstance(owner, str):
            raise ValueError('{}不是字符串'.format(owner))
        self._owner = owner

    @property
    def Func(self):
        return self._Func

    @Func.setter
    def Func(self, Func):
        if not isinstance(Func, str):
            raise ValueError('{}不是字符串'.format(Func))
        self._Func = Func

    @property
    def ProductType(self):
        return self._ProductType

    @ProductType.setter
    def ProductType(self, ProductType):
        if not isinstance(ProductType, str):
            raise ValueError('{}不是字符串'.format(ProductType))
        self._ProductType = ProductType

    @property
    def ProductCode(self):
        return self._ProductCode

    @ProductCode.setter
    def ProductCode(self, ProductCode):
        if not isinstance(ProductCode, str):
            raise ValueError('{}不是字符串'.format(ProductCode))
        self._ProductCode = ProductCode

    @property
    def ProductEnv(self):
        return self._ProductEnv

    @ProductEnv.setter
    def ProductEnv(self, ProductEnv):
        if not isinstance(ProductEnv, str):
            raise ValueError('{}不是字符串'.format(ProductEnv))
        self._ProductEnv = ProductEnv


# @singleton
class UserInfo():
    def __init__(self):
        self._LoginRights = ''
        self._group = ''

    @property
    def LoginRights(self):
        return self._LoginRights

    @LoginRights.setter
    def LoginRights(self, LoginRights):
        if not isinstance(LoginRights, str):
            raise ValueError('{}不是字符串'.format(LoginRights))
        self._LoginRights = LoginRights

    @property
    def group(self):
        return self._group

    @LoginRights.setter
    def group(self, group):
        if not isinstance(group, str):
            raise ValueError('{}不是字符串'.format(group))
        self._group = group