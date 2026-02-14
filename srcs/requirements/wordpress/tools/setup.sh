#!/bin/sh
set -e

echo "Waiting for MariaDB..."
while ! mysqladmin ping -h mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    sleep 2
done
echo "MariaDB is up!"

# Download and setup WordPress if not already present
if [ ! -f wp-config.php ]; then
    echo "Installing WordPress..."
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    mv wordpress/* .
    rm -rf wordpress latest.tar.gz
    cp /wp-config.php wp-config.php
    
    # Install WordPress core
    wp core install \
        --url=danfern3.42.fr \
        --title="Inception" \
        --admin_user=danfern3 \
        --admin_password=inceptionPassword \
        --admin_email=danfern3@student.42.fr \
        --skip-email \
        --allow-root
    
    # Create additional user
    wp user create editor_user editor@42.fr \
        --role=editor \
        --user_pass=editorpass \
        --allow-root
    
    echo "WordPress installation complete!"
fi

# Set proper permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Ensure PHP-FPM run directory exists
mkdir -p /run/php

# Start PHP-FPM
exec php-fpm83 -F

#cd /var/www/html
#curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#chmod +x wp-cli.phar
#sleep 5
#./wp-cli.phar core download --allow-root
#./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root
#./wp-cli.phar core install --url=$WP_DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
#./wp-cli.phar user create $WP_GUEST_USER $WP_GUEST_EMAIL --role=subscriber --user_pass=$WP_GUEST_PASSWORD --allow-root
#php-fpm83 -F
