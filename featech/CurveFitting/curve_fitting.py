import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from functions import efunc
from functions import lfunc
from functions import pfunc


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

    def poly(self):
        pass

    def exp(self, xfit=0):
        self._xfit = xfit
        self._popt, self._pcov = curve_fit(efunc, self._xdata, self._ydata)
        # return efunc(self._xfit, *self._popt)

    def exp_show(self, n=100):
        self._n = n
        self.exp()
        plt.plot(self._xdata, self._ydata, 'go',  np.linspace(self._xdata[0], self._xdata[-1], self._n),
                 efunc(np.linspace(self._xdata[0], self._xdata[-1], self._n), *self._popt))
        plt.show()

    def loga(self, xfit=0):
        self._xfit = xfit
        self._popt, self._pcov = curve_fit(lfunc, self._xdata, self._ydata)

    def loga_show(self, n=100):
        self._n = n
        self.loga()
        plt.plot(self._xdata, self._ydata, 'go', np.linspace(self._xdata[0], self._xdata[-1], self._n),
                 lfunc(np.linspace(self._xdata[0], self._xdata[-1], self._n), *self._popt))
        plt.show()

    def power(self, xfit=0):
        self._xfit = xfit
        self._popt, self._pcov = curve_fit(pfunc, self._xdata, self._ydata)

    def power_show(self, n=100):
        self._n = n
        self.power()
        plt.plot(self._xdata, self._ydata, 'go', np.linspace(self._xdata[0], self._xdata[-1], self._n),
                 pfunc(np.linspace(self._xdata[0], self._xdata[-1], self._n), *self._popt))
        plt.show()

