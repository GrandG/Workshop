import numpy as np
from functions import efunc
from functions import lfunc
from functions import pfunc


x_data = np.linspace(1, 10, 10)


def pdata():
    pass


def edata():
    y = efunc(x_data, 2, -2, 4)
    y_noise = 0.5 * np.random.normal(size=x_data.size)
    y_data = y + y_noise
    return [(x_data[i], y_data[i]) for i in range(len(x_data))]


def ldata():
    y = lfunc(x_data, 1, 3)
    y_noise = 0.1 * np.random.normal(size=x_data.size)
    y_data = y + y_noise
    return [(x_data[i], y_data[i]) for i in range(len(x_data))]


def pdata():
    y = pfunc(x_data, 2, 2)
    y_noise = 10 * np.random.normal(size=x_data.size)
    y_data = y + y_noise
    return [(x_data[i], y_data[i]) for i in range(len(x_data))]


# print(pdata())
