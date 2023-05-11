from __future__ import print_function

import modbus_tk
import modbus_tk.defines as cst
from modbus_tk import modbus_tcp, hooks
import logging

ip = '192.168.2.250'

def main():
    """main"""
    logger = modbus_tk.utils.create_logger("console", level=logging.DEBUG)

    def on_after_recv(data):
        master, bytes_data = data
        logger.info(bytes_data)

    hooks.install_hook('modbus.Master.after_recv', on_after_recv)

    try:

        def on_before_connect(args):
            master = args[0]
            logger.debug("on_before_connect {0} {1}".format(ip, 502))

        hooks.install_hook("modbus_tcp.TcpMaster.before_connect", on_before_connect)

        def on_after_recv(args):
            response = args[1]
            logger.debug("on_after_recv {0} bytes received".format(len(response)))

        hooks.install_hook("modbus_tcp.TcpMaster.after_recv", on_after_recv)

        # Connect to the slave
        master = modbus_tcp.TcpMaster(ip, 502)
        master.set_timeout(5.0)
        logger.info("connected")

        logger.info(master.execute(97, cst.READ_HOLDING_REGISTERS, 1540, 2))

        # logger.info(master.execute(1, cst.READ_HOLDING_REGISTERS, 0, 2, data_format='f'))

        # Read and write floats
        # master.execute(1, cst.WRITE_MULTIPLE_REGISTERS, starting_address=0, output_value=[3.14], data_format='>f')
        # logger.info(master.execute(1, cst.READ_HOLDING_REGISTERS, 0, 2, data_format='>f'))

        # send some queries
        # logger.info(master.execute(1, cst.READ_COILS, 0, 10))
        # logger.info(master.execute(1, cst.READ_DISCRETE_INPUTS, 0, 8))
        # logger.info(master.execute(1, cst.READ_INPUT_REGISTERS, 100, 3))
        # logger.info(master.execute(1, cst.READ_HOLDING_REGISTERS, 100, 12))
        # logger.info(master.execute(1, cst.WRITE_SINGLE_COIL, 7, output_value=1))
        # logger.info(master.execute(1, cst.WRITE_SINGLE_REGISTER, 100, output_value=54))
        # logger.info(master.execute(1, cst.WRITE_MULTIPLE_COILS, 0, output_value=[1, 1, 0, 1, 1, 0, 1, 1]))
        # logger.info(master.execute(1, cst.WRITE_MULTIPLE_REGISTERS, 100, output_value=xrange(12)))

    except modbus_tk.modbus.ModbusError as exc:
        logger.error("%s- Code=%d", exc, exc.get_exception_code())

if __name__ == "__main__":
    main()