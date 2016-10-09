#!/bin/bash
docker build --tag=openseamap/fluxbb-docker ./fluxbb-docker && \
docker run --name=fluxbb-data -v /data \
    openseamap/fluxbb-docker echo "data-only container for fluxbb"

docker build --tag=openseamap/mysql-docker ./mysql-docker && \
docker run --name=mysql-data -v /var/lib/mysql  \
    openseamap/mysql-docker echo "data-only container for mysql" && \
docker run --name=mysql --detach=false --rm=true --volumes-from=mysql-data --hostname=mysql \
     -e MYSQL_USER=mysql \
    openseamap/mysql-docker
