import pyfirmata as pf
from time import sleep

class Arduino:
    """
    아두이노를 제어하기 위한 클래스. 
    파라미터에 시리얼통신할 포트 번호 전달. arduino = Arduino('/dev/ttyACM0')
    """
    def __init__(self, PORT='COM3'):
        self.board = pf.Arduino(PORT)
        print('connected.')

        pf.util.Iterator(self.board).start()

        self.vive = self.board.get_pin('d:9:p') # 아날로그핀 8번을 출력으로 설정  
        #self.buzzer = self.board.get_pin('d:9:o') # 디지털핀 9번을 출력으로 설정

        self.board.analog[0].enable_reporting()
        #self.led = self.ard.get_pin('d:10:o') # 디지털핀 10번을 출력으로 설정

    def led_blink(self, loop=1):
        for _ in range(loop):
            self.led.write(1)
            sleep(0.5)
            self.led.write(0)
            sleep(0.5)
    
    def vive_control(self, loop=1, intensity=1):
        for _ in range(loop):
            self.vive.write(intensity)
            sleep(1)
            self.vive.write(0)
            sleep(1)


if __name__ == "__main__":
    print('Arduino Sensor Test.')
    ard = Arduino('COM3')
    ard.vive_control(10)