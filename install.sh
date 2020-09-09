#!/usr/bin/env bash

APPNAME="mariadb"
DATADIR="/srv/docker/$APPNAME"

mkdir -p "$DATADIR"/{data,config} && chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
docker pull mariadb && docker restart $APPNAME
else
docker run -d \
--restart always \
--name "$APPNAME" \
-p 3306:3306 \
-v $DATADIR/data:/var/lib/mysql \
-v $DATADIR/config:/etc/mysql/conf.d \
mariadb
fi
