#!/bin/bash

# Salir si no se pasan argumentos
if [ "$#" -eq 0 ]; then
    echo "Uso: $0 servicio1 servicio2 ..."
    exit 1
fi

# Directorios base
mkdir -p secrets srcs/requirements

# Archivos de secrets (no sobreescribir)
for file in credentials.txt db_password.txt db_root_password.txt; do
    [ -f "secrets/$file" ] || touch "secrets/$file"
done

# docker-compose.yml (no sobreescribir)
[ -f "srcs/docker-compose.yml" ] || touch "srcs/docker-compose.yml"

# Directorio común tools
mkdir -p srcs/requirements/tools

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
