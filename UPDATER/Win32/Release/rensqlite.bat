set datetimef=%date:~-4%_%date:~3,2%_%date:~0,2%_%time:~0,2%_%time:~3,2%_%time:~6,2%
ren s:\ZAMER\UPDATER\Win32\Debug\update.sqlite  "%datetimef%_update.sqlite"