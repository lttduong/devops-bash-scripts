#!/bin/bash

# Get the filename as an argument
logfile="/var/log/syslog"

# Check if a filename is provided
if [ -z "$logfile" ]; then
  echo "Error: Please specify a filename as an argument."
  exit 1
fi

# Check if the file exists
if [ ! -f "$logfile" ]; then
  echo "Error: File '$logfile' does not exist."
  exit 1
fi

# Create a backup with timestamp in the same directory
backup_file="$logfile.bak-$(date +%Y-%m-%d)"
cp "$logfile" "$backup_file"

if [ $? -eq 0 ]; then
  echo "Created backup: $backup_file"
  # Delete the original file (confirm before deletion)
  read -p "Are you sure you want to delete '$logfile' (y/N)? " answer
  if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; then
    rm "$logfile"
    echo "Deleted: $logfile"
  else
    echo "Deletion cancelled."
  fi
else
  echo "Error: Failed to create backup."
fi