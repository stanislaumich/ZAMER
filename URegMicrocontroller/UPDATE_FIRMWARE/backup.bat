 avrdude -C avrdude.conf -p atmega328p -c arduino -P "COM3" -b 57600 -U flash:r:flash_backup_file.hex:i

avrdude -C avrdude.conf -p atmega328p -c arduino -P "COM3" -b 57600 -U eeprom:r:eeprom_backup_file.hex:i 

rem avrdude -p atmega328p -C avrdude.conf -c arduino -b 57600 -D -P "COM1" -U flash:w:firmware.hex:i