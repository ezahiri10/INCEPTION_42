FROM debian:bullseye

RUN apt update && apt install -y nginx

RUN rm -f /etc/nginx/nginx.conf

COPY ../tools/static_website/nginx.conf /etc/nginx/nginx.conf

COPY ../tools/static_website/website/ /var/www/html/

CMD ["nginx", "-g", "daemon off;"]