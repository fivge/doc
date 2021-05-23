---
title: use https
date: 2017-07-29 15:24:23
update: 2020-06-09 11:07:00
---

> 使用 `Let’s Encrypt` 生成 TLS 证书，为网站启用 HTTPS

### letsencrypt > certbot

> 太笨重

#### 安装

```shell
git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
```

#### 初始化

```shell
./letsencrypt-auto
```

#### 生成证书

```shell
./letsencrypt-auto certonly -a webroot --webroot-path=/var/www/hexo -d fivge.tk
```

#### 生成`迪菲-赫尔曼密钥`以增强安全

```shell
openssl dhparam -out /etc/ssl/certs/dhparams.pem 2048
```

#### nginx.conf

```nginx
server {
  root /var/www/hexo;
  server_name fivge.tk;
  listen 80;
  listen 443 ssl;
  ssl_certificate /etc/letsencrypt/live/fivge.tk/fullchain.pem; # managed by Certbot
  ssl_certificate_key /etc/letsencrypt/live/fivge.tk/privkey.pem; # managed by Certbot
  ssl_session_cache shared:le_nginx_SSL:1m; # managed by Certbot
  ssl_session_timeout 1440m; # managed by Certbot
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # managed by Certbot
  ssl_prefer_server_ciphers on; # managed by Certbot
  ssl_dhparam /etc/ssl/certs/dhparams.pem;
  ssl_ciphers "ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA2
56:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES
128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECD
SA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES
256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-
AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AE
S256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS";
# END
# 301
   if ($scheme != "https") {
      return 301 https://$host$request_uri;
   } # managed by Certbot

  access_log  /var/log/nginx/hexo_access.log;
  error_log   /var/log/nginx/hexo_error.log;
  location ~* ^.+\.(ico|gif|jpg|jpeg|png)$ {
    root /var/www/hexo;
    access_log   off;
    expires      1d;
  }
  location ~* ^.+\.(css|js|txt|xml|swf|wav)$ {
    root /var/www/hexo;
    access_log   off;
    expires      10m;
  }
  location / {
    root /var/www/hexo;
    if (-f $request_filename) {
    rewrite ^/(.*)$  /$1 break;
    }
  }
  location ~ /.well-known {
        allow all;
  }
}

```

#### 检验

<https://www.ssllabs.com/ssltest/>

#### 续期

```shell
./letsencrypt-auto renew
```

### acme.sh

```bash
curl  https://get.acme.sh | sh
```

```bash
### nginx
acme.sh --issue -d 0x64.ml --nginx
### webroot
acme.sh --issue -d 0x64.ml -d www.0x64.ml --webroot /var/www/0x64.ml/
### installcert
acme.sh --installcert -d 0x64.ml \
--key-file       /usr/local/nginx/ssl/0x64.ml/key.pem  \
--fullchain-file /usr/local/nginx/ssl/0x64.ml/cert.pem \
--reloadcmd     "service nginx force-reload"
```

`nginx config`

```nginx
  ssl_certificate /usr/local/nginx/ssl/0x64.ml/cert.pem;
  ssl_certificate_key /usr/local/nginx/ssl/0x64.ml/key.pem;
```

<https://github.com/acmesh-official/acme.sh/wiki/%E8%AF%B4%E6%98%8E>
