import numpy as np


def efunc(x, a, b, c):
    return a * np.exp(-b * x) + c


def lfunc(x, a, b):
    return a * np.log(x) + b


def pfunc(x, a, b):
    return np.power(x, a) + b
