#!/bin/bash

# Stop all running containers
echo "Stopping all running containers..."
docker stop $(docker ps -q)

# Remove all containers (both stopped and running)
echo "Removing all containers..."
docker rm $(docker ps -a -q)

# Remove all networks (except default ones)
echo "Removing all networks..."
docker network prune -f

sudo rm -rf /home/ezahiri/data/mariadb/*
sudo rm -rf /home/ezahiri/data/wordpress/*
sudo rm -rf /home/ezahiri/data/portainer/*
# Remove all volumes
echo "Removing all volumes..."
docker volume prune -f

# Remove all unused images (optional)
echo "Removing all unused images..."
docker image prune -a -f

# Remove dangling images
echo "Removing dangling images..."
docker image prune -f

# Final message
echo "Cleanup complete!"

docker system prune --all -f