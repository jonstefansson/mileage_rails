#!/usr/bin/env bash

curl \
-s \
--get \
--header 'Accept: application/json' \
--url http://localhost:3000/fillups \
| jq -M '.'
