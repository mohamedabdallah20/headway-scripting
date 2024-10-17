#!/bin/bash
log_file=./run-container.log

> $log_file

./stop-remove-container.sh

echo "Pulling latest Docker images..."
docker compose pull >> $log_file 2>&1

echo "Starting Docker containers..."
docker compose up -d >> $log_file 2>&1
if [ $? -ne 0 ]; then
    echo "Error starting Docker containers. Check the log file: $log_file"
    exit 1
fi

echo "Docker containers started successfully!"