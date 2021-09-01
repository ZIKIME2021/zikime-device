#ifndef CMDLAUNCHER_H
#define CMDLAUNCHER_H

#include <QObject>
#include <QProcess>
#include <QUrl>

class CmdLauncher : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString program READ program WRITE setProgram)
    Q_PROPERTY(QStringList args READ args WRITE setArgs)
public:
    CmdLauncher(QObject *parent = nullptr);

    Q_INVOKABLE void start();

    QString program() const {
        return m_program;
    }
    QStringList args() const {
        return m_args;
    }

public slots:
    void setProgram(QString program) {
        m_program = program;
    }
    void setArgs(QStringList args) {
        m_args = args;
    }

private:
    QString m_program;
    QStringList m_args;
    QProcess m_process;
};

#endif // CMDLAUNCHER_H
