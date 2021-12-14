from PySide2.QtCore import *
from requests import request
from email.mime.text import MIMEText

import platform
import smtplib

class UpdateManager(QObject):
        
    @Slot()
    def send_sos(self):
        s = smtplib.SMTP('smtp.gmail.com', 587)
        s.starttls()

        s.login('lovelyoverflow@gmail.com', 'password')

        msg = MIMEText('qt에서 보낸거다.')
        msg['Subject'] = '준영아 테스트다.'

        s.sendmail("lovelyoverflow@gmail.com", "mrgentle1@kookmin.ac.kr", msg.as_string())
        s.quit()