#!/bin/bash

account=mohamedabdallah0
tag=latest
log_file=./build-push-docker.log
image_name=node-sqlite-app

full_image_name="$account/$image_name:$tag"

> $log_file

if [[ "$(docker images -q $full_image_name 2> /dev/null)" != "" ]]; then
    ./stop-remove-container.sh
    echo "Removing old Docker image $full_image_name..."
    docker rmi $full_image_name >> $log_file 2>&1

    if [ $? -ne 0 ]; then
        echo "Error removing old Docker image. Check the log file: $log_file"
        exit 1
    fi
fi

echo "Building Docker image..."
docker build -t $full_image_name . >> $log_file 2>&1

if [ $? -ne 0 ]; then
    echo "Error building Docker image. Check the log file: $log_file"
    exit 1
fi

echo "Pushing Docker image..."
docker push $full_image_name >> $log_file 2>&1

if [ $? -ne 0 ]; then
    echo "Error pushing Docker image. Check the log file: $log_file"
    exit 1
fi

echo "Docker image build and push successful!"