#!/bin/bash
log_file=./stop-remove-container.log

> $log_file

echo "Stopping and removing Docker containers..."
docker compose down >> $log_file 2>&1
if [ $? -ne 0 ]; then
    echo "Error stopping Docker containers. Check the log file: $log_file"
    exit 1
fi

echo "Docker containers stopped and removed successfully!"