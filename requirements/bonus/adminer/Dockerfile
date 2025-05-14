FROM debian:bookworm

RUN apt update && apt install -y curl

COPY COPY ../../adminer_init.sh /

RUN chmod +x /adminer_init.sh 

ENTRYPOINT ["/adminer_init.sh"]

