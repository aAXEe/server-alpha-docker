#!/bin/bash
docker-compose rm -f && \
docker-compose build && \
docker-compose up forum map phpadmin proxy webhook tiles mapproxy
