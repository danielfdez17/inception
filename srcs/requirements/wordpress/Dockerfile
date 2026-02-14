# ! WORDPRESS Dockerfile
# ? Sistema/Imagen base del que construir el servicio
FROM alpine:3.20

# ? Comandos ejecutados al construir la imagen
# RUN apk update && apk add --no-cache php83 php83-fpm php83-mysqli php83-json php83-opcache php83-curl php83-phar php83-mbstring php83-xml php83-zip wget tar curl mariadb-client
RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-json \
    php83-curl \
    php83-mbstring \
    php83-xml \
    php83-openssl \
    php83-session \
    php83-zip \
    php83-phar \
    curl \
    wget \
    mariadb-client

# Adding user and group
RUN mkdir -p /run/php

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Create working directory
RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY tools/setup.sh /setup.sh
COPY conf/wp-config.php /wp-config.php
COPY conf/www.conf /etc/php83/php-fpm.d/www.conf

RUN chmod +x /setup.sh

# ? Comando que se ejecuta al arrancar
CMD ["/setup.sh"]
