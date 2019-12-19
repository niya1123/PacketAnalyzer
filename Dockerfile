FROM elixir:alpine

WORKDIR /packet_analyzer

RUN apk update && \
    apk add --no-cache \
    bash \
    npm && \
    mix local.hex --force && \
    mix archive.install hex phx_new --force

