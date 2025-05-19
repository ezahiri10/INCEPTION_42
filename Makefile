all : build

build :
	@echo "Building the containers..."
	docker compose up -d
	@echo "Containers are up and running"



clean :
	@echo "Cleaning up the containers..."
	docker compose down
	@echo "Containers are stopped and removed"
	@echo "Cleaning up the volumes..."
	docker volume rm $(shell docker volume ls -q) || true
	@echo "Volumes are removed"
	@echo "Cleaning up the networks..."
	docker network prune -f
	@echo "Networks are removed"
	@echo "Cleanup completed"

fclean :
	docker compose down -v
	docker system prune -af --volumes
	sudo rm -rf  /home/zahiri/data/wordpress/*
	sudo rm -rf  /home/zahiri/data/mariadb/*
	sudo rm -rf  /home/zahiri/data/portainer/*
	sudo systemctl stop nginx || true
	sudo systemctl stop mariadb || true
	sudo systemctl stop php8.2-fpm || true

	sudo apt purge -y nginx nginx-common nginx-full php8.2* mariadb-server mariadb-client
	sudo apt autoremove -y
	sudo apt autoclean
	sudo rm -rf /etc/nginx /etc/php /etc/mysql
	sudo rm -rf /var/lib/mysql /var/www/html /var/log/nginx /var/log/mysql
	sudo docker system prune -af --volumes
	echo "✅ System cleaned"
	docker compose down -v
	docker system prune -af --volumes

