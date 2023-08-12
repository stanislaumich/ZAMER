import serial.tools.list_ports
import serial

def start(name):
    ports = serial.tools.list_ports.comports()
    for port in ports:
        print(port.device)
    port = "COM1"  # Replace with the appropriate COM port name
    baudrate = 57600  # Replace with the desired baud rate
    ser = serial.Serial(port, baudrate=baudrate, timeout=0.1)
    b1 = bytes([0xFF, 0x02, 0x41, 0x03])#73 = 49 A = 65
    #bi = bytes([73])
    for i in range(5):
        ser.write(b1)

    print("Serial sent, waiting")
    # Perform operations on the COM port
    for i in range(1):
        data = ser.read(10)  # Read 10 bytes from the COM port
        print(data)

    if ser.is_open:
        ser.close()
        print("Serial connection closed.")






if __name__ == '__main__':
    start('PyCharm')


