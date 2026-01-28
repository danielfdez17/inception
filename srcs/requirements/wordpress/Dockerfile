# ! WORDPRESS Dockerfile
# ? Sistema/Imagen base del que construir el servicio
# FROM alpine:3.20
FROM debian:12

# ? Comandos ejecutados al construir la imagen
# RUN apk update && apk add --no-cache php83 php83-fpm php83-mysqli php83-json php83-opcache php83-curl php83-phar php83-mbstring php83-xml php83-zip wget tar curl mariadb-client
RUN apt-get update && apt-get install \
	php8.2-fpm \
	php8.2-mysql \
	php8.2-cli \
	php8.2-curl \
	php8.2-xml \
	php8.2-mbstring \
	wget \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists

# Adding user and group
#RUN addgroup -S www-data && adduser -S www-data -G www-data
RUN mkdir -p /run/php
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# RUN mkdir -p /var/www/html

# WORKDIR /var/www/html

COPY tools/setup.sh /setup.sh
# COPY conf/wp-config.php /wp-config.php
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.

RUN chmod +x /setup.sh

# ? Comando que se ejecuta al arrancar
CMD ["/setup.sh"]
