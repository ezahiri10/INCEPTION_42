FROM    debian:bullseye

RUN     apt update && apt install curl -y
   

RUN curl -L https://github.com/portainer/portainer/releases/download/2.9.3/portainer-2.9.3-linux-amd64.tar.gz -o /tmp/portainer.tar.gz \
    && mkdir -p /app/portainer \
    && tar xzf /tmp/portainer.tar.gz -C /app \
    && rm /tmp/portainer.tar.gz

ENTRYPOINT ["/app/portainer/portainer", "-H", "unix:///var/run/docker.sock"]