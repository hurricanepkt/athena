FROM alpine:edge

RUN apk update \
    && apk add lighttpd mp3splt \
    && rm -rf /var/cache/apk/*

ADD htdocs /var/www/localhost/htdocs
COPY startup.sh .
HEALTHCHECK --interval=1m --timeout=1s \
    CMD curl -f http://localhost/ || exit 1
CMD ["/bin/sh","-c","./startup.sh"]