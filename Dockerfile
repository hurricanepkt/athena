# syntax=docker/dockerfile:1


FROM ghcr.io/linuxserver/baseimage-ubuntu:jammy

# Add files from binstage

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

ARG DEBIAN_FRONTEND="noninteractive"


RUN \
  echo "**** install runtime ****" && \
    apt-get update && \
    apt-get install -y \
    lighttpd \
    mp3splt && \
  echo "**** clean up ****" && \
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY /root /

ADD html /var/www/html

ENTRYPOINT ["/startup.sh"]

EXPOSE 80
VOLUME /input_music
VOLUME /output_music