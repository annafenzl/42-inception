FROM debian:buster

RUN apt-get update \
&& apt install -y \
wget \
php \
php-mysqli \
php-fpm \
mariadb-server

COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress_setup.sh

# # INSTALL WORDPRESS
# # To use WP-CLI from the command line by typing wp,
# # make the file executable
# # move it to somewhere in your PATH
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp 

EXPOSE 9000

ENTRYPOINT [ "/var/www/wordpress_setup.sh" ]

CMD [ "bash" ]
# CMD [ "apache2ctl", "-D", "FOREGROUND" ]
# CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]

# docker run -d --name my-wordpress -p 8080:80 my-wordpress
