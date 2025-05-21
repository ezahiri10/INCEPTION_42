all : build

build :
	@echo "Building the containers..."
	docker compose up -d
	@echo "Containers are up and running"



clean :
	docker compose down
	docker volume rm $(shell docker volume ls -q) || true
	docker network prune -f

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

