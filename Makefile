FILE = srcs/docker-compose.yaml

up:
	sudo docker compose -f $(FILE) up --build

down:
	sudo docker compose -f $(FILE) down

fdown: down
	sudo rm -rf /home/ozahid-/data/wpgx/*
	sudo rm -rf /home/ozahid-/data/mariadb/*
	sudo docker volume rm srcs_mariadb-data
	sudo docker volume rm srcs_wpgx

prune:
	sudo docker system prune -a

re:	fdown up

maria:
	sudo docker compose -f $(FILE) up mariadb --build

nginx:
	sudo docker compose -f $(FILE) up nginx --build

wordpress:
	sudo docker compose -f $(FILE) up wordpress --build

.PHONY: up down fdown re prune nginx wordpress maria
