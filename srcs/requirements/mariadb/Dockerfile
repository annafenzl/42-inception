FROM debian:buster

RUN apt-get update -y
RUN apt-get install mariadb-server -y

COPY ./conf/my.cnf /etc/mysql/
COPY ./tools/entrypoint.sh ./entrypoint.sh

RUN chmod 777 ./entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["./entrypoint.sh"]

# docker exec -it mariadb mysql -u root
# docker exec -it mariadb mysql -u afenzl -p
# USE $(MARIA_DB_NAME);
# SHOW TABLES; --> if not empty, the db has content
# SELECT COUNT(*) FROM table_name;