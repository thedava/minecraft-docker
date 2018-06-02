#!/bin/bash

rsync -avEh  \
    --delete-after \
    --exclude='*.log' \
    --exclude='*.converted' \
    --exclude='*.gz' \
    --exclude='core' \
    --exclude='crash-*.txt' \
    "./data/" "./backups/_work"
