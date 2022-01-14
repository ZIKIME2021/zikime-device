#include <QGuiApplication>
#include <QTextStream>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>

#include <QFile>
#include <QDebug>

#include "devicemanager.h"
#include "constants.h"

DeviceManager::DeviceManager(QObject *parent) : QObject(parent)
{
    QString ApplicationPath = QGuiApplication::applicationDirPath();

    QFile file(":/res/gpx_route.csv");
    file.open(QIODevice::ReadOnly);
    QTextStream stream(&file);

    _simulationData = stream.readAll().split("\n");
}

QString DeviceManager::getCurrentPosition()
{
#ifdef Q_OS_WIN
    return _simulationData.takeFirst();
#else

#endif
}

QString DeviceManager::getSerial()
{
#ifdef Q_OS_WIN
    serial = "000000004edc635b";
    //serial = "000000004edcAAAA";
#else

#endif

    return serial;
}

QString DeviceManager::getCameraInfo()
{
#ifdef Q_OS_WIN
    cameraInfo = "Pi-Camera";
#else

#endif

    return cameraInfo;
}

QString DeviceManager::getGPSInfo()
{
#ifdef Q_OS_WIN
    gpsInfo = "L80-M39";
#else

#endif

    return gpsInfo;
}
