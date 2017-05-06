# /usr/bin/python
# coding: utf-8
def singleton(cls, *args, **kw):
    """ singleton decorator """
    instances = {}

    def _singleton():
        if cls not in instances:
            instances[cls] = object.__new__(cls, *args, **kw)
        return instances[cls]

    return _singleton

