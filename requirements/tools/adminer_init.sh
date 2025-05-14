#!/bin/bash

cd /var/www/html/

curl -o adminer.php https://github.com/vrana/adminer/releases/download/v4.7.8/adminer-4.7.8.php

chown -R www-data:www-data /var/www/html 

chmod 755 -R /var/www/html

php -S 0.0.0.0:8080 -t /var/www/html/


#php -S runs a lightweight server 
#suitable for development, which keeps the container or script running in the foreground.