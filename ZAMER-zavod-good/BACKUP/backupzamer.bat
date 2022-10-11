rem @echo off
del backupzamer_prev.dmp
ren backupzamer.dmp backupzamer_prev.dmp
rem del backupzamer.dmp
sqlplus zamer/zamer @backupzamer.sql
exp zamer/zamer parfile=backupzamer.dat
del *.log
rar a -m5 -ag_dd.mm.yyyy-hh-mi-ss backupzamer @backupzamer.lst
rem pause
rem rar a -sfx -ag_dd.mm.yyyy-hh-mi-ss oplata_backup D:\CLOUD\Dropbox\common(THS)\oplata.exe
rem del D:\CLOUD\Dropbox\common(THS)\oplata.exe
rem copy D:\_programming\OPLATA\OPLATA.exe D:\CLOUD\Dropbox\common(THS)\oplata.exe
rem pause