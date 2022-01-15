#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <QtGlobal>

#ifdef FOR_TEST_SERVER

#define API_SERVER                                "http://www.zikime.com:9999"
#define WEB_SERVER                                "http://localhost:8000"
#define MQTT_SERVER                               "www.zikime.com"
#define MQTT_PORT                                 8080
#else
#define API_SERVER                                "http://www.zikime.com:9999"
#endif

#ifdef Q_OS_WIN
#define SERIAL_PORT                               "COM6"
#else
#define SERIAL_PORT                               "/dev/ttyUSB1"
#endif
#endif // CONSTANTS_H
