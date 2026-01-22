
build:
		docker compose up --build

all:
	docker-compose -f srcs/docker-compose.yml up --build -d
