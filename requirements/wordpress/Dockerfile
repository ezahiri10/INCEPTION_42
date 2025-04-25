FROM debian:bullseye

RUN apt update && apt install -y php-fpm php-mysql curl mariadb-client

COPY ./tools/script.sh /

RUN chmod +x /script.sh

RUN /script.sh

CMD ["php-fpm", "-F"]