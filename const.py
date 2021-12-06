from PySide2.QtCore import *
from enum import Enum, auto

class Notify(Enum):
    SILENT = auto()
    VIBRATE = auto()
    SOUND = auto()
    
class Const(QObject):
    __notify = Notify
    
    @Signal
    def constChanged(self):
        print("Change notify Setting: ", self.__notify)
        #self.__configs.setValue("notify_mode", self.__notify)
    
    @Slot(Notify)
    def set_const(self, mode : Notify):
        print("Set notify Setting: ", self.mode)
        self.__notify = mode
        self.constChanged.emit()
        
    def get_const(self):
        print("Current notify Setting: ", self.__notify)
        
        return self.__notify
    
    const = Property(str, get_const, set_const, notify=constChanged)