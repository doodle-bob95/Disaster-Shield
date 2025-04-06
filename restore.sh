#!/bin/bash

# Variables
BACKUP_DIR="/var/backups/disastershield"
LATEST_BACKUP=$(ls -t "$BACKUP_DIR" | grep backup_ | head -n 1)
MYSQL_USER="root"
MYSQL_PASSWORD="your_mysql_password"
DATABASE_NAME="wordpress_db"

# Restore website files
tar -xzf "$BACKUP_DIR/$LATEST_BACKUP" -C /

# Restore database
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DATABASE_NAME" < "$BACKUP_DIR/db_backup_$(echo $LATEST_BACKUP | cut -d'_' -f2).sql"

echo "Restore completed from: $LATEST_BACKUP"