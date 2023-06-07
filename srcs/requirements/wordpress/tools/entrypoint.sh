#!/bin/sh
sleep 3
until mysql --host=mariadb --user=$MARIA_DB_USER --password=$MARIA_DB_PASSWORD -e '\c'; do
    sleep 3
done

if ! wp-cli core is-installed --path=/var/www/html --allow-root; then
    wp-cli core download --allow-root
    wp-cli config create --allow-root \
        --dbname=$MARIA_DB_NAME --dbuser=$MARIA_DB_USER --dbpass=$MARIA_DB_PASSWORD --dbhost=mariadb
    wp-cli core install --allow-root --url=$DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL
    wp-cli user create --allow-root --porcelain \
    "$WP_USER" "$WP_USER_MAIL" --role=author --user_pass="$WP_USER_PASSWORD"
fi
chown -R www-data:www-data /var/www

exec "$@"