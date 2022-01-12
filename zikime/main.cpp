#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <QtMqtt/QMqttClient>
#include <QtMqtt/QMqttMessage>
#include <QtMqtt/QMqttSubscription>
#include <QtMqtt/QMqttTopicName>

#include "qmlmqttclient.h"
#include "devicemanager.h"
#include "constants.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    DeviceManager deviceManager;

    engine.rootContext()->setContextProperty("DeviceManager", &deviceManager);
    engine.rootContext()->setContextProperty("API_SERVER", API_SERVER);
    engine.rootContext()->setContextProperty("MQTT_SERVER", MQTT_SERVER);
    engine.rootContext()->setContextProperty("MQTT_PORT", MQTT_PORT);

    qmlRegisterType<QmlMqttClient>("MqttClient", 1, 0, "MqttClient");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
