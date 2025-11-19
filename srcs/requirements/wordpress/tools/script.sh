#!/bin/bash

curl  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html

cd /var/www/html


sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.conf

treis=0
until mariadb -h mariadb -P 3306 -u "${MYSQL_USER_NAME}" -p"${MYSQL_USER_PASS}" -e "SELECT \"HELLO WORLD;\""; do
    echo "Waiting for MariaDB to be ready  $treis ..."
    sleep 3
    treis=$((treis + 1))
    if [ "$treis" -ge 20 ]; 
    then
        echo "Mariadb is still not Ready "
        exit 1
    fi
done

echo "MariaDB is up!"

wp core download --allow-root

wp config create \
    --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER_NAME}" --dbpass="${MYSQL_USER_PASS}" --dbhost="mariadb:3306" \
    --allow-root

wp core install \
    --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_NAME}" --admin_password="${WP_ADMIN_PASS}" --admin_email="${WP_ADMIN_EMAIL}" \
    --allow-root

wp user create "${WP_USER_NAME}" "${WP_USER_EMAIL}" --user_pass="${WP_USER_PASS}" --role="${WP_USER_ROLE}" \
    --allow-root 

wp plugin install redis-cache --activate --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379  --allow-root
wp redis enable --allow-root 

chown -R www-data:www-data /var/www/html
chmod 755 -R /var/www/html 
mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F 