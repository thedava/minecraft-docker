#!/bin/bash

rsync -avEh  \
    --delete-after \
    --exclude='*.log' \
    --exclude='*.converted' \
    --exclude='*.gz' \
    --exclude='core' \
    --exclude='crash-*.txt' \
    --exclude='minecraft_server*.jar' \
    "./data/" "./backups/_work"
