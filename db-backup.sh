#!/bin/bash

SOURCE_DB="/home/hammo/headway-scripting/db/users.sqlite"  
BACKUP_DIR="/home/hammo/headway-scripting/db-backup"  
DATE=$(date +"%Y-%m-%d")

BACKUP_FILE="${BACKUP_DIR}/sqlite_backup_${DATE}.sqlite"

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

cp "$SOURCE_DB" "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi
