from PySide2.QtCore import *

class Number(QObject):
    __val = 0
    
    @Signal
    def numberChanged(self):
        pass
    
    @Slot(int)
    def set_number(self, val):
        print("setter func")
        self.__val = val
        self.numberChanged.emit()
        
    def get_number(self):
        print("getter func")
        return self.__val
    
    ValueNumber = Property(int, get_number, set_number, notify=numberChanged)