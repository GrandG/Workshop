import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from functions import efunc
from functions import lfunc
from functions import pfunc
import warnings


class CurveFitting:
    """曲线拟合"""
    def __init__(self, points):
        """对输入坐标进行矩阵化处理，并按横坐标排序"""
        try:
            self._points = points
            self._xdata = np.array([i[0] for i in sorted(self._points, key=lambda x: x[0])])
            self._ydata = np.array([i[1] for i in sorted(self._points, key=lambda x: x[0])])
        except TypeError:
            print('输入错误的坐标')

        self._xfit = 0
        self._yfit = 0
        self._n = 0
        self._popt = []
        self._pcov = None

    def poly(self, xfit, degree=3):
        """多项式拟合，默认最高阶是3"""
        with warnings.catch_warnings():
            warnings.filterwarnings('error')
            try:
                self._xfit = xfit
                z = np.polyfit(self._xdata, self._ydata, degree)
                p = np.poly1d(z)
                return p(self._xfit)
            except np.RankWarning:
                print('多项式拟合效果差')
            except TypeError:
                print('多项式拟合失败')
                return False

    def poly_show(self, n=100, degree=3):
        """绘图"""
        try:
            self._n = n
            plt.plot(self._xdata, self._ydata, 'ro', label='true')
            plt.plot(np.linspace(self._xdata[0], self._xdata[-1],
                                 self._n), self.poly(np.linspace(self._xdata[0], self._xdata[-1],
                                                                 self._n), degree=degree), label='poly fitting')
            plt.xlabel("x")
            plt.ylabel("y", rotation='horizontal')
            plt.grid(True)
            plt.legend()
            plt.show()
        except ValueError:
            print('绘图失败')
            return False
        except AttributeError:
            print('绘图失败')
            return False

    def exp(self, xfit=0):
        """指数拟合"""
        try:
            self._xfit = xfit
            self._popt, self._pcov = curve_fit(efunc, self._xdata, self._ydata)
            return efunc(self._xfit, *self._popt)
        except AttributeError:
            print('指数拟合失败')
            return False

    def exp_show(self, n=100):
        """绘图"""
        try:
            self._n = n
            # self.exp()
            plt.plot(self._xdata, self._ydata, 'ro', label='true')
            plt.plot(np.linspace(self._xdata[0], self._xdata[-1], self._n),
                     self.exp(np.linspace(self._xdata[0], self._xdata[-1], self._n)), label='exp fitting')
            plt.xlabel("x")
            plt.ylabel("y", rotation='horizontal')
            plt.grid(True)
            plt.legend()
            plt.show()
        except AttributeError:
            print('绘图失败')
            return False

    def loga(self, xfit=1):
        """对数拟合，输入横坐标要求是正数"""
        with warnings.catch_warnings():
            warnings.filterwarnings('error')
            try:
                self._xfit = xfit
                self._popt, self._pcov = curve_fit(lfunc, self._xdata, self._ydata)
                return lfunc(self._xfit, *self._popt)
            except RuntimeWarning:
                print('输入横坐标必须为正数')
                return False
            except AttributeError:
                print('对数拟合失败')
                return False


    def loga_show(self, n=100):
        """绘图"""
        try:
            self._n = n
            plt.plot(self._xdata, self._ydata, 'ro', label='true')
            plt.plot(np.linspace(self._xdata[0], self._xdata[-1], self._n),
                     self.loga(np.linspace(self._xdata[0], self._xdata[-1], self._n)), label='loga fitting')
            plt.xlabel("x")
            plt.ylabel("y", rotation='horizontal')
            plt.grid(True)
            plt.legend()
            plt.show()
        except ValueError:
            print('绘图失败')
            return False
        except AttributeError:
            print('绘图失败')
            return False

    def power(self, xfit=0):
        """幂函数拟合"""
        try:
            self._xfit = xfit
            self._popt, self._pcov = curve_fit(pfunc, self._xdata, self._ydata)
            return pfunc(self._xfit, *self._popt)
        except AttributeError:
            print('幂函数拟合失败')
            return False

    def power_show(self, n=100):
        """绘图"""
        try:
            self._n = n
            self.power()
            plt.plot(self._xdata, self._ydata, 'ro', label='true')
            plt.plot(np.linspace(self._xdata[0], self._xdata[-1], self._n),
                     self.power(np.linspace(self._xdata[0], self._xdata[-1], self._n)), label='power fitting')
            plt.xlabel("x")
            plt.ylabel("y", rotation='horizontal')
            plt.grid(True)
            plt.legend()
            plt.show()
        except AttributeError:
            print('绘图失败')
            return False


