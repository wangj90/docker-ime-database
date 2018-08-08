#!/bin/bash

set -e

impfile="/u01/dbimport/ime.dmp"

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export PATH=$ORACLE_HOME/bin:$PATH

sed -i -E "s/HOST = [^)]+/HOST = ${HOSTNAME}/g" ${ORACLE_HOME}/network/admin/listener.ora
service oracle-xe start

echo "数据库初始化……"
for f in /etc/entrypoint-initdb.d/*; do
  case "$f" in
    *.sql) echo "$0: running ${f}"; echo "@${f} ;" | sqlplus -S SYSTEM/oracle ;;
    *.sh)  echo "$0: running ${f}"; . "${f}" ;;
    *)     echo "No volume sql script, ignoring ${f}" ;;
  esac
  echo
done
echo "初始化完毕"

# 导入数据库文件
if [ ! -f "$impfile" ]; then
  echo "数据库导入文件不存在，请将ime.dmp挂载到/u01/dbimport下！"
else
  echo "数据库导入……"
  imp ime/ime file=/u01/dbimport/ime.dmp fromuser=ime touser=ime tablespaces=ime ignore=y
  echo "导入完毕……"
fi

echo "Oracle启动完毕!"

# forever loop just to prevent Docker container to exit, when run as daemon
while true; do sleep 1000; done
