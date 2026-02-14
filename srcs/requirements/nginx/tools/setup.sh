#!/bin/sh
set -e

echo "[NGINX] Generating SSL certificates..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=Inception/CN=danfern3.42.fr" 2>&1

echo "[NGINX] SSL certificates generated successfully"

echo "[NGINX] Testing nginx configuration..."
if nginx -t 2>&1; then
	echo "[NGINX] Configuration test passed"
else
	echo "[NGINX] Configuration test FAILED!"
	exit 1
fi

echo "[NGINX] Starting nginx in foreground mode..."
exec nginx -g "daemon off;"