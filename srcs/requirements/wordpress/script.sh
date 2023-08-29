#!/bin/bash

sed -i 's@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
# service php7.4-fpm start
mkdir -p /run/php
wp core download --allow-root
wp core config --dbhost=mariadb --dbname=wordpress --dbuser=ozahid --dbpass=1234 --allow-root
wp core install --url=localhost --title="ozahid title" --admin_user=Admin --admin_password=1234 --admin_email=test@email.com --allow-root 

php-fpm7.4 -F