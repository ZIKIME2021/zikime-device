import pyfirmata as pf
from time import sleep

class Arduino:
    """
    아두이노를 제어하기 위한 클래스. 
    파라미터에 시리얼통신할 포트 번호 전달. arduino = Arduino('/dev/ttyACM0')
    """
    def __init__(self, PORT='COM3'):
        self.ard = pf.Arduino(PORT)
        print('connected.')

        pf.util.Iterator(self.ard).start()

        self.vive = board.get_pin('a:0:o') # 아날로그핀 0번을 출력으로 설정

        self.ard.analog[0].enable_reporting()
        self.led = self.ard.get_pin('d:10:o') # 디지털핀 10번을 출력으로 설정

    def led_blink(self, loop=1):
        for _ in range(loop):
            self.led.write(1)
            sleep(0.5)
            self.led.write(0)
            sleep(0.5)
    
    def vive(self, loop=1):
        for _ in range(loop):
            self.vive.write(200)
            sleep(2)
            self.vive.write(0)
            sleep(2)

