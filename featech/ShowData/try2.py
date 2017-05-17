from PyQt5.QtWidgets import QMainWindow, QApplication, QWidget, QVBoxLayout
import sys
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure
import numpy as np
from test import Ui_Dialog
from PyQt5.QtCore import QTimer


class Canvas(FigureCanvas):
    def __init__(self, parent=None):
        fig = Figure()
        self.ax = fig.add_subplot(111)

        self.compute_initial()

        FigureCanvas.__init__(self, fig)
        self.setParent(parent)

    def compute_initial(self):
        pass


class Static(Canvas):
    def compute_initial(self):
        t = np.arange(0, 10, 0.1)
        s = np.sin(3*np.pi*t)
        self.ax.plot(t, s)


class Dynamic(Canvas):
    def __init__(self, *args, **kwargs):
        self.end = 1
        Canvas.__init__(self, *args, **kwargs)
        timer = QTimer(self)
        timer.timeout.connect(self.update_figure)
        timer.start(11)

    def compute_initial(self):
        self.ax.plot([1, 2, 3, 4], [1, 3, 54, 67])

    def update_figure(self):
        self.end += 0.01
        self.ax.cla()
        t = np.arange(0, self.end, 0.01)
        s = np.sin(2*np.pi*t)
        self.ax.plot(t, s)
        # print([random.randint(0, 10)] * 4)
        self.draw()


class Example(QMainWindow, Ui_Dialog):
    def __init__(self):
        super().__init__()
        self.setupUi(self)

        self.main_widget = QWidget(self)
        l = QVBoxLayout(self.main_widget)
        sc = Static(self.main_widget)
        l.addWidget(sc)

        dc = Dynamic(self.main_widget)
        l.addWidget(dc)

        # dc = MyDynamicMplCanvas(self.main_widget)
        # l.addWidget(dc)

        # self.main_widget.setFocus()
        self.setCentralWidget(self.main_widget)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    w = Example()
    w.show()
    sys.exit(app.exec_())
