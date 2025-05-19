FROM debian:bullseye

RUN apt update && apt install -y curl php php-mysqli

COPY ./tools/adminer_init.sh /adminer_init.sh

RUN chmod +x /adminer_init.sh 

ENTRYPOINT ["/adminer_init.sh"]

