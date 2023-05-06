#!/bin/bash

set -e

echo MARIA DB $MYSQL_USER

bash

if [ ! -d /var/lib/mysql/$MYSQL_DB_NAME ]; then
service mysql start
echo "INSIDE"
sleep 3

# mysql --user=root << EoF
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIA_DB_ROOT_PASSWORD';
# DELETE FROM mysql.user WHERE User='';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# DROP DATABASE IF EXISTS test;
# DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
# FLUSH PRIVILEGES;
# EoF
# echo "-> MySQL setup done."

mysql --user=root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME; \
		CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD'; \
		GRANT ALL PRIVILEGES ON '$MYSQL_DB_NAME'.* TO '$MYSQL_USER'@'%'; \
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; \
		FLUSH PRIVILEGES; "

sleep 1

mysqladmin --user=root --password=$MARIA_DB_ROOT_PASSWORD shutdown
fi

echo "OUTSIDE"
exec "mysqld_safe"