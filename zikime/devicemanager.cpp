#include <QGuiApplication>
#include <QTextStream>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QTextStream>

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
    return _simulationData.takeFirst();
#endif
}

QString DeviceManager::getSerial()
{
#ifdef Q_OS_WIN
    serial = "000000004edcAAAA";
#else
    QFile file("/proc/cpuinfo");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        qDebug() << "File open Failed";
        exit(-1);
    }

    QTextStream stream(&file);
    QString line = stream.readLine();

    while(!line.isNull())
    {
        QStringList lineList = line.split(QLatin1Char(':'));

        if (lineList[0].trimmed() == "Serial")
            serial = lineList[1].trimmed();

        line = stream.readLine();
    }

    file.close();
#endif

    return serial;
}

QString DeviceManager::getCameraInfo()
{
#ifdef Q_OS_WIN
    cameraInfo = "Pi-Camera";
#else
    cameraInfo = "Pi-Camera";
#endif

    return cameraInfo;
}

QString DeviceManager::getGPSInfo()
{
#ifdef Q_OS_WIN
    gpsInfo = "L80-M39";
#else
    gpsInfo = "L80-M39";
#endif

    return gpsInfo;
}
