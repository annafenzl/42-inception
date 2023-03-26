FROM debian:buster

RUN apt-get update \
&& apt install -y \
wget \
php 


# INSTALL WORDPRESS
# To use WP-CLI from the command line by typing wp,
# make the file executable
# and move it to somewhere in your PATH
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


EXPOSE 9000
