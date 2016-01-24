#!/bin/bash

systemctl reload fluxbb.service
systemctl reload map.service
systemctl reload mysql.service
systemctl reload reverse-proxy.service
systemctl reload smtp.service
systemctl reload tiles.service
