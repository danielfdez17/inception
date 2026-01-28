# ! MARIADB Dockerfile
# ? Sistema/Imagen base del que construir el servicio
# FROM alpine:3.20
FROM debian:12

# ? Comandos ejecutados al construir la imagen
# RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-server-utils
RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

# ? Solo es documentación, no expone el puerto automáticamente
EXPOSE 3306

# ? Comando que se ejecuta al arrancar
CMD ["/setup.sh"]
