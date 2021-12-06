from PySide2.QtCore import *
from const import Notify

class Settings(QObject):    
    __configs = QSettings(QSettings.IniFormat,QSettings.SystemScope, 'KOSS', 'ZIKIME')
    __notify_mode = "SILENT"
    
    @Signal
    def settingsChanged(self):
        print("Change notify Setting: ", self.__notify_mode)
        self.__configs.setValue("notify_mode", self.__notify_mode)
    
    @Slot(str)
    def set_settings(self, mode : str):
        print("Set notify Setting: ", self.__notify_mode)
        self.__notify_mode = mode
        self.settingsChanged.emit()
        
    def get_settings(self):
        print("Current notify Setting: ", self.__notify_mode)
        
        return self.__notify_mode
    
    SettingsInfo = Property(str, get_settings, set_settings, notify=settingsChanged)