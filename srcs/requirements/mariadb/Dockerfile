FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server


# LABEL version="1.0"
# LABEL description="MariaDB Server"

# HEALTHCHECK --start-period=5m \
#   CMD mariadb -e 'SELECT @@datadir;' || exit 1

# ENTRYPOINT [ "" ]

EXPOSE 3306

CMD ["mysqld"]