# Overview

This repository bundles all docker containers and application code for the
server alpha.openseamap.org.

# Setup

After cloning this repository you have to setup the submodules:
```
git submodule init
git submodule update
```

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
