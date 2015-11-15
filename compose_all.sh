#!/bin/bash
docker-compose rm -f && \
docker-compose build && \
docker-compose up wiki forum map phpadmin proxy
