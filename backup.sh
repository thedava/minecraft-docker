#!/bin/bash

rsync -avEh  \
    --delete-after \
    --exclude='*.log' \
    --exclude='*.converted' \
    --exclude='*.gz' \
    --exclude='core' \
    "./data/" "./backups/_work"
