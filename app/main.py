# This Python file uses the following encoding: utf-8
import os
import sys
from pathlib import Path

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType
#from PySide2.QtQuickControls2 import QQuickStyle

from settings import Settings
from consts import *
from updatemanager import UpdateManager
from gpsmanager import GPSManager
from registmanager import RegistManager

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
#    QQuickStyle.setStyle("Material")
    
    engine = QQmlApplicationEngine()
    
    qmlRegisterType(Settings, "com.zikime.settings", 1, 0, "Settings")
    qmlRegisterType(UpdateManager, "com.zikime.updatemanager", 1, 0, "UpdateManager")
    qmlRegisterType(GPSManager, "com.zikime.gpsmanager", 1, 0, "GPSManager")
    qmlRegisterType(RegistManager, "com.zikime.registmanager", 1, 0, "RegistManager")
    
    engine.rootContext().setContextProperty("API_SERVER_URL", API_SERVER_URL)
    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
        
    sys.exit(app.exec_())
