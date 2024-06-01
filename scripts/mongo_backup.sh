#!/bin/sh

# Get current date and time for filename
now="$(date +'%d-%m-%Y_%H-%M')"
filename1="Mongo_bk_$now"
backupfolder="/home/ubuntu/mongo_backup/"
fullpathbackupfile1="$backupfolder/$filename1"
logfile="$backupfolder/backup_log_$(date +'%Y_%m').txt"

# Log the start time of mongodump
echo "mongodump started at $(date +'%d-%m-%Y %H:%M')" >> "$logfile"

# Perform the mongodump
mongodump --username fosstechnix --password devops --gzip --out "$fullpathbackupfile1" --authenticationDatabase admin

# Log the finish time of mongodump
echo "mongodump finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"

# Change file permissions
chown ubuntu "$fullpathbackupfile1"
chown ubuntu "$logfile"
echo "file permission changed" >> "$logfile"

# Find and delete backup files older than 1 day
find "$backupfolder" -name "Mongo_bk*" -mtime +1 -exec rm -rf {} \;
echo "old files deleted" >> "$logfile"

# Log the end of the operation
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
echo "*******" >> "$logfile"

# Exit the script
exit 0