#!/usr/bin/env bash
set -euo pipefail
for id in 110 111 112 113 114 115 116; do
  pct start $id || true
  pct exec $id -- bash -lc 'apt update && apt full-upgrade -y && apt install -y curl wget ca-certificates gnupg lsb-release nano vim unzip htop chrony'
  pct exec $id -- timedatectl set-timezone Europe/Helsinki
  pct exec $id -- systemctl enable chrony --now
done
