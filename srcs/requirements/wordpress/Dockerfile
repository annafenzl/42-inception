FROM debian:buster

RUN apt-get update \
&& apt install -y \
wget \
php \
php-mysqli \
php-fpm \
php-common \
php7.3 \
mariadb-client

# # INSTALL WORDPRESS_COMMAND_LINE_INTERFACE
# # To use WP-CLI from the command line by typing wp,
# # make the file executable
# # move it to somewhere in your PATH
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

#Create the folder to enable php start
RUN mkdir /run/php

COPY ./tools /var/www/
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN chmod +x /var/www/wordpress_setup.sh

EXPOSE 9000

ENTRYPOINT [ "/var/www/wordpress_setup.sh" ]

# launch php-fpm in the foreground and ignore deaminize from the conf file (-F)
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
# CMD ["bin/bash"]

