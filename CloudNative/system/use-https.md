---
title: use https
date: 2017-07-29 15:24:23
tags:
  - Server
  - https/ssl
---

使用`Let’s Encrypt`为博客配置 https

> 安装

```shell
git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
```

> 初始化

```shell
./letsencrypt-auto
```

> 生成证书

```shell
./letsencrypt-auto certonly -a webroot --webroot-path=/var/www/hexo -d fivge.tk
```

> 生成`迪菲-赫尔曼密钥`以增强安全

```shell
openssl dhparam -out /etc/ssl/certs/dhparams.pem 2048
```

> hexo.conf

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

> 检验

![](https://ws4.sinaimg.cn/large/006tNc79ly1fi2038u907j30up0hbgnn.jpg)

> 续期

```shell
./letsencrypt-auto renew
```

---

### https 证书

<https://github.com/certbot/certbot>

```
openssl req -new -newkey rsa:2048 -sha256 -nodes -out luanju_me.csr -keyout luanju_me.key -subj "/C=CN/ST=Shandong/L=Qingdao/O=Luan Inc./OU=Web Security/CN=luanju.me"



./letsencrypt-auto certonly -a webroot --webroot-path=/var/www/hexo -d luanju.me -d www.luanju.me

./certbot-auto --nginx
```

https://www.ssllabs.com/ssltest/analyze.html?d=luanju.me&latest

<https://aotu.io/notes/2016/08/16/nginx-https/>

<https://blog.guorenxi.com/43.html>

<https://www.logcg.com/archives/1709.html>

![](https://ws2.sinaimg.cn/large/006tNc79ly1fnn65v6fuxj31hc0u0wjd.jpg)
