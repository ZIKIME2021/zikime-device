#include <QGuiApplication>
#include <QTextStream>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QTextStream>
#include <QtSerialPort>

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
    
#ifndef Q_OS_WIN
    serialPort.setPortName("ttyUSB0");

    if(!serialPort.setBaudRate(QSerialPort::Baud9600))
        qDebug() << serialPort.errorString();
    if(!serialPort.setDataBits(QSerialPort::Data7))
        qDebug() << serialPort.errorString();
    if(!serialPort.setParity(QSerialPort::EvenParity))
        qDebug() << serialPort.errorString();
    if(!serialPort.setFlowControl(QSerialPort::HardwareControl))
        qDebug() << serialPort.errorString();
    if(!serialPort.setStopBits(QSerialPort::OneStop))
        qDebug() << serialPort.errorString();
    if(!serialPort.open(QIODevice::ReadOnly))
        qDebug() << serialPort.errorString();

    qDebug() << "GPS open";
    QObject::connect(&serialPort, &QSerialPort::readyRead, [&]
    {
        QString recv = serialPort.read(1);

        readLine += recv;

        if(recv == '\n')
        {
            QStringRef subString(&readLine, 0, 6);
            if(subString == "$GPGGA")
            {
                qDebug() << readLine;
                QStringList strList = readLine.split(',');
				latitude = strList[2];
				longitude = strList[4];
            }
            readLine.clear();
        }
    });
#endif
}

QString DeviceManager::getCurrentPosition()
{
#ifdef Q_OS_WIN
    return _simulationData.takeFirst();
#else
	return QString(latitude + ',' + longitude);
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
