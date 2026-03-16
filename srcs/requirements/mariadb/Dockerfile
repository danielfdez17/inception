FROM alpine:3.19 AS assets

# Stage with only static files needed at runtime.
COPY ./conf/mariadb-server.cnf /assets/conf/mariadb-server.cnf
COPY ./tools/setup.sh /assets/setup.sh

FROM alpine:3.19

# Install MariaDB and client
RUN --mount=type=cache,target=/var/cache/apk apk add --no-cache mariadb mariadb-client

# Create necessary directories and set permissions
RUN mkdir -p /run/mysqld /var/lib/mysql && chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copy config and initialization script from assets stage
COPY --from=assets /assets/conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY --from=assets /assets/setup.sh /setup.sh
RUN chmod +x /setup.sh

# Expose MariaDB port
EXPOSE 3306

# Main command
ENTRYPOINT ["/setup.sh"]
