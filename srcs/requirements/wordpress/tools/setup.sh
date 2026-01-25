#!/bin/sh
set -e

echo "Waiting for MariaDB..."
while ! mysqladmin ping -h mariadb -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    sleep 2
done
echo "MariaDB is up!"


if [ ! -f wp-config.php ]; then
	wget https://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	mv wordpress/* .
	rm -rf wordpress latest.tar.gz
	cp /wp-config.php wp-config.php
fi

wp core install \
	--url=danfern3.42.fr \
	--title="Inception" \
	--admin_user=danfern3 \
	--admin_password=inceptionPassword \
	--admin_email=danfern3@student.42.fr \
	--skip-email \
	--allow-root

wp user create editor_user editor@42.fr \
	--role=editor \
	--user_pass=editorpass \
	--allow-root


mkdir -p /run/php

exec php-fpm83 -F
