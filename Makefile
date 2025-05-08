all : clean


clean :
	docker compose down -v
	docker system prune -af --volumes
	sudo rm -rf  /home/zahiri/data/wordpress/*
	sudo rm -rf  /home/zahiri/data/mariadb/*
	sudo systemctl stop nginx || true
	sudo systemctl stop mariadb || true
	sudo systemctl stop php8.2-fpm || true

	sudo apt purge -y nginx nginx-common nginx-full php8.2* mariadb-server mariadb-client
	sudo apt autoremove -y
	sudo apt autoclean

	sudo rm -rf /etc/nginx /etc/php /etc/mysql
	sudo rm -rf /var/lib/mysql /var/www/html /var/log/nginx /var/log/mysql

	echo "✅ System cleaned"
