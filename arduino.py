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

        self.vive = self.board.get_pin('d:9:p') # 디지털핀 9번을 PWM으로 설정(진동모듈)
        self.buzzer = self.board.get_pin('d:10:o') # 디지털핀 10번을 출력으로 설정 (buzzer)

        self.board.analog[0].enable_reporting()
        self.led = self.board.get_pin('d:8:o') # 디지털핀 10번을 출력으로 설정(LED)

    def led_blink(self, loop=1):
        print('LED_BLINK')
        for _ in range(loop):
            self.led.write(1)
            sleep(0.5)
            self.led.write(0)
            sleep(0.5)
    
    def vive_control(self, loop=1, intensity=1):
        print('VIVE_CONTROL')
        for _ in range(loop):
            self.vive.write(intensity)
            sleep(0.5)
            self.vive.write(0)
            sleep(0.5)

    def buzzer_control(self, loop=1):
        print('BUZZER_CONTROL')
        for _ in range(loop):
            self.buzzer.write(200)
            sleep(0.5)
            self.buzzer.write(0)
            sleep(0.5)

    def notice(self, loop=10):  # control all module (LED, buzzer, vive)
        for _ in range(loop):
            self.led.write(1)
            self.vive.write(1)
            self.buzzer.write(200)
            sleep(0.5)
            self.led.write(0)
            self.vive.write(0)
            self.buzzer.write(0)
            sleep(0.5)


if __name__ == "__main__":
    print('Arduino Sensor Test.')
    ard = Arduino('COM5')  # 인자값으로 arduino의 port number 전달
    ard.vive_control(10)
    ard.led_blink(loop=10)