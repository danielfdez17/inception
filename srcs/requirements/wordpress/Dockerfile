# ! WORDPRESS Dockerfile
FROM alpine:3.22.2
RUN apk update && apk add wordpress php7 php7-fpm php7-mysqli php7-opcache php7-gd php7-curl php7-mbstring php7-xml php7-zip php7-phar php7-dom php7-iconv php7-session php7-json php7-common php7-intl php7-fileinfo
COPY ./srcs/requirements/wordpress/ /tmp/
RUN sh /tmp/setup.sh
EXPOSE 9000
CMD ["sh", "/tmp/start.sh"]
