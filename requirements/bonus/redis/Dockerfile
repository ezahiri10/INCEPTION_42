FROM debian:bookworm

RUN apt update && apt install -y redis-server

COPY ../../tools/redis_init.sh /

CMD chmod +x /redis_init.sh

ENTRYPOINT ['/redis_init.sh']
