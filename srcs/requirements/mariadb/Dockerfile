FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

# LABEL version="1.0"
# LABEL description="MariaDB Server"

# HEALTHCHECK --start-period=5m \
#   CMD mariadb -e 'SELECT @@datadir;' || exit 1

COPY ./tools/mariadb_setup.sql /var/www/
COPY ./conf/50-server.cnf /etc/mysqul/mariadb.conf.d/

RUN service mysql start && mysql < /var/www/mariadb_setup.sql && rm -f /var/www/mariadb_setup.sql;

EXPOSE 3306

# RUN chmod +x /var/www/test.sh
# ENTRYPOINT [ "/var/www/test.sh" ]

CMD ["mysqld"]