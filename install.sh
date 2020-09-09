#!/usr/bin/env bash

mkdir -p /srv/docker/mariadb/{data,config} && chmod -Rf 777 /srv/docker/mariadb

docker run -d \
--restart always \
--name mariadb \
-p 3306:3306 \
-v /srv/docker/mariadb/data:/var/lib/mysql \
-v /srv/docker/config:/etc/mysql/conf.d \
mariadb
