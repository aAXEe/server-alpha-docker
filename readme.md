# Overview

This repository bundles all docker containers and application code for the
server alpha.openseamap.org.

Have a look at the `docker-compose.yml` for the available containers and their relation to each other.

# Setup

After cloning this repository you have to setup the submodules:
```
git submodule init
git submodule update
```

You will need the following software:
* [Docker](http://docs.docker.com/engine/installation/)
* [Docker Compose](http://docs.docker.com/compose/install/)

## Data-Containers
Some images use data containers to store persistent data. To initialize them
run the `create_all_data.sh` script.

This will build all the necessary containers and create the data instances.
(Later on this will pull the images from the registry instead of a local build)

It is safe to run the script multiple times. Existing data instances will not
be overwritten.

To manually clear old data: `docker rm <name>` where name can be on `fluxbb-data`,
`mediwiki-data` and `mysql-data`.

## Development
To get all container linked and running [Docker Compose](http://docs.docker.com/compose)
can be used:

Run the script `compose_all.sh`. It will start docker-compose to build and run
the containers.

## Production
In order to control and restart all containers as necessary systemd services
can be used.

All `*-docker/` submodules have a `.service` file. See the individual folders
 for details.

# Access to data containers
To get access to the data containers you can run an image with volumes from that
container and with access to your local files:
```
docker run --rm=true -it --link mysql:db --volumes-from fluxbb-data -v $(pwd):/extern openseamap/fluxbb-docker /sbin/my_init -- bash
```

`phusion/baseimage:0.9.16` is the base image of the sub containers. It contains a
ubuntu 14.04 for use in docker containers.

## PhpMyAdmin

To use phpmyadmin to control the database:
```
docker run --rm=true --link mysql:mysql -e MYSQL_USERNAME=mysql -e MYSQL_PASSWORD=abcdef --name phpmyadmin -p 9001:80 corbinu/docker-phpmyadmin
```
