FILE = srcs/docker-compose.yaml
up:
	docker compos -f $(FILE) up --build
down:
	docker compose -f $(FILE) down
fdown: down
	docker system prune -a

.PHONY: up down fdown
