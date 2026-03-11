# Homelab Infrastructure

Production-style homelab for:

- Proxmox VE
- Keenetic Giant
- Traefik
- CrowdSec
- Nextcloud
- WordPress
- PostgreSQL
- MariaDB
- Redis
- AdGuard Home

## Topology

- LAN: `192.168.1.0/24`
- Servers VLAN: `10.22.2.0/24`
- example: `example.ru`

## Services

| Service | IP | example |
|---|---|---|
| Proxmox | 10.22.2.2 | `pro.example.ru` |
| Traefik + CrowdSec | 10.22.2.10 | `dashboard.example.ru` |
| WordPress | 10.22.2.11 | `example.ru`, `www.example.ru` |
| Nextcloud | 10.22.2.12 | `cloud.example.ru` |
| PostgreSQL | 10.22.2.13 | internal only |
| AdGuard Home | 10.22.2.14 | `ad.example.ru` |
| MariaDB | 10.22.2.15 | internal only |
| Redis | 10.22.2.16 | internal only |

## Repository layout

```text
.github/          GitHub Actions and templates
docs/             architecture and operations docs
proxmox/          host network and firewall docs
traefik/          static and dynamic config
crowdsec/         acquisition and appsec notes
adguard/          split-DNS config
nextcloud/        nginx and PHP notes
wordpress/        nginx and PHP notes
postgres/         PostgreSQL config and SQL
mariadb/          MariaDB config and SQL
redis/            Redis config
scripts/          helper scripts for Proxmox and LXC
```

## Quick start

1. Read `docs/architecture.md`
2. Read `docs/deployment-runbook.md`
3. Copy `traefik/traefik.env.example` to `/etc/default/traefik`
4. Replace every `REPLACE_*` placeholder
5. Run `scripts/create-lxc-all.sh` on the Proxmox host
6. Follow `docs/post-install-checklist.md`
