chcp 1251
@echo off
s:
cd \
cd zamer
cd backup
sqlplus sys/manager1 as sysdba @create_zamer.sql
imp zamer/zamer ignore=y parfile=restorezamer.dat
