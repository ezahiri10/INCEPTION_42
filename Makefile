all : build

build :
	@echo "Building the containers..."
	docker compose -f srcs/docker-compose.yml up -d
	@echo "Containers are up and running"


clean :
	docker compose -f srcs/docker-compose.yml down
	docker rm -f $(docker ps -a -q)  || true
	docker volume prune -f
	docker network prune -f


