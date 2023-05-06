#!bin/bash

mkdir website
cd website

# bash

sleep 3
until mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_USER_PASSWORD -e '\c'; do
    sleep 3
done

if ! wp core is-installed --path=/var/www/html --allow-root 2>/dev/null; then
    wp core download --allow-root
    wp config create --allow-root \
        --dbname=$MYSQL_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PASSWORD --dbhost=$MYSQL_HOST
    wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL
    wp user create --allow-root --porcelain \
    "$WP_USER" "$WP_USER_MAIL" --role=author --user_pass="$WP_USER_PASSWORD"
fi
chown -R www-data:www-data /var/www

echo "Wordpress: set up!"

exec "$@"
