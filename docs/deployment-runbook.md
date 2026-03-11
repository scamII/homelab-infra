# Deployment Runbook

## 1. Prepare Proxmox host

```bash
lsblk
mkdir -p /data
mkfs.ext4 /dev/sdb
echo '/dev/sdb /data ext4 defaults 0 2' >> /etc/fstab
mount -a
mkdir -p /data/nextcloud /data/postgres /data/mariadb /data/backups
```

## 2. Configure Proxmox networking

Use `proxmox/interfaces`.

## 3. Download Debian 12 template

```bash
pveam update
pveam download local debian-12-standard_12.7-1_amd64.tar.zst
```

## 4. Create containers

```bash
chmod +x scripts/create-lxc-all.sh
./scripts/create-lxc-all.sh
chmod +x scripts/bootstrap-all.sh
./scripts/bootstrap-all.sh
```
