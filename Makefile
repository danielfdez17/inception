
all:
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker system prune -a --volumes -f

re: clean all down

.PHONY: all down clean re
