from testdata import edata, ldata, pdata
from curve_fitting import CurveFitting
import numpy as np


if __name__ == '__main__':
    test0 = CurveFitting(ldata())    # 多项式拟合
    test0.poly_show(degree=9)

    # test1 = CurveFitting(edata())    # 指数拟合
    # test1.exp_show()
    #
    # test2 = CurveFitting(ldata())    # 对数拟合
    # test2.loga_show()
    #
    # test3 = CurveFitting(pdata())    # 幂函数拟合
    # test3.power_show()


