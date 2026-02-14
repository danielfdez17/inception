# ! NGINX Dockerfile
# ? Sistema/Imagen base del que construir el servicio
FROM alpine:3.20

# ? Comandos ejecutados al construir la imagen
RUN apk update && apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    mkdir -p /var/www/html && \
    mkdir -p /var/log/nginx && \
    mkdir -p /run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

# ? Comando que se ejecuta al arrancar
CMD ["/setup.sh"]