FROM debian:bullseye

RUN apt update && apt install -y mariadb-server

COPY  ./tools/init.sh .

RUN chmod +x init.sh

ENTRYPOINT [ "./init.sh" ]
