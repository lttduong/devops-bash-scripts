#!/bin/bash


# Refer to: https://www.fosstechnix.com/shell-script-for-mysql-database-backup/
########################################################

## Shell Script to Shell Script for MySQL DataBase Backup by FOSSTechNix.com   

########################################################


DATE=`date +"%d%b%Y`
DB_PATH="/home/dump/"
MYSQL_HOST="localhost"
PORT="3306"
MYSQL_USER="adminfoss"
PASSWORD="fosstechnix"
DB="test"
RESULT="$?"

################Below command lets you create new directory and permissions#############

mkdir -p /home/dump/ && chmod -R 777 /home/dump/

############Below command is to take Dump from server and Remote VM also################

mysqldump -h${MYSQL_HOST} -P${PORT} -u${MYSQL_USER} -p${PASSWORD} ${DB} > ${DB_PATH}/${DB}_${DATE}.sql

################<$?-The exit status of the last command executed>#####################

if [ $RESULT -eq 0 ]; then
echo "DataBackup done" 
echo "DataBackup Success" | mutt -s "DB Backup status" fosstechnix@gmail.com
else
echo "DataBackup failed"
echo "DataBackup Failure" | mutt -s "DB Backup status" fosstechnix@gmail.com
fi