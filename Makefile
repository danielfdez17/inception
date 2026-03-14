# ? Makefile for managing Docker containers and images for the project.

# ? 📦 The 'all' target builds the Docker images and starts the containers in detached mode.
all: build up

# setup:
# 	@echo "Setting up the volumes' folders..."
# 	@if [ ! -d ~/data/web ]; then mkdir -p ~/data/web; fi
# 	@if [ ! -d ~/data/mariadb ]; then mkdir -p ~/data/mariadb; fi

# ? 🛑 Stops all running containers without removing them.
stop:
	@echo "Stopping containers..."
	docker compose -f srcs/docker-compose.yml stop

# ? 🏗️  Stops and removes all containers, networks, volumes, and images associated with the project.
down:
	@echo "Stopping and removing containers, networks, volumes, and images..."
	docker compose -f srcs/docker-compose.yml down

# ? 🔨 Builds the Docker images without using the cache.
build: #setup
	@echo "Building Docker images without cache..."
	docker compose -f srcs/docker-compose.yml build --no-cache

# ? 🚀 Builds the images and starts the containers in detached mode.
up: build
	@echo "Starting containers in detached mode..."
	docker compose -f srcs/docker-compose.yml up -d

# ? 🧹 Stops and removes all containers, networks, volumes, and images, then prunes the Docker system to remove all unused data.
clean: kill
	@echo "Pruning Docker system to remove all unused data..."
	docker system prune -a --volumes -f

# ? 📊 Lists all Docker images and running containers.
status:
	@echo "Listing Docker images and running containers..."
	@echo "Docker Images:"
	docker images
	@echo "Running Docker Containers:"
	docker ps

# ? 🔪 Stops and removes all containers, networks, volumes, and images associated with the project.
kill:
	@echo "Killing all running containers..."
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

# ? ♻️  Rebuilds the images, stops and removes containers, networks, volumes, and images, then rebuilds and starts the containers again.
re: down clean all

# ? ❓ Displays this help message
help:
	@awk '\
		BEGIN { blue = "\033[0;34m"; green = "\033[0;32m"; reset = "\033[0m"; yellow = "\033[0;33m"; print yellow "Usage: make [target]"; print "Targets:" } \
		/^# \?/ { desc = substr($$0, 5); next } \
		/^$$/ { desc = ""; next } \
		/^[a-zA-Z0-9][a-zA-Z0-9_.-]*:/ { \
			target = $$1; \
			sub(/:.*/, "", target); \
			if (target !~ /^\./) \
				printf "  " blue "%-12s" reset green "%s" reset "\n", target, desc; \
			desc = ""; \
		}' $(firstword $(MAKEFILE_LIST))

.PHONY: all setup stop down build up clean status kill re help
