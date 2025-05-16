FROM debian:bullseye

RUN apt update && apt install -y redis-server

COPY ./redis_init.sh /redis_init.sh

RUN chmod +x /redis_init.sh && cd /


ENTRYPOINT ["./redis_init.sh"]
