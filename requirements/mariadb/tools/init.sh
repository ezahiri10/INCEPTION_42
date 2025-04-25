#!/bin/bash

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};"

mariadb -e "CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD};'"

mariadb -e "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';"

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${WP_DB_ROOT_PASSWORD}'"

mariadb -e  "FLUSH PRIVILEGES;"

mysqladmin shutdown -u root -p "${WP_DB_ROOT_PASSWORD}"

exec mysqld_safe
