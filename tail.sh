#!/usr/bin/env bash

LINES=200
if [[ -n "${1}" ]]; then
  LINES="${1}"
fi

docker-compose logs -f --tail="${LINES}"
