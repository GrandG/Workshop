from presenter.showdata_P import ShowDataP
from PyQt5.QtWidgets import QMainWindow, QApplication
import sys


class ShowDataM(ShowDataP):
    def __init__(self):
        super().__init__()

    def GetData(self):
        pass


if __name__ == '__main__':
    app = QApplication(sys.argv)
    w = ShowDataM()
    w.show()
    sys.exit(app.exec_())
