import modbus_tk
import modbus_tk.defines as cst
import modbus_tk.modbus_tcp as modbus_tcp
import struct
import math

slaveIP = '127.0.0.1'
slavePort = 502
slaveId = 159

master = modbus_tcp.TcpMaster(host=slaveIP, port=int(slavePort))
master.set_timeout(1.0)
for i in range(1, 10):
    getDI = master.execute(slaveId, cst.READ_INPUT_REGISTERS, 3529, 2)
    print(getDI)
    r1 = getDI[0]
    r2 = getDI[1]
    value = struct.unpack('f', struct.pack('<HH', int(r2), int(r1)))[0]
    print(value)
