#!/bin/bash

log_file=./stop-remove-container.log
container_name=node-sqlite-app-container

> $log_file

if [ "$(docker ps -a -q -f name=$container_name)" ]; then
    echo "Stopping and removing existing container $container_name..."
    docker stop $container_name >> $log_file 2>&1
    docker rm $container_name >> $log_file 2>&1
fi