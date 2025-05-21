#!/bin/bash


service mariadb start


sleep 5


mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '${MYSQL_USER_PASS}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_NAME}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin shutdown -u root

mysqld --bind-address=0.0.0.0 --port=3306 --user=root
