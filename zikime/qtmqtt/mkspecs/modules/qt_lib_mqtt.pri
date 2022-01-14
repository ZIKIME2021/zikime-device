QT_MODULE_BIN_BASE = /home/pi/qtmqtt/bin
QT_MODULE_INCLUDE_BASE = /home/pi/qtmqtt/include
QT_MODULE_LIB_BASE = /home/pi/qtmqtt/lib
QT_MODULE_HOST_LIB_BASE = /home/pi/qtmqtt/lib
include(/home/pi/qtmqtt/mkspecs/modules-inst/qt_lib_mqtt.pri)
QT.mqtt.priority = 1
include(/home/pi/qtmqtt/mkspecs/modules-inst/qt_lib_mqtt_private.pri)
QT.mqtt_private.priority = 1
