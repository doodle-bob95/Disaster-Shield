#!/bin/bash

# Variables
BACKUP_DIR="/var/backups/disastershield"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
MYSQL_USER="root"
MYSQL_PASSWORD="your_mysql_password"
DATABASE_NAME="wordpress_db"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup website files
tar -czf "$BACKUP_FILE" /var/www/html

# Backup database
mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DATABASE_NAME" > "$BACKUP_DIR/db_backup_$TIMESTAMP.sql"

# Cleanup old backups (older than 7 days)
find "$BACKUP_DIR" -type f -mtime +7 -exec rm {} \;

echo "Backup completed: $BACKUP_FILE"