#!/usr/bin/env bash
set -Eeuo pipefail

REPO_URL="https://github.com/aliene92/shvirtd-example-python.git"
APP_DIR="/opt/shvirtd-example-python"
COMPOSE_FILE="${APP_DIR}/compose.yaml"

mkdir -p /opt

git clone "${REPO_URL}" "${APP_DIR}"

cd "${APP_DIR}"

docker compose -f "${COMPOSE_FILE}" down || true

docker compose -f "${COMPOSE_FILE}" up -d --build

docker compose -f "${COMPOSE_FILE}" ps
