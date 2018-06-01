#!/bin/bash

default_mode="archive"

if [[ -z "$1" ]]; then
    mode=$default_mode
else
    if [[ $1 = "archive" ]]; then
        mode="archive"
    else
        mode="folder"
    fi
fi

now=$(date '+%Y-%m-%d_%H%M%S')

echo "------ "$(date '+%Y-%m-%d %H:%M:%S')

echo "Selected mode: $mode"
echo ""

echo "Starting backup..."
./backup.sh

if [[ $mode = "archive" ]]; then
    echo "Creating archive"
    tar -cjf "backups/$now.tar" "backups/_work"
    pbzip2 -9 -t "backups/$now.tar"
else
    echo "Creating folder"
    cp -r "backups/_work" "backups/$now"
fi

echo "Cleanup old backups"
find backups/*.bz2 -type f -ctime +3 -exec rm -rf {} \;
find backups/20* -type d -ctime +3 -exec rm -rf {} \;
echo ""
echo "done"
echo ""
