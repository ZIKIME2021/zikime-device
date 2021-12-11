from PySide2.QtCore import *
from requests import request
from email.mime.text import MIMEText

import platform
import smtplib

class UpdateManager(QObject):
    __serial : str
    
    __state_id : int
    __latitude : str
    __longitude : str
    __altitude : str
    __power : bool
    __ip_address : str
    __mode : str
    
    @Slot()
    def update_state(self):
        if platform.system() == "Windows":
            self.__serial = "10000000a6f28908"
        elif platform.system() == "Linux":
            pass
        
        response = request("GET", f"http://localhost:9999/device/{self.__serial}")
        json_msg = response.json()
        self.__state_id = json_msg["state_id"]
        
        response = request("GET", f"http://localhost:9999/state/{self.__state_id}")
        json_msg = response.json()
        
        self.__latitude = json_msg["latitude"]
        self.__longitude = json_msg["longitude"]
        self.__altitude = json_msg["altitude"]
        self.__power = json_msg["power"]
        self.__ip_address = json_msg["ip_address"]
        self.__mode = json_msg["mode"]
        
        # print(self.__latitude)
        # print(self.__longitude)
        # print(self.__altitude)
        # print(self.__power)
        # print(self.__ip_address)
        # print(self.__mode)
        
    @Slot()
    def send_sos(self):
        s = smtplib.SMTP('smtp.gmail.com', 587)
        s.starttls()

        s.login('lovelyoverflow@gmail.com', 'password')

        msg = MIMEText('qt에서 보낸거다.')
        msg['Subject'] = '준영아 테스트다.'

        s.sendmail("lovelyoverflow@gmail.com", "mrgentle1@kookmin.ac.kr", msg.as_string())
        s.quit()