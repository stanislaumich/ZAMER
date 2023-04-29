avrdude -p atmega328p -C avrdude.conf -c arduino -b 57600 -D -P "COM6" -U flash:w:firmware.hex:i
pause
