#!/bin/bash

sed -i 's@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
config_file=/var/www/html/wp-config.php
if [ -f "$config_file" ]; then
	wp core download --allow-root
	wp core config --dbhost=$wordpress_database_host --dbname=$mariadb_database --dbuser=$mariadb_user --dbpass=$mariadb_password --allow-root
	wp core install --url=$wordpress_url --title=$wordpress_title --admin_user=$mariadb_user --admin_password=$mariadb_password --admin_email=test@email.com --allow-root
fi
php-fpm7.4 -F