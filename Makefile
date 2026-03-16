# ? Makefile for managing Docker containers and images for the project.

SOURCE_DIR := srcs
COMPOSE = docker compose -f $(SOURCE_DIR)/docker-compose.yml --env-file $(SOURCE_DIR)/.env

# ? 📦 The 'all' target builds the Docker images and starts the containers in detached mode.
all: build up

# ? ⚡ Fast path: builds with cache and starts containers in detached mode.
all-fast: build-fast up-fast

# ? ⚙️  Sets up the project environment by copying the example environment file to the actual .env file.
setup:
	@echo "Setting up the project environment..."
	@cp .env.example $(SOURCE_DIR)/.env
	@echo "Environment file created at $(SOURCE_DIR)/.env"

# ? 🛑 Stops all running containers without removing them.
stop:
	@echo "Stopping containers..."
	$(COMPOSE) stop

# ? 🏗️  Stops and removes all containers, networks, volumes, and images associated with the project.
down:
	@echo "Stopping and removing containers, networks, volumes, and images..."
	$(COMPOSE) down

# ? 🔨 Builds the Docker images without using the cache.
build: setup
	@echo "Building Docker images without cache..."
	$(COMPOSE) build --no-cache

# ? ⚡ Builds Docker images using cache for faster local iterations.
build-fast: setup
	@echo "Building Docker images with cache..."
	$(COMPOSE) build

# ? 🚀 Builds the images and starts the containers in detached mode.
up: build
	@echo "Starting containers in detached mode..."
	$(COMPOSE) up -d

# ? ⚡ Starts containers after cached build.
up-fast: build-fast
	@echo "Starting containers in detached mode..."
	$(COMPOSE) up -d

# ? 🧹 Stops and removes all containers, networks, volumes, and images, then prunes the Docker system to remove all unused data.
clean: down
	@echo "Pruning Docker system to remove all unused data..."
	$(COMPOSE) down --rmi all --volumes --remove-orphans
# 	$(COMPOSE) system prune -a --volumes -f

# ? 📊 Lists all Docker images and running containers.
status:
	@echo "Listing Docker images and running containers..."
	@echo "Docker Images:"
	docker images
	@echo "Running Docker Containers:"
	docker ps

# # ? 🔪 Stops and removes all containers, networks, volumes, and images associated with the project.
# kill:
# 	@echo "Killing all running containers..."
# 	$(COMPOSE) down --rmi all --volumes --remove-orphans

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

.PHONY: all all-fast setup stop down build build-fast up up-fast clean status kill re help
