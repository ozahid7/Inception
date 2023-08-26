#!/bin/bash

service mariadb start
sleep 2
sed -i 's@= 127.0.0.1@= 0.0.0.0@' /etc/mysql/mariadb.conf.d/50-server.cnf
mysql -u root -e "create database wordpress;"
mysql -u root -e "create user 'ozahid'@'%' identified by '1234';"
mysql -u root -e "grant all privileges on wordpress.* to 'ozahid'@'%';"
mysql -u root -e "alter user 'root'@'localhost' identified by '1234';"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld