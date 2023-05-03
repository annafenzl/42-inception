FROM debian:buster

# INSTALL mariadb
RUN apt-get update
RUN apt-get install -y mariadb-server

# copy sql cmds and server conf in container
COPY ./tools/mariadb_setup.sql /var/www/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN service mysql start && mysql < /var/www/mariadb_setup.sql && rm -f /var/www/mariadb_setup.sql;

EXPOSE 3306

# to test stuff
# COPY ./tools/test.sh /var/www/
# RUN chmod +x /var/www/test.sh
# ENTRYPOINT [ "/var/www/test.sh" ]
# mysql -p

CMD ["mysqld"]

# how do i need to run the container
# docker run --name mariadb_container my_mariadb (-p 3306:3306)