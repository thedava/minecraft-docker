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
echo "------ "$(date '+%Y-%m-%d %H:%M:%S')" >>"

echo "Selected mode: $mode"
echo ""

echo "Starting backup..."
./bin/backup.sh

if [[ $mode = "archive" ]]; then
    echo "Creating archive"
    tar -I pbzip2 -cf "backups/$now.tar.bz2" "backups/_work"
    ln -sfn "$now.tar.bz2" "backups/latest.tar.bz2"
else
    echo "Creating folder"
    cp -r "backups/_work" "backups/$now"
fi

echo "Cleanup old backups"
find backups/*.bz2 -type f -ctime +5 -exec rm -rf {} \;
find backups/20* -type d -ctime +5 -exec rm -rf {} \;

echo ""
echo "done"

echo "------ "$(date '+%Y-%m-%d %H:%M:%S')" <<"
echo ""
