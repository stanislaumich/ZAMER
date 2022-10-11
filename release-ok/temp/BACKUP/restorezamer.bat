@echo off
sqlplus sys/manager1 as sysdba @create_zamer.sql
imp zamer/zamer ignore=y parfile=restorezamer.dat
