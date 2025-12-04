#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <path-to-tar-archive>"
    echo "Example: $0 /path/to/metrics/dump.tar"
    exit 1
fi

TAR_FILE="$1"

if [ ! -f "$TAR_FILE" ]; then
    echo "Error: File '$TAR_FILE' not found"
    exit 1
fi

git clone https://github.com/hanzei/dockprom
cd dockprom

mkdir -p prometheus_data
tar -xf "$TAR_FILE" -C prometheus_data

docker compose up

echo "Setup complete! Access Grafana at http://localhost:3000 (admin/admin)"
