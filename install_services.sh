#!/bin/bash

cp *-docker/*.service /etc/systemd/system/
systemctl daemon-reload
