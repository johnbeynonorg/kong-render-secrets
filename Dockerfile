# syntax = docker/dockerfile:1.2

FROM redis:6-alpine

COPY redis.conf .

RUN --mount=type=secret,id=_env,dst=/etc/secrets/.env cat /etc/secrets/.env

ENTRYPOINT ["redis-server", "./redis.conf"]

#FROM kong/kong-gateway:2.6.0.1-alpine

#RUN mkdir -p /home/kong/render-config



# RUN --mount=type=secret,id=kong_config,dst=/tmp/kong.config cp /tmp/kong.config /home/kong/render-config/kong.config