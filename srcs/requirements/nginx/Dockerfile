# # ! NGINX Dockerfile
# FROM alpine:3.22.2
# RUN apk update && apk add nginx
# COPY ./srcs/requirements/nginx/ /tmp/
# RUN sh /tmp/setup.sh
# EXPOSE 80 443
# CMD ["sh", "/tmp/start.sh"]

FROM debian:bullseye
RUN apt update && apt upgrade -y && apt install -y nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]