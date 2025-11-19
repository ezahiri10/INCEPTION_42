FROM debian:bullseye

RUN apt update && apt install -y php7.4-fpm php-mysql curl mariadb-client 

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]