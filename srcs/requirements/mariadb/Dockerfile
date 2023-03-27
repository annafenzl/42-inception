FROM debian:buster

# INSTALL mariadb
RUN apt-get update
RUN apt-get install -y mariadb-server

# copy sql cmds and server conf in container
COPY ./tools/mariadb_setup.sql /var/www/
COPY ./conf/50-server.cnf /etc/mysqul/mariadb.conf.d/

RUN service mysql start && mysql < /var/www/mariadb_setup.sql && rm -f /var/www/mariadb_setup.sql;

EXPOSE 3306

# to test stuff
# RUN chmod +x /var/www/test.sh
# ENTRYPOINT [ "/var/www/test.sh" ]

CMD ["mysqld"]