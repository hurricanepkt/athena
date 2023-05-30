FROM jitesoft/lighttpd


ENV PORT=80 \
    SERVER_NAME="localhost" \
    SERVER_ROOT="/var/www/html/" \
    CONFIG_FILE="/etc/lighttpd/lighttpd.conf" \
    SKIP_HEALTHCHECK="false" \
    MAX_FDS="1024" \
    WWWDATA_GUID="${WWWDATA_GUID}" \
    SLEEP_DELAY=300

RUN apk add --no-cache mp3splt busybox-suid
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
COPY html /var/www/html/
RUN chmod +x /usr/local/bin/docker-entrypoint
ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "update" ]