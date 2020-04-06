#!/usr/bin/env bash

if [[ ! -f ".env" ]]; then
    cp "example.env" ".env"
fi

docker-compose up -d
docker-compose logs -f
