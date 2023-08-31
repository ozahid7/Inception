#!/bin/bash

service mariadb start
sleep 2
sed -i 's@= 127.0.0.1@= 0.0.0.0@' /etc/mysql/mariadb.conf.d/50-server.cnf
mysql -u root -e "create database $MARIADB_DB;"
mysql -u root -e "create user '$MARIADB_USER'@'%' identified by '$MARIADB_PASS';"
mysql -u root -e "grant all privileges on $MARIADB_DB.* to '$MARIADB_USER'@'%';"
mysql -u root -e "alter user 'root'@'localhost' identified by '$MARIADB_PASS';"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld