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
            f = open('/proc/cpuinfo', 'r')

            lines = f.readlines()
            for line in lines:
                if line == '\n':
                    continue

                k, v = line.split(':')
                k = k.replace(' ', '')
                k = k.replace('\t', '')
                k = k.replace('\n', '')

                v = v.replace(' ', '')
                v = v.replace('\t', '')
                v = v.replace('\n', '')

                if k == "Serial":
                    self.__serial = v
                    break

            f.close()

        
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

    @Slot()
    def send_sos(self):
        s = smtplib.SMTP('smtp.gmail.com', 587)
        s.starttls()

        s.login('lovelyoverflow@gmail.com', 'biqvoaitoxalgrlc')

        msg = MIMEText('http://www.zikime.com:8000/lookfor/ \n 위 링크로 접속하여 피보호자의 위치를 확인하세요!')
        msg['Subject'] = '[ZIKIME]  _에게로부터 SOS 신호가 도착했습니다!'

        s.sendmail("lovelyoverflow@gmail.com", "lovelyoverflow@gmail.com", msg.as_string())
        s.quit()