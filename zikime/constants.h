#ifndef CONSTANTS_H
#define CONSTANTS_H

#ifdef FOR_TEST_SERVER

#define API_SERVER                                "http://www.zikime.com:9999"
#define WEB_SERVER                                "http://localhost:8000"
#define MQTT_SERVER                               "172.27.72.232"
#define MQTT_PORT                                 1883
#else
#define API_SERVER                                "http://www.zikime.com:9999"
#endif

#endif // CONSTANTS_H
