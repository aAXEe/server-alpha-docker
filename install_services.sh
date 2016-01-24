#!/bin/bash

cp */*.service /etc/systemd/system/
cp *.service /etc/systemd/system/
systemctl daemon-reload
