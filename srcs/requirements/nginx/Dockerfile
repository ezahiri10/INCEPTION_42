FROM debian:bullseye

RUN apt update && apt install -y nginx openssl 

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes  -newkey rsa \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MO/ST=KH/O=42/OU=42/CN=${DOMAIN_NAME}"

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]