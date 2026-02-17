# ! WORDPRESS Dockerfile
# ? Sistema/Imagen base del que construir el servicio
FROM alpine:3.19

# Instalamos PHP y las extensiones necesarias
RUN apk update && apk add --no-cache \
    php82 \
    php82-phar \
    php82-fpm \
    php82-mysqli \
    php82-json \
    php82-curl \
    php82-dom \
    php82-mbstring \
    php82-iconv \
    php82-openssl \
    php82-xml \
    php82-zip \
    php82-session \
    php82-tokenizer \
    php82-ctype \
    php82-simplexml \
    php82-xmlreader \
    php82-zlib \
    php82-gd \
    php82-fileinfo \
    mysql-client \
    curl \
    bash

RUN echo "memory_limit = 256M" >> /etc/php82/php.ini
	
# Create working directory
# RUN mkdir -p /var/www/html

# WORKDIR /var/www/html

COPY conf/www.conf /etc/php82/php-fpm.d/www.conf

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 9000

# ? Comando que se ejecuta al arrancar
CMD ["/setup.sh"]
