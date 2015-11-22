#!/bin/bash
docker build --tag=openseamap/fluxbb-docker ./fluxbb-docker && \
docker run --name=fluxbb-data -v /data \
    openseamap/fluxbb-docker echo "data-only container for fluxbb"

docker build --tag=openseamap/mediawiki-docker ./mediawiki-docker && \
docker run --name=mediawiki-data -v /data \
    openseamap/mediawiki-docker echo "data-only container for mediawiki"

docker build --tag=openseamap/mysql-docker ./mysql-docker && \
docker run --name=mysql-data -v /var/lib/mysql -e MYSQL_USER=mysql  \
    openseamap/mysql-docker echo "data-only container for mysql"
