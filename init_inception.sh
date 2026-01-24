#!/bin/bash

# Directorios base
mkdir -p secrets srcs/requirements

# Archivos de secrets (no sobreescribir)
for file in credentials.txt db_password.txt db_root_password.txt; do
    [ -f "secrets/$file" ] || touch "secrets/$file"
done

# docker-compose.yml (no sobreescribir)
[ -f "srcs/docker-compose.yml" ] || touch "srcs/docker-compose.yml"

# .env (no sobreescribir)
echo "DOMAIN_NAME=danfern3.42.fr" > "srcs/.env"
echo >> "srcs/.env"
echo "# Certificate config" >> "srcs/.env"
echo "CERT_PATH=/etc/ssl/certs" >> "srcs/.env"
echo "CERT_KEY=nginx-autosigned.key" >> "srcs/.env"
echo "CERT=nginx-autosigned.crt" >> "srcs/.env"
echo >> "srcs/.env"
echo "# Database config" >> "srcs/.env"
echo "DB_ROOT_PASSWORD=root_password" >> "srcs/.env"
echo "DB_USER=user" >> "srcs/.env"
echo "DB_PASSWORD=user_password" >> "srcs/.env"
echo "DB_DATABASE=database_name" >> "srcs/.env"
echo >> "srcs/.env"
echo "# Wordpress config" >> "srcs/.env"
echo "WP_ADMIN_USER=admin" >> "srcs/.env"
echo "WP_ADMIN_PASSWORD=admin_password" >> "srcs/.env"
echo "WP_USER=user" >> "srcs/.env"
echo "WP_PASSWORD=user_password" >> "srcs/.env"
echo "WP_DOMAIN=danfern3.42.fr" >> "srcs/.env"

# Directorio común tools
mkdir -p srcs/requirements/tools

# Control de argumentos
if [ "$#" -eq 0 ]; then
    echo "Uso: $0 servicio1 servicio2 ..."
    exit 1
fi

# Crear estructura por servicio
for service in "$@"; do
    SERVICE_DIR="srcs/requirements/$service"
    CONF_DIR="$SERVICE_DIR/conf"

    mkdir -p \
        "$CONF_DIR" \
        "$SERVICE_DIR/tools"

    # Dockerfile
    [ -f "$SERVICE_DIR/Dockerfile" ] || touch "$SERVICE_DIR/Dockerfile"

    # Archivo de configuración <service>.conf
    CONF_FILE="$CONF_DIR/$service.conf"
    [ -f "$CONF_FILE" ] || touch "$CONF_FILE"
done

echo "Estructura creada correctamente ✔"
