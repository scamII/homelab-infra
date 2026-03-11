#!/usr/bin/env bash
set -euo pipefail

TPL="local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
BR="vmbr0"
TAG="20"
GW="10.22.2.1"
DNS="10.22.2.14"
SEARCH="scam-dev.ru"

pct create 110 ${TPL} --hostname traefik --ostype debian --arch amd64 --cores 1 --memory 768 --swap 256 --rootfs local-lvm:8 --unprivileged 1 --features nesting=1 --net0 name=eth0,bridge=${BR},tag=${TAG},ip=10.22.2.10/24,gw=${GW},type=veth --nameserver ${DNS} --searchdomain ${SEARCH} --onboot 1
pct create 111 ${TPL} --hostname wordpress --ostype debian --arch amd64 --cores 1 --memory 1024 --swap 256 --rootfs local-lvm:8 --unprivileged 1 --features nesting=1 --net0 name=eth0,bridge=${BR},tag=${TAG},ip=10.22.2.11/24,gw=${GW},type=veth --nameserver ${DNS} --searchdomain ${SEARCH} --onboot 1
pct create 112 ${TPL} --hostname nextcloud --ostype debian --arch amd64 --cores 2 --memory 2048 --swap 512 --rootfs local-lvm:12 --unprivileged 1 --features nesting=1 --net0 name=eth0,bridge=${BR},tag=${TAG},ip=10.22.2.12/24,gw=${GW},type=veth --nameserver ${DNS} --searchdomain ${SEARCH} --onboot 1
pct create 113 ${TPL} --hostname postgres --ostype debian --arch amd64 --cores 1 --memory 1024 --swap 256 --rootfs local-lvm:8 --unprivileged 1 --features nesting=1 --net0 name=eth0,bridge=${BR},tag=${TAG},ip=10.22.2.13/24,gw=${GW},type=veth --nameserver ${DNS} --searchdomain ${SEARCH} --onboot 1
pct create 114 ${TPL} --hostname adguard --ostype debian --arch amd64 --cores 1 --memory 512 --swap 128 --rootfs local-lvm:4 --unprivileged 1 --features nesting=1 --net0 name=eth0,bridge=${BR},tag=${TAG},ip=10.22.2.14/24,gw=${GW},type=veth --nameserver 1.1.1.1 --searchdomain ${SEARCH} --onboot 1
pct create 115 ${TPL} --hostname mariadb --ostype debian --arch amd64 --cores 1 --memory 1024 --swap 256 --rootfs local-lvm:8 --unprivileged 1 --features nesting=1 --net0 name=eth0,bridge=${BR},tag=${TAG},ip=10.22.2.15/24,gw=${GW},type=veth --nameserver ${DNS} --searchdomain ${SEARCH} --onboot 1
pct create 116 ${TPL} --hostname redis --ostype debian --arch amd64 --cores 1 --memory 512 --swap 128 --rootfs local-lvm:4 --unprivileged 1 --features nesting=1 --net0 name=eth0,bridge=${BR},tag=${TAG},ip=10.22.2.16/24,gw=${GW},type=veth --nameserver ${DNS} --searchdomain ${SEARCH} --onboot 1

pct set 112 -mp0 /data/nextcloud,mp=/mnt/data
pct set 113 -mp0 /data/postgres,mp=/var/lib/postgresql
pct set 115 -mp0 /data/mariadb,mp=/var/lib/mysql
