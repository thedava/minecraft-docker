#!/bin/bash

rsync -avE  \
    --delete-after \
    --exclude='*.log' \
    --exclude='*.converted' \
    --exclude='*.gz' \
    --exclude='core' \
    "./data/" "./backups/_work"
