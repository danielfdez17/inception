
FROM alpine:3.19 AS assets

# Stage with only static files needed at runtime.
COPY ./conf/nginx.conf /assets/conf/nginx.conf
COPY ./tools/setup.sh /assets/setup.sh

FROM alpine:3.19

# Install Nginx and OpenSSL
RUN --mount=type=cache,target=/var/cache/apk apk add --no-cache nginx openssl

# Folder for Nginx runtime files and SSL certificates
RUN mkdir -p /run/nginx /etc/nginx/ssl

# Copy custom configuration and setup file from assets stage
COPY --from=assets /assets/conf/nginx.conf /etc/nginx/http.d/nginx.conf
COPY --from=assets /assets/setup.sh /setup.sh
RUN chmod +x /setup.sh

# Expose port 443 for HTTPS
EXPOSE 443

# Default command to run Nginx in the foreground
CMD ["/setup.sh"]
