#!/bin/bash

# Refer to: https://www.fosstechnix.com/mysql-database-backup-using-shell-script/
# Database credentials

DB_USER="fosstechnix"
DB_PASS="devops"
DB_NAME="devopshint"

# Backup directory

BACKUP_DIR="/home/ubuntu/mysql_backup"

# Date format for the backup file
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-backup-$DATE.sql"

# Create backup directory if it doesn't exist

mkdir -p "$BACKUP_DIR"

# Perform database backup using mysqldump

mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE"

# Check if the backup was successful

if [ $? -eq 0 ]; then
 echo "Database backup successful: $BACKUP_FILE"
else
 echo "Database backup failed"
fi