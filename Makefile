FILE = srcs/docker-compose.yaml
up:
	sudo docker compose -f $(FILE) up --build
down:
	sudo docker compose -f $(FILE) down
	sudo rm -rf /home/ozahid-/data/wpgx
fdown: down
	sudo docker system prune -a

.PHONY: up down fdown
