FROM debian:bullseye

RUN apt update && apt install -y nginx

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/static_website/index.html /var/www/html/index.html

CMD ["nginx", "-g", "daemon off;"]