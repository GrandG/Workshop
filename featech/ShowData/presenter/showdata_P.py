from view.showdata import Ui_MainWindow
from PyQt5.QtWidgets import QMainWindow, QApplication, QWidget, QVBoxLayout
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
import sys
from matplotlib.figure import Figure
from PyQt5.QtCore import QTimer


class ShowDataP(QMainWindow, Ui_MainWindow):
    def __init__(self):
        super().__init__()
        super().setupUi(self)

        self.main_widget = QWidget(self)

        l = QVBoxLayout(self.main_widget)
        dc = Dynamic(self.main_widget)
        l.addWidget(dc)
        l.addLayout(self.horizontalLayout)

        self.setCentralWidget(self.main_widget)


class Canvas(FigureCanvas):
    def __init__(self, parent=None):
        fig = Figure()
        self.ax = fig.add_subplot(1, 1, 1)
        FigureCanvas.__init__(self, fig)
        self.setParent = parent


class Dynamic(Canvas):
    def __init__(self, *args, **kwargs):
        Canvas.__init__(self, *args, **kwargs)
        timer = QTimer(self)
        timer.timeout.connect(self.update)
        timer.start(3)

    def update(self):
        pass

if __name__ == '__main__':
    app = QApplication(sys.argv)
    w = ShowDataP()
    w.show()
    sys.exit(app.exec_())
