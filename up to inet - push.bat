cd BACKUP
call backupzamer.bat 
cd ..
git add .
git commit -m "AUTO FROM WORK %date% %time%"
git config --global http.version HTTP/1.1
git push origin --force
git config --global http.version HTTP/2
pause