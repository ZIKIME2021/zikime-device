from PySide2.QtCore import *
from requests import request

class UpdateManager(QObject):    
        
    @Slot()
    def register_device(self):
        pass