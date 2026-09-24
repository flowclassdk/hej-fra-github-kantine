#!/usr/bin/env bash
# Opgave 2-6: containere i kantinen — start, kig ind, log, en mere og oprydning.
set -e

docker run -d --name menu nginx:alpine
docker exec menu ls /etc/nginx/conf.d
docker logs menu
docker run -d --name menu2 nginx:alpine
docker ps
docker stop menu menu2
docker rm menu menu2
