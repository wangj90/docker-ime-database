FROM alexeiled/docker-oracle-xe-11g:latest
MAINTAINER 王俊 "wang_j90@126.com"

COPY init.sql /etc/entrypoint-initdb.d/init.sql
COPY start.sh /start.sh

CMD ["/bin/sh","/start.sh"]