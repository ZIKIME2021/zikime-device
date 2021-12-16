from PySide2.QtCore import *
from PySide2.QtNetwork import QNetworkAccessManager, QNetworkProxy, QNetworkRequest, QNetworkReply
from requests import request
from requests.api import delete
from consts import *

import random
import platform

def reply_finished(reply):
    print(reply)
    
class RegistManager(QObject):
    __network_manager = QNetworkAccessManager()
    __network_manager.finished[QNetworkReply].connect(reply_finished)
     
    __serial : int
    __register_number : int
    
    @Slot()
    def get_serial(self):
        if platform.system() == "Windows":
            return "10000000a6f28908"
        elif platform.system() == "Linux":
            return "10000000a6f28908"

    @Slot()
    def register_device(self):
        register_number = random.randint(1111, 9999)
        self.__serial = self.get_serial()
        
        post_data = QJsonDocument({"register_number": register_number, "serial": self.__serial}).toJson()
        req = QNetworkRequest(API_SERVER_URL + "/registers")
        req.setHeader(QNetworkRequest.ContentTypeHeader, "application/json")
        
        self.__network_manager.post(req, post_data)

    @Slot()
    def is_registered(self):
        return False