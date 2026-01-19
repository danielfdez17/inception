# ! MARIADB Dockerfile
FROM alpine:3.22.2
RUN apk update && apk add mariadb mariadb-client
COPY ./srcs/requirements/mariadb/ /tmp/
RUN sh /tmp/setup.sh
EXPOSE 3306
CMD ["sh", "/tmp/start.sh"]