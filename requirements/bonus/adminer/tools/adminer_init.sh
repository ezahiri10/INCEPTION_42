#!/bin/bash
mkdir -p /var/www/html

cd /var/www/html/

curl -L -o index.php https://www.adminer.org/latest.php

chown -R www-data:www-data /var/www/html 

chmod 755 -R /var/www/html

exec php -S 0.0.0.0:8080 -t /var/www/html/
