all : build

build :
	@echo "Building the containers..."
	docker compose -f srcs/ up -d
	@echo "Containers are up and running"


clean :
	docker compose down
	docker volume rm $(shell docker volume ls -q)
	docker network prune -f

