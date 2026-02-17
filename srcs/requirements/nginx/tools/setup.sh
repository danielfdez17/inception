#!/bin/sh

# set -e

ssl_dir="/etc/nginx/ssl"
ssl_key="$ssl_dir/nginx.key"
ssl_cert="$ssl_dir/nginx.crt"

mkdir -p "$ssl_dir"

if [ -f "$ssl_key" ] && [ -f "$ssl_cert" ]; then
	echo "[NGINX] SSL certificates already exist. Skipping generation."
else
	echo "[NGINX] Generating SSL certificates..."
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout "$ssl_key" \
		-out "$ssl_cert" \
		-subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=Inception/CN=danfern3.42.fr" 2>&1

	echo "[NGINX] SSL certificates generated successfully"
fi

chmod 644 "$ssl_cert"
chmod 600 "$ssl_key"

echo "[NGINX] SSL certificates permissions set"

echo "[NGINX] Starting NGINX..."

exec nginx -g "daemon off;"