#!/bin/bash

# db creds
DB_USER="root"
DB_PASSWORD="Lukowie1"
DB_NAME="comp301_403"

HOST2_IP="192.168.10.107"

# backup directory
BACKUP_DIR="/home/lucas/backup"

# timestamp for unique backup file names
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

#Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Backup the MySQL db
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME >$BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql

#compress the backup file
gzip $BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql
echo "Backup compressed: $BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql.gz"

scp $BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql.gz lucas@$HOST2_IP:~/Documents/
echo "Copied compressed backup to webhost2."

# restore on remote machine
ssh lucas@$HOST2_IP "gunzip ~/Documents/$DB_NAME-$TIMESTAMP.sql.gz; mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME <~/Documents/$DB_NAME-$TIMESTAMP.sql"

echo "backup transferred, unzipped, and restored on webhost2."
