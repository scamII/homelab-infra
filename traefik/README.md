# Traefik

Copy:

```bash
cp traefik/traefik.env.example /etc/default/traefik
chmod 600 /etc/default/traefik
```

Put your real token in that file.

The repo keeps both `TIMEWEBCLOUD_AUTH_TOKEN` and `TIMEWEBCLOUD_TOKEN` to avoid provider-name ambiguity across generated docs.
