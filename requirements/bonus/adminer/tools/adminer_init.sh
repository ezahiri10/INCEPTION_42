#!/bin/bash
mkdir -p /var/www/html

cd /var/www/html/

curl -L -o adminer.php https://www.adminer.org/latest.php

chown -R www-data:www-data /var/www/html 

mv adminer.php index.php

chmod 755 -R /var/www/html

php -S 0.0.0.0:8080 -t /var/www/html/
