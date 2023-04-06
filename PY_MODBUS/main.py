


"""
from pyModbusTCP.client import ModbusClient # Modbus TCP Client
import os, time
import struct
import click



# TCP auto connect on modbus request, close after it
ModbusBMS = ModbusClient(host="127.0.0.1", port=502, unit_id=159, auto_open=True, auto_close=True)
time.sleep(1)
def ModbusTCP():
	global AlarmStatus
	Alarm = ModbusBMS.read_input_registers(3529, 2)
	time.sleep(2)
	if Alarm:
		r1 = Alarm[0]
		r2 = Alarm[1]
		print(r1 // 256)
		value = struct.unpack('f', struct.pack('<HH', int(r2), int(r1)))[0]
		print(value)

	else:
		print("read error")

if __name__ == '__main__':
	ModbusTCP()
	time.sleep(1)  #delay 5 sec





pip install modbus_tk click

"""
"""
import modbus_tk.defines as cst
import modbus_tk.modbus_tcp as modbus_tcp
import struct
import click

slaveIP = '192.168.2.250'  # '127.0.0.1'
slavePort = 502
slaveId = 97  # 159
regHz = 1540  # 0x64=1540=1536+4


def main():
    master = modbus_tcp.TcpMaster(host=slaveIP, port=int(slavePort))
    master.set_timeout(1.0)
    master.set_verbose(True)
    #try:
    for i in range(1, 10):
        getDI = master.execute(slaveId, cst.READ_HOLDING_REGISTERS, regHz, 2)
        print(getDI)
        r1 = getDI[0]
        r2 = getDI[1]
        value = struct.unpack('f', struct.pack('<HH', int(r2), int(r1)))[0]
        print(value)
        click.pause()
    #except:
    #    print("Исключение")


if __name__ == "__main__":
    main()
"""