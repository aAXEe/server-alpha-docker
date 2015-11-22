#!/bin/bash

docker build --tag=openseamap/fluxbb-docker ./fluxbb-docker
docker build --tag=openseamap/mediawiki-docker ./mediawiki-docker
docker build --tag=openseamap/map-docker ./map-docker
docker build --tag=openseamap/mysql-docker ./mysql-docker 
docker build --tag=openseamap/nginx-proxy ./nginx-proxy
docker build --tag=openseamap/tiles-docker ./tiles-docker
docker build --tag=openseamap/webhook-docker ./webhook-docker
