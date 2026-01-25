# ! WORDPRESS Dockerfile
# ? Sistema/Imagen base del que construir el servicio
FROM alpine:3.20

# ? Comandos ejecutados al construir la imagen
RUN apk update && apk add --no-cache php83 php83-fpm php83-mysqli php83-json php83-opcache php83-curl php83-phar php83-mbstring php83-xml php83-zip wget tar curl mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY tools/setup.sh /setup.sh
COPY conf/wp-config.php /wp-config.php

RUN chmod +x /setup.sh

# ? Comando que se ejecuta al arrancar
CMD ["/setup.sh"]
