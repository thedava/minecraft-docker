#!/bin/bash

rsync -av  \
    --exclude='*.log' \
    --exclude='*.converted' \
    --exclude='*.gz' \
    --exclude='core' \
    "./data/" "./backups/_work"
