#!/usr/bin/env bash
# Opgave 11: byg, start, hent, fjern — og kan koeres to gange i traek.
set -e

cd "$(dirname "$0")"

docker build -t dagensret .
docker rm -f dagens 2>/dev/null || true
docker run -d --name dagens -p 8100:8000 dagensret
sleep 3
curl -f http://localhost:8100
docker rm -f dagens
