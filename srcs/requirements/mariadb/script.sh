#!/bin/bash

service mariadb start
sleep 2
sed -i 's@= 127.0.0.1@= 0.0.0.0@' /etc/mysql/mariadb.conf.d/50-server.cnf
mysql -u root -e "create database $mariadb_database;"
mysql -u root -e "create user '$mariadb_user'@'%' identified by '$mariadb_password';"
mysql -u root -e "grant all privileges on $mariadb_database.* to '$mariadb_user'@'%';"
mysql -u root -e "alter user 'root'@'localhost' identified by '$mariadb_password';"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld