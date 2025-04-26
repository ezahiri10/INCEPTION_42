#!/bin/bash



service mariadb start


sleep 5


mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mariadb -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '${MYSQL_USER_PASS}';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER_NAME}'@'%';"
mariadb -u root -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown


exec mariadbd
