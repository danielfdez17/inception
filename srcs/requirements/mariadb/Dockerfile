# ! MARIADB Dockerfile
# ? Sistema/Imagen base del que construir el servicio
FROM alpine:3.20

# ? Comandos ejecutados al construir la imagen
RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-server-utils

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

# ? Solo es documentación, no expone el puerto automáticamente
EXPOSE 3306

# ? Comando que se ejecuta al arrancar
CMD ["/setup.sh"]
