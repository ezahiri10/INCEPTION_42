#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

sudo mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html

cd /var/www/html

chmod -R 755 /var/www/html

sed -i 's|listen = .*|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

echo "Waiting MariaDb ...."

for ((i = 0; i < 10; i++)); do
    if mariadb -h mariadb -P 3306 \
        -u "${WP_DB_USER}" \
        -p "${WP_DB_PASSWORD}"
        echo "Mariadb UP!"
        break
    else
        echo "MariaDB not ready ... ($i)"
        sleep 3
    fi
done

wp core download --allow-root

wp config create \
    --dbname="${WP_DB_NAME}" \
    --dbuser="${WP_DB_USER}" \
    --dbpass="${WP_DB_PASSWORD}" \
    --dbhost="mariadb:3306" \
    --allow-root

wp core install \
    --url="${DOMAIN_NAME}" \
    --title="${WP_TITLE}" \
    --admin_user="${WP_A_NAME}" \
    --admin_password="${WP_A_PASS}" \
    --admin_email="${WP_A_EMAIL}" \
    --allow-root 

wp user create "${WP_U_NAME}" "${WP_A_EMAIL}" \
    --user_pass="${WP_A_PASS}" \
    --role="${WP_A_ROLE}" \
    --allow-root

chown -R www-date:www-date /var/www/html