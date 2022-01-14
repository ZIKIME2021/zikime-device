/********************************************************************************
** Form generated from reading UI file 'subscriptionwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.15.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_SUBSCRIPTIONWINDOW_H
#define UI_SUBSCRIPTIONWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QListWidget>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_SubscriptionWindow
{
public:
    QVBoxLayout *verticalLayout;
    QFormLayout *formLayout;
    QLabel *label;
    QLabel *labelSub;
    QLabel *label_2;
    QLabel *labelStatus;
    QLabel *label_3;
    QLabel *labelQoS;
    QListWidget *listWidget;
    QPushButton *pushButton;

    void setupUi(QWidget *SubscriptionWindow)
    {
        if (SubscriptionWindow->objectName().isEmpty())
            SubscriptionWindow->setObjectName(QString::fromUtf8("SubscriptionWindow"));
        SubscriptionWindow->resize(400, 300);
        verticalLayout = new QVBoxLayout(SubscriptionWindow);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        formLayout = new QFormLayout();
        formLayout->setObjectName(QString::fromUtf8("formLayout"));
        label = new QLabel(SubscriptionWindow);
        label->setObjectName(QString::fromUtf8("label"));

        formLayout->setWidget(0, QFormLayout::LabelRole, label);

        labelSub = new QLabel(SubscriptionWindow);
        labelSub->setObjectName(QString::fromUtf8("labelSub"));

        formLayout->setWidget(0, QFormLayout::FieldRole, labelSub);

        label_2 = new QLabel(SubscriptionWindow);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        formLayout->setWidget(1, QFormLayout::LabelRole, label_2);

        labelStatus = new QLabel(SubscriptionWindow);
        labelStatus->setObjectName(QString::fromUtf8("labelStatus"));

        formLayout->setWidget(1, QFormLayout::FieldRole, labelStatus);

        label_3 = new QLabel(SubscriptionWindow);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        formLayout->setWidget(2, QFormLayout::LabelRole, label_3);

        labelQoS = new QLabel(SubscriptionWindow);
        labelQoS->setObjectName(QString::fromUtf8("labelQoS"));

        formLayout->setWidget(2, QFormLayout::FieldRole, labelQoS);


        verticalLayout->addLayout(formLayout);

        listWidget = new QListWidget(SubscriptionWindow);
        listWidget->setObjectName(QString::fromUtf8("listWidget"));

        verticalLayout->addWidget(listWidget);

        pushButton = new QPushButton(SubscriptionWindow);
        pushButton->setObjectName(QString::fromUtf8("pushButton"));

        verticalLayout->addWidget(pushButton);


        retranslateUi(SubscriptionWindow);

        QMetaObject::connectSlotsByName(SubscriptionWindow);
    } // setupUi

    void retranslateUi(QWidget *SubscriptionWindow)
    {
        SubscriptionWindow->setWindowTitle(QCoreApplication::translate("SubscriptionWindow", "Form", nullptr));
        label->setText(QCoreApplication::translate("SubscriptionWindow", "Subscription:", nullptr));
        labelSub->setText(QCoreApplication::translate("SubscriptionWindow", "TextLabel", nullptr));
        label_2->setText(QCoreApplication::translate("SubscriptionWindow", "Status:", nullptr));
        labelStatus->setText(QCoreApplication::translate("SubscriptionWindow", "TextLabel", nullptr));
        label_3->setText(QCoreApplication::translate("SubscriptionWindow", "QoS:", nullptr));
        labelQoS->setText(QCoreApplication::translate("SubscriptionWindow", "TextLabel", nullptr));
        pushButton->setText(QCoreApplication::translate("SubscriptionWindow", "Unsubscribe", nullptr));
    } // retranslateUi

};

namespace Ui {
    class SubscriptionWindow: public Ui_SubscriptionWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_SUBSCRIPTIONWINDOW_H
