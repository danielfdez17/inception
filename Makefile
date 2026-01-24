

down:
	docker-compose -f srcs/docker-compose.yml down

build:
	docker-compose -f srcs/docker-compose.yml build --no-cache

up:
	docker-compose -f srcs/docker-compose.yml up

clean:
	docker system prune -a --volumes -f

st:
	docker ps

kill:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

re: down kill clean build up

.PHONY: all down clean re st
