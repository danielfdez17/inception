FROM debian:bullseye 
RUN apt update && apt upgrade -y && apt install -y mariadb-server
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
RUN mkdir /run/mysqld
COPY tools/mdb-setup.sh .
RUN chmod +x ./mdb-setup.sh
ENTRYPOINT ["sh", "./mdb-setup.sh"]