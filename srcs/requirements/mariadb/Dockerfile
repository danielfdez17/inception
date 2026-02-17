# ! MARIADB Dockerfile
# ? Sistema/Imagen base del que construir el servicio
FROM alpine:3.19

# ? Comandos ejecutados al construir la imagen
RUN apk update && apk add --no-cache mariadb mariadb-client bash

RUN mkdir -p /run/mysqld /var/lib/mysql && \
	chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY conf/mariadb.cnf /etc/my.cnf.d/mariadb-server.cnf
	
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

# ? Solo es documentación, no expone el puerto automáticamente
EXPOSE 3306

# ? Comando que se ejecuta al arrancar
CMD ["/setup.sh"]
