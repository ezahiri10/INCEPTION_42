#!/bin/bash

REDIS_CONF_PATH="/etc/redis/redis.conf"

sed -i 's/^bind=127.0.0.1/bind=0.0.0.0/' $REDIS_CONF_PATH
sed -i 's/^requirepass/d' $REDIS_CONF_PATH

redis-server $REDIS_CONF_PATH