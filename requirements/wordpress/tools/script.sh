#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html

cd /var/www/html

chmod -R 755 /var/www/html

sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.conf #XXX

until mariadb -h mariadb -P 3306 -u "${MYSQL_USER_NAME}" -p"${MYSQL_USER_PASS}" -e \
    "SELECT 1;" &> /dev/null; do
    echo "Waiting for MariaDB to be ready..."
    sleep 3
done

echo "MariaDB is up!"


wp core download --allow-root

wp config create \
    --dbname="${MYSQL_DATABASE}" \
    --dbuser="${MYSQL_USER_NAME}" \
    --dbpass="${MYSQL_USER_PASS}" \
    --dbhost="mariadb:3306" \
    --allow-root

wp core install \
    --url="${DOMAIN_NAME}" \
    --title="${WP_TITLE}" \
    --admin_user="${WP_A_NAME}" \
    --admin_password="${WP_A_PASS}" \
    --admin_email="${WP_A_EMAIL}" \
    --allow-root 

wp user create "${WP_U_NAME}" "${WP_U_EMAIL}" \ 
    --user_pass="${WP_U_PASS}" \
    --role="${WP_U_ROLE}" \
    --allow-root #change U by A XXX

chown -R www-data:www-data /var/www/html #XXX
chmod 755 -R /var/www/html #XXX

mkdir -p /run/php #XXX
/usr/sbin/php-fpm7.4 -F #XXX