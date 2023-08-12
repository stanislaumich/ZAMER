import serial.tools.list_ports
import serial

def start(name):
    ports = serial.tools.list_ports.comports()
    for port in ports:
        print(port.device)
    port = "COM1"  # Replace with the appropriate COM port name
    baudrate = 57600  # Replace with the desired baud rate
    ser = serial.Serial(port, baudrate=baudrate)
    b1 = bytes([255, 2, 73, 3])#73 = 49
    ser.write(b1)
    message = b"ff"  # Data to be sent, should be in bytes
    #ser.write(data)
    print("Serial sent, waiting")
    # Perform operations on the COM port
    for i in range(1):
        data = ser.read(1)  # Read 10 bytes from the COM port
        print(data)

    if ser.is_open:
        ser.close()
        print("Serial connection closed.")






if __name__ == '__main__':
    start('PyCharm')


