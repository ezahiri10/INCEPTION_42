ARG VERSION=bookworm

FROM debian:${VERSION} AS cert

RUN apt update && apt install -y  openssl 

RUN mkdir -p /etc/nginx/ssl

CMD openssl req -x509 -nodes  -newkey rsa \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MO/ST=KH/O=42/OU=42/CN=ezahiri.42.fr"

ARG VERSION
FROM debian:${VERSION}

RUN apt update && apt install -y nginx

RUN rm -f /etc/nginx/nginx.conf

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

COPY --from=cert /etc/nginx/ssl/nginx.key /etc/nginx/ssl/nginx.key
COPY --from=cert /etc/nginx/ssl/nginx.crt /etc/nginx/ssl/nginx.crt

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]