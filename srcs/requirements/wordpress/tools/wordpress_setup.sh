#!bin/bash

echo ""

# cd /var/www/html;
wp core download --allow-root;
mv /var/www/wp-config.php /var/www/html/;
echo "Wordpress: creating users..."
# wp --allow-root user create admin admin@example.com --role=administrator --user_pass=<password>
# wp --allow-root user create john john@example.com --role=author --user_pass=<password>
echo "Wordpress: set up!"

exec "$@"