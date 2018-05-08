#!/bin/bash

now=$(date '+%Y-%m-%d_%H%M%S')

echo "------ "$(date '+%Y-%m-%d %H:%M:%S')

echo "Starting backup..."
./backup.sh
echo "Backup done"

echo "Creating new folder for now"
cp -r backups/_work "backups/$now"
echo "Folder for now created"

echo "Cleanup old directories"
find backups/20* -type d -ctime +3 -exec rm -rf {} \;
echo "Cleanup done"
echo ""
