#!/bin/sh

# ? -nodes -> evita passphrase
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=Inception/CN=localhost"

# ? Para que el contenedor no muera
nginx -g "daemon off;"