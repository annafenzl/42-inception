#!bin/bash

# if ! wp core is-installed; then
#     wp core install
# fi

mkdir website
cd website

bash

# apt-get install sendmail

wp core download --allow-root

# dbhost: ifconfig inet, maybe set back to mariadb when doing docker-compose
# wp core config  --allow-root --dbhost=172.17.0.1:3306 --dbname=wordpress --dbuser=afenzl --dbpass=letmein
wp config create --allow-root --dbhost=172.17.0.1:3306 --dbname=wordpress --dbuser=afenzl --dbpass=letmein

chmod 600 wp-config.php
# echo "config file is set up!"

wp core install  --allow-root --url=afenzl.42.fr --title="MY WEBSITE" --admin_name=ruler --admin_password=letmein --admin_email=annaselinafenzl@gmail.com
# wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
echo "Wordpress: set up!"

exec "$@"