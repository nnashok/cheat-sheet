# [Let's Encrypt](https://letsencrypt.org)
tplink's `TP-Link` dynamic DNS service does not work with Let's Encrypt. The challenge fails with:
```
Failed authorization procedure. xyz.tplinkdns.com (http-01): urn:ietf:params:acme:error:dns :: DNS problem: query timed out looking up A for xyz.tplinkdns.com
```
This is most likely TP Links' DNS servers blocking Let's Encrypt's IP addresses.

You can use [no-ip](https://my.noip.com/#!/dynamic-dns) instead and this will work.

## Generating a certificate
```
sudo certbot certonly --standalone -d xyz.ddns.net
```
The certificate, chain are stored at `/etc/letsencrypt/live/xyz.ddns.net/fullchain.pem` and the private key at `/etc/letsencrypt/live/xyz.ddns.net/privkey.pem`
