#ifndef DEVICEMANAGER_H
#define DEVICEMANAGER_H

#include <QObject>

#include <QtMqtt/QMqttClient>
#include <QtMqtt/QMqttMessage>
#include <QtMqtt/QMqttSubscription>

class DeviceManager : public QObject
{
    Q_OBJECT
public:
    explicit DeviceManager(QObject *parent = nullptr);
    QString GetCurrentPosition();
    Q_INVOKABLE QString getSerial();

private:
    QStringList _simulationData;
    QString serial;

signals:

};

#endif // DEVICEMANAGER_H
