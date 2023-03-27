#!bin/bash

# wp core download --allow-root;
# echo "Wordpress: creating users..."
# # wp --allow-root user create admin admin@example.com --role=administrator --user_pass=<password>
# # wp --allow-root user create john john@example.com --role=author --user_pass=<password>
# echo "Wordpress: set up!"

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded!"
else
	echo "setting up wordpress"

	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	# sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	# sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	# sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	# cp wp-config-sample.php wp-config.php

	#Inport env variables in the config file
	sed -i "s/username_here/afenzl/g" wp-config-sample.php
	sed -i "s/password_here/letmein/g" wp-config-sample.php
	sed -i "s/localhost/mariadb/g" wp-config-sample.php
	sed -i "s/database_name_here/wordpress/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	echo "set up!"
fi

exec "$@"