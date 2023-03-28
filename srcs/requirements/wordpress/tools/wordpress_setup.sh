#!bin/bash

mkdir my-website
cd my-website

wp core download --allow-root
# dbhost: ifconfig inet, maybe set back to mariadb when doing docker-compose
wp core config  --allow-root --dbhost=172.17.0.1:3306 --dbname=wordpress --dbuser=afenzl --dbpass=letmein
# chmod 600 wp-config.php
# echo "came until here"
# wp core install  --allow-root --url=afenzl.42.fr --title="Hello there" --admin_name=ruler --admin_password=letmein --admin_email=annaselinafenzl@gmail.com
# echo "Wordpress: creating users..."wp core install --url=afenzl.42.fr --title="Hello there" --admin_name=ruler --admin_password=letmein --admin_email=you@example.com
# # wp --allow-root user create admin admin@example.com --role=administrator --user_pass=<password>
# # wp --allow-root user create john john@example.com --role=author --user_pass=<password>
# echo "Wordpress: set up!"

# if [ -f ./wp-config.php ]
# then
# 	echo "wordpress already downloaded!"
# else
# 	echo "setting up wordpress"
	
# 	mkdir wp_setup;
# 	cd wk_setup;
# 	wp core download --allow-root;


# 	bash
# 	# #Download wordpress and all config file
# 	# wget http://wordpress.org/latest.tar.gz
# 	# tar xfz latest.tar.gz
# 	# mv wordpress/* .
# 	# rm -rf latest.tar.gz
# 	# rm -rf wordpress

# 	#Inport env variables in the config file
# 	# sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
# 	# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
# 	# sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
# 	# sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
# 	# cp wp-config-sample.php wp-config.php

# 	#Inport env variables in the config file
# 	# sed -i "s/database_name_here/wordpress/g" wp-config-sample.php
# 	# sed -i "s/username_here/afenzl/g" wp-config-sample.php
# 	# sed -i "s/password_here/letmein/g" wp-config-sample.php
# 	# sed -i "s/localhost/mariadb/g" wp-config-sample.php
# 	# cp wp-config-sample.php wp-config.php

# 	# echo "set up!"
# fi



exec "$@"