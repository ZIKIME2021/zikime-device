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
    Q_INVOKABLE QString getCurrentPosition();
    Q_INVOKABLE QString getSerial();
    Q_INVOKABLE QString getCameraInfo();
    Q_INVOKABLE QString getGPSInfo();

private:
    QStringList _simulationData;
    QString serial;
    QString cameraInfo;
    QString gpsInfo;

signals:

};

#endif // DEVICEMANAGER_H
