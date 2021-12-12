# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine, qmlRegisterType

from settings import Settings
from const import Const
from updatemanager import UpdateManager
from gpsmanager import GPSManager

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    
    engine = QQmlApplicationEngine()
    
    qmlRegisterType(Settings, "com.zikime.settings", 1, 0, "Settings")
    qmlRegisterType(Const, "com.zikime.const", 1, 0, "Const")
    qmlRegisterType(UpdateManager, "com.zikime.updatemanager", 1, 0, "UpdateManager")
    qmlRegisterType(GPSManager, "com.zikime.gpsmanager", 1, 0, "GPSManager")
    
    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
        
    sys.exit(app.exec_())
