all : clean


clean :
	docker compose down -v
	docker system prune -af --volumes
	sudo rm -rf  /home/zahiri/data/wordpress/*
	sudo rm -rf  /home/zahiri/data/mariadb/*