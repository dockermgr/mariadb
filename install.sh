#!/usr/bin/env bash

APPNAME="mariadb"
DOCKER_HUB_URL="mariadb"

sudo mkdir -p "$DATADIR"/{data,config}
sudo chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
  sudo docker pull "$DOCKER_HUB_URL"
  sudo docker restart "$APPNAME"
else
  sudo docker run -d \
    --restart always \
    --name "$APPNAME" \
    -p 3306:3306 \
    -v "$DATADIR/data":/var/lib/mysql \
    -v "$DATADIR/config":/etc/mysql/conf.d \
    "$DOCKER_HUB_URL"
fi
