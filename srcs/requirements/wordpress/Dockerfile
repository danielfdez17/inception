# ! WORDPRESS Dockerfile
# ? Base Image for wordpress service
# FROM debian:11
FROM debian:bullseye

# ? Executed commands to build the image
# RUN apk update && apk add --no-cache php83 php83-fpm php83-mysqli php83-json php83-opcache php83-curl php83-phar php83-mbstring php83-xml php83-zip wget tar curl mariadb-client
RUN apt update && apt upgrade -y && apt install -y php-fpm vim

# ? Executed command when the container starts
CMD ["tail", "-f", "/dev/null"]
