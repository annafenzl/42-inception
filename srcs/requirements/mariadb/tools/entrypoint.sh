#!/bin/bash

set -e

echo MARIA DB $MARIA_DB_USER

if [ ! -d /var/lib/mysql/$MARIA_DB_NAME ]; then
service mysql start
sleep 3

mysql --user=root -e "CREATE DATABASE IF NOT EXISTS $MARIA_DB_NAME; \
		CREATE USER IF NOT EXISTS '$MARIA_DB_USER'@'%' IDENTIFIED BY '$MARIA_DB_PASSWORD'; \
		GRANT ALL PRIVILEGES ON $MARIA_DB_NAME.* TO '$MARIA_DB_USER'@'%'; \
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIA_DB_ROOT_PASSWORD'; \
		FLUSH PRIVILEGES; "

sleep 1

mysqladmin --user=root --password=$MARIA_DB_ROOT_PASSWORD shutdown
fi

exec "mysqld_safe"