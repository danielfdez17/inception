# ! NGINX Dockerfile
# ? Base Image for nginx service
# FROM debian:11
FROM debian:bullseye

# ? Executed commands to build the image
RUN apt update && apt upgrade -y && apt install -y nginx

# ? Executed command when the container starts
ENTRYPOINT ["nginx", "-g", "daemon off;"]