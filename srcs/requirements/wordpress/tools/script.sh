#!/bin/bash

sed -i 's@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
if [ ! -f "/var/www/html/wp-config.php" ]; then
	wp core download --allow-root
	wp core config --dbhost=$WORDPRESS_DB_HOST --dbname=$MARIADB_DB --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASS --allow-root
	wp core install --url=$WORDPRESS_URL --title="Title" --admin_user=$MARIADB_USER --admin_password=$MARIADB_PASS --admin_email=test@email.com --allow-root
	wp user create $WORDPRESS_AUTHOR_USER zoussama@test.com --user_pass=$MARIADB_PASS --role=author --allow-root
fi
php-fpm7.4 -F