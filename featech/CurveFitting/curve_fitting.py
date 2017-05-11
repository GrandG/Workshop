import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from functions import efunc
from functions import lfunc
from functions import pfunc
# import warnings
# np.seterr(all='warn')


class CurveFitting:
    def __init__(self, points):
        self._points = points
        self._xdata = np.array([i[0] for i in sorted(self._points, key=lambda x: x[0])])
        self._ydata = np.array([i[1] for i in sorted(self._points, key=lambda x: x[0])])
        self._xfit = 0
        self._yfit = 0
        self._n = 0
        self._popt = []
        self._pcov = None

    def poly(self, xfit, degree=3):
        self._xfit = xfit
        z = np.polyfit(self._xdata, self._ydata, degree)
        p = np.poly1d(z)
        return p(self._xfit)

    def poly_show(self, n=100, degree=3):
        try:
            self._n = n
            plt.plot(self._xdata, self._ydata, 'ro', label='true')
            plt.plot(np.linspace(self._xdata[0], self._xdata[-1],
                                 self._n), self.poly(np.linspace(self._xdata[0],
                                                                 self._xdata[-1], self._n),
                                                     degree=degree), label='poly fitting')
            plt.xlabel("x")
            plt.ylabel("y")
            plt.legend()
            plt.show()
        except Warning as w:
            print('Now is {}'.format(w))

    def exp(self, xfit=0):
        self._xfit = xfit
        self._popt, self._pcov = curve_fit(efunc, self._xdata, self._ydata)
        # return efunc(self._xfit, *self._popt)

    def exp_show(self, n=100):
        self._n = n
        self.exp()
        plt.plot(self._xdata, self._ydata, 'ro', label='true')
        plt.plot(np.linspace(self._xdata[0], self._xdata[-1], self._n), efunc(np.linspace(self._xdata[0],
                 self._xdata[-1], self._n), *self._popt), label='exp fitting')
        plt.xlabel("x")
        plt.ylabel("y")
        plt.legend()
        plt.show()

    def loga(self, xfit=0):
        self._xfit = xfit
        self._popt, self._pcov = curve_fit(lfunc, self._xdata, self._ydata)

    def loga_show(self, n=100):
        self._n = n
        self.loga()
        plt.plot(self._xdata, self._ydata, 'ro', label='true')
        plt.plot(np.linspace(self._xdata[0], self._xdata[-1], self._n),
                 lfunc(np.linspace(self._xdata[0], self._xdata[-1], self._n), *self._popt), label='loga fitting')
        plt.xlabel("x")
        plt.ylabel("y")
        plt.legend()
        plt.show()

    def power(self, xfit=0):
        self._xfit = xfit
        self._popt, self._pcov = curve_fit(pfunc, self._xdata, self._ydata)

    def power_show(self, n=100):
        self._n = n
        self.power()
        plt.plot(self._xdata, self._ydata, 'ro', label='true')
        plt.plot(np.linspace(self._xdata[0], self._xdata[-1], self._n),
                 pfunc(np.linspace(self._xdata[0], self._xdata[-1], self._n), *self._popt), label='power fitting')
        plt.xlabel("x")
        plt.ylabel("y")
        plt.legend()
        plt.show()
        plt.show()

