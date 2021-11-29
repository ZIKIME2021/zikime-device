import pickle
import sys
import requests
import random

from PySide6.QtWidgets import *
from PySide6.QtCore import *


class ScoreDB(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()
        self.dbfilename = 'regist_number.dat'
        self.numberDB = []
        self.read_numberDB()

    def initUI(self):
        self.setGeometry(0, 0, 640, 480)
        self.setWindowTitle('ZIKIME')

        widgetWidth = self.size().width()
        widgetHeight = self.size().height()

        buttonLayout = QHBoxLayout()
        buttonLayout.setAlignment(Qt.AlignRight)

        self.addButton = QPushButton('기기 등록')
        self.addButton.setFixedSize(widgetWidth * 0.3, widgetHeight * 0.1)

        self.delButton = QPushButton('와이파이 연결')
        self.delButton.setFixedSize(widgetWidth * 0.3, widgetHeight * 0.1)

        self.findButton = QPushButton('세팅')
        self.findButton.setFixedSize(widgetWidth * 0.3, widgetHeight * 0.1)

        buttonLayout.addWidget(self.addButton)
        buttonLayout.addWidget(self.delButton)
        buttonLayout.addWidget(self.findButton)

        inputLayout = QHBoxLayout()
        inputLayout.setAlignment(Qt.AlignRight | Qt.AlignTop)

        nameLabel = QLabel('Name: ')
        self.nameLineEdit = QLineEdit()
        inputLayout.addWidget(nameLabel)
        inputLayout.addWidget(self.nameLineEdit)

        comboLayout = QHBoxLayout()
        comboLayout.setAlignment(Qt.AlignRight | Qt.AlignTop)

        resultLayout = QVBoxLayout()

        resultLabel = QLabel("Result: ")
        self.resultTextEdit = QTextEdit()
        self.resultTextEdit.setReadOnly(True)

        resultLayout.addWidget(resultLabel)
        resultLayout.addWidget(self.resultTextEdit)

        layout = QVBoxLayout()
        layout.addLayout(buttonLayout)
        layout.addLayout(resultLayout)

        self.addButton.clicked.connect(self.regist_device)
        self.delButton.clicked.connect(self.wifi_connect)
        self.findButton.clicked.connect(self.setting)

        self.setLayout(layout)
        self.show()

    def closeEvent(self, event):
        self.write_numberDB()

    def read_numberDB(self):
        try:
            fH = open(self.dbfilename, 'rb')
        except FileNotFoundError as e:
            self.numberDB = []
            return

        try:
            self.numberDB = pickle.load(fH)
        except:
            pass
        else:
            pass

        fH.close()

    def write_numberDB(self):
        fH = open(self.dbfilename, 'wb')
        pickle.dump(self.numberDB, fH)
        fH.close()

    def regist_device(self):
        device_num = 123
        response = requests.request(
            "GET", f"http://127.0.0.1:8000/regist/{device_num}")
        json_msg = response.json()

        if json_msg['registered']:
            self.resultTextEdit.append(f"{device_num}번은 이미 등록된 기기 입니다.")
            return
        
        self.resultTextEdit.append(f"{device_num}번은 등록 가능한 기기 입니다.")
        
        while True:
            regist_number = random.randint(1000, 9999)
            
            if regist_number not in self.numberDB:
                break
        
        self.numberDB.append(regist_number)
        self.resultTextEdit.append(f"등록번호는 {regist_number} 입니다.")
        
    def wifi_connect(self):
        pass

    def setting(self):
        setting_widget = QDialog()
        setting_widget.show()

        while True:
            pass


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = ScoreDB()
    sys.exit(app.exec())
