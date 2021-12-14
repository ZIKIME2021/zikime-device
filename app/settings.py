from PySide2.QtCore import *
import csv

class Settings(QObject):    
    __mode = ""
    @Signal
    def settingsChanged(self):
        print("Changed")
    
    @Slot(str)
    def set_settings(self, mode : str):
        f = open('settings.csv', 'w', encoding='utf-8')
        f.write(mode)
        self.settingsChanged.emit()
        
    def get_settings(self):
        f = open('settings.csv', 'r', encoding='utf-8')
        reader = csv.reader(f)
        
        for line in reader:
            self.__mode = line[0]
            
        return self.__mode
    
    SettingsInfo = Property(str, get_settings, set_settings, notify=settingsChanged)