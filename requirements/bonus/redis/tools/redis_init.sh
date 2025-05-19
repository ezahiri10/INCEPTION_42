#!/bin/bash

REDIS_CONF_PATH="/etc/redis/redis.conf"

sed -i 's/^bind .*/bind 0.0.0.0/' $REDIS_CONF_PATH

redis-server --protected-mode no