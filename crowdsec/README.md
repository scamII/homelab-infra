# CrowdSec

Use the Traefik plugin + AppSec layout.

```bash
curl -s https://install.crowdsec.net | bash
apt install -y crowdsec
cscli collections install crowdsecurity/linux
cscli collections install crowdsecurity/traefik
cscli collections install crowdsecurity/http-cve
cscli collections install crowdsecurity/appsec-virtual-patching
cscli collections install crowdsecurity/appsec-generic-rules
```
