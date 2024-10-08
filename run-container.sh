#!/bin/bash

account=mohamedabdallah0
tag=latest
log_file=./run-container.log
image_name=node-sqlite-app
container_name=node-sqlite-app-container


> $log_file

./stop-remove-container.sh

echo "Pulling latest Docker image..."
docker pull $account/$image_name:$tag >> $log_file 2>&1

echo "Running Docker container..."
docker run -d -p 3000:3000  -v "$(pwd)"/db/:/app/db/ --name=$container_name $account/$image_name:$tag >> $log_file 2>&1

if [ $? -ne 0 ]; then
    echo "Error running Docker container. Check the log file: $log_file"
    exit 1
fi

echo "Docker container started successfully!"
