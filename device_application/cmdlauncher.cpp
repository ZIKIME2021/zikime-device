#include "cmdlauncher.h"
#include <QDebug>

CmdLauncher::CmdLauncher(QObject *parent)
    : QObject(parent)
{}

void CmdLauncher::start()
{
    if(m_program.isEmpty())
        return;

    m_process.setProgram(m_program);
    m_process.setArguments(m_args);
    m_process.start();

    qDebug() << "launching program" << m_program;
}
