create tablespace ime logging datafile '/u01/app/oracle/oradata/XE/ime.dbf' size 1024m;
create user ime identified by ime default tablespace ime;
grant dba to ime;