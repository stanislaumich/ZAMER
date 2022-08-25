cd M35_45_modbusMAIN\Win32\Release\BACKUP
call backupzamer.bat 
cd ..\..\..\..
git add .
git commit -m "AUTO FROM WORK %date% %time%"
git config --global http.version HTTP/1.1
git push 
git config --global http.version HTTP/2
pause