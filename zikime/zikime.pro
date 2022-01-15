QT += quick network serialport

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        devicemanager.cpp \
        main.cpp \
        qmlmqttclient.cpp

RESOURCES += qml.qrc \
    resources.qrc

CONFIG(debug, debug|release) {
    DEFINES += FOR_TEST_SERVER
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/qml
QML2_IMPORT_PATH = $$PWD/qml

#QML_IMPORT_PATH += $$PWD/qfirmata/imports
#QML2_IMPORT_PATH += $$PWD/qfirmata/imports

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    constants.h \
    devicemanager.h \
    qmlmqttclient.h

win32 {
    LIBS += -L$$PWD/qtmqtt/lib/ -llibQt5Mqtt

    INCLUDEPATH += $$PWD/qtmqtt/include
    DEPENDPATH += $$PWD/qtmqtt/include

    PRE_TARGETDEPS += $$PWD/qtmqtt/lib/libQt5Mqtt.a
}

unix {
    #LIBS += -L$$PWD/qtmqtt/lib/ -llibQt5Mqtt

    #INCLUDEPATH += $$PWD/qtmqtt/include
    #DEPENDPATH += $$PWD/qtmqtt/include

    QT += mqtt
}

DISTFILES += \
    qml/RegisterPage.qml \
    qml/Settings.qml \
    qml/VideoList.qml \
    qml/WifiList.qml \
    qml/main.qml
