#ifndef CONSTANTS_H
#define CONSTANTS_H

#ifdef FOR_TEST_SERVER

#define API_SERVER                                "http://localhost:9999"
#define MQTT_SERVER                               "172.23.132.5"
#define MQTT_PORT                                 1883
#else
#define API_SERVER                                "http://www.zikime.com:9999"
#endif

#endif // CONSTANTS_H
