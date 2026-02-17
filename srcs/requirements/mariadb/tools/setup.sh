#!/bin/sh

set -e

mkdir -p /var/lib/mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --ldata=/var/lib/mysql
fi

mysqld_safe &

until mariadb-admin ping --silent; do
	echo "Waiting for MariaDB server to start..."
	sleep 1
done

mariadb -u root << EOF
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
GRANT PROCESS ON *.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root shutdown -p"${MYSQL_ROOT_PASSWORD}"

exec mysqld_safe
