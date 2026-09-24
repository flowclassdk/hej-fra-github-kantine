#!/usr/bin/env bash
# Opgave 12-14: en fil, der overlever containeren — og kantinens eget image med bakken paa.
set -e

docker volume create bestillinger
docker run --rm -v bestillinger:/data alpine sh -c 'echo "bestilling fra kokken" > /data/bestilling.txt'
docker run --rm -v bestillinger:/data alpine cat /data/bestilling.txt

# Opgave 13: uden volumen er filen der ikke.
! docker run --rm alpine cat /data/bestilling.txt
echo "Uden volumen: ingen bestilling. Som forventet."

# Opgave 14: dit eget image med bakken paa.
docker build -t dagensret "$(dirname "$0")"
docker rm -f dagens2 2>/dev/null || true
docker run -d --name dagens2 -v bestillinger:/app/data dagensret
docker exec dagens2 sh -c 'echo "dagens ret fra mit image" > /app/data/fra-dagensret.txt'
docker rm -f dagens2
docker run --rm -v bestillinger:/data alpine cat /data/fra-dagensret.txt
