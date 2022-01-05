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

QString DeviceManager::GetCurrentPosition()
{
    return _simulationData.takeFirst();
}

QString DeviceManager::getSerial()
{
    QString serial;
#ifdef Q_OS_WIN
    serial = "000000004edc635b";
#else
    serial = "";
#endif

    return serial;
}
