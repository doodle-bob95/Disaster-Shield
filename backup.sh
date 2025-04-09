#!/bin/bash

# Backup location
BACKUP_DIR="/var/backups/disastershield"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
BACKUP_FILE="backup_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# What to back up (WordPress content)
tar -czf "$BACKUP_DIR/$BACKUP_FILE" /var/www/html/wp-content

# Save the readable timestamp to a text file (for PHP to read)
echo "Last backup created: $TIMESTAMP" > /var/www/html/last_backup.txt
