spool create_user.log
shutdown immediate;
startup restrict;
--ALTER DATABASE CHARACTER SET INTERNAL_USE CL8MSWIN1251;
ALTER DATABASE CHARACTER SET INTERNAL_USE AL32UTF8;
shutdown immediate;
startup;
--alter session set "_ORACLE_SCRIPT"=true;
drop user zamer cascade;
create user zamer identified by zamer default tablespace users temporary tablespace temp;
grant dba to zamer;
grant create session to zamer;
spool off
exit;