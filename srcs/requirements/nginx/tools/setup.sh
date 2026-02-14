#!/bin/sh
set -e

echo "Generating SSL certificates..."
# ? -nodes -> evita passphrase
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=Inception/CN=danfern3.42.fr"

echo "Testing nginx configuration..."
nginx -t

echo "Starting nginx..."
# ? Para que el contenedor no muera
exec nginx -g "daemon off;"