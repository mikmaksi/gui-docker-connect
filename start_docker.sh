#!/bin/bash

# notes
# ideally docker-compose up should work, but other things need to happen

# get the ethernet ip
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}') 

# XQuarts needs to be running
open -a XQuartz

# add ip to list of authorized clients that can connect
xhost + $IP

# desfile DISPLAY for docker
DISPLAY=$IP:0

# start docker
docker-compose up --abort-on-container-exit 

# alternative way
# docker run -it -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix my-app firefox

# clean up
docker-compose rm --force
xhost - $IP
