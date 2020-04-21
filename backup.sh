#!/bin/bash

rsync -avEh  \
    --delete-after \
    --delete-excluded \
    --exclude='*.log' \
    --exclude='*.converted' \
    --exclude='*.gz' \
    --exclude='core' \
    --exclude='crash-*.txt' \
    --exclude='/debug' \
    --exclude='/*.jar' \
    "./data/" "./backups/_work"
