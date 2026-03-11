# Homelab Infrastructure

Production-style homelab.

## Stack

- Proxmox VE
- Traefik
- CrowdSec
- Nextcloud
- WordPress
- PostgreSQL
- MariaDB
- Redis
- AdGuard

## Network

LAN: 192.168.1.0/24  
Servers: 10.22.2.0/24  

## Domains

dashboard.scam-dev.ru  
cloud.scam-dev.ru  
ad.scam-dev.ru  
pro.scam-dev.ru  
scam-dev.ru  

## Deployment

1. Configure Proxmox network
2. Create LXC containers
3. Install Traefik
4. Configure CrowdSec
5. Deploy services
