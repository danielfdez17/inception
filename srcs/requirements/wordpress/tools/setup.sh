#!/bin/sh
set -e

if [ ! -f wp-config.php ]; then
	wget https://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	mv wordpress/* .
	rm -rf wordpress latest.tar.gz
	cp /wp-config.php wp-config.php
fi

mkdir -p /run/php

exec php-fpm83 -F
