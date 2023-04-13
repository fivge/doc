### 0x01 Install

```bash
wget http://nginx.org/download/nginx-1.19.2.tar.gz
sudo tar -xvzf nginx-1.19.2.tar.gz
sudo apt install gcc libpcre3 libpcre3-dev openssl zlib-devel/zlib1g-dev
./configure --prefix=/srv/nginx
# 最终配置
# ./configure --prefix=/srv/nginx --with-http_ssl_module --with-http_v2_module --add-module=/srv/src/ngx_brotli
make && make install
sudo ln -s /srv/nginx/sbin/nginx /usr/local/bin
nginx -V
```

https://nginx.org/en/docs/configure.html

### 0x02 modules

#### gzip

> 默认启用

配置

```nginx
    # gizp
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_types text/plain text/css text/xml application/json application/javascript application/rss+xml application/atom+xml image/svg+xml;
```

#### ssl

```bash
--with-http_ssl_module
```

#### h2

```bash
--with-http_v2_module
```

尽管 HTTP2 并不要求使用加密，但是对于现代浏览器来说如 Google Chrome 和 Mozilla Firefox 默认 HTTP2 和 HTTPS 是一起使用的，所以如果你想配置 HTTP2 的话，还是需要同时配置 SSL。

```nginx
listen       443 ssl http2;
```

#### br

https://github.com/google/ngx_brotli

##### Dynamically loaded

```bash
sudo git clone https://github.com/google/ngx_brotli.git
cd ngx_brotli &&  sudo git submodule update --init
cd nginx-1.x.x
./configure --with-compat --add-dynamic-module=/srv/src/ngx_brotli
make modules
sudo cp objs/ngx_http_brotli_static_module.so objs/ngx_http_brotli_filter_module.so /srv/nginx/modules
```

```
load_module modules/ngx_http_brotli_filter_module.so;
load_module modules/ngx_http_brotli_static_module.so;
```

##### Statically compiled

```
./configure --add-module=/path/to/ngx_brotli
```

配置

```nginx
    #br
    brotli on;
    brotli_comp_level 6;
    brotli_types text/plain text/css text/markdown application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript image/svg+xml;
```

#### onion

https://community.torproject.org/onion-services/

https://github.com/alecmuffett/eotk/blob/master/docs.d/HOW-TO-INSTALL.md

```
# ?
ngx_http_substitutions_filter_module
```

#### h3

https://quic.nginx.org/README

https://github.com/cloudflare/quiche/tree/master/nginx

https://boringssl.googlesource.com/boringssl/+/HEAD/BUILDING.md

https://iostreamx.com/build-nginx-quic/

```bash
sudo apt install mercurial cmake ninja-build golang
hg clone -b quic https://hg.nginx.org/nginx-quic
mkdir build
cd build
cmake -GNinja ..
ninja
```

```
        --with-http_v3_module     - enable QUIC and HTTP/3
        --with-stream_quic_module - enable QUIC in Stream
```

⚠ 注意：nginx 的 OCSP Stapling 是由 OpenSSL 实现，使用 BoringSSL 会导致该功能无法使用。实际使用体验上来说感觉无伤大雅。

#### ngx_http_stub_status_module

> nginx 服务器状态监控

http://nginx.org/en/docs/http/ngx_http_stub_status_module.html

```bash
 --with-http_stub_status_module
```

### 0x03 config

https://ssl-config.mozilla.org/

https://www.digitalocean.com/community/tools/nginx?global.app.lang=zhCN

#### default_server

nginx 的 default_server 指令可以定义默认的 server 去处理一些没有匹配到 server_name 的请求，如果没有显式定义，则会选取第一个定义的 server 作为 default_server

```nginx
server {
    listen 80 default_server;
    server_name _; # _ 并不是重点 __ 也可以 ___也可以
    return 403;
}
```

#### OCSP stapling

> 将原本需要客户端实时发起的 OCSP 请求转嫁给服务端
>
> > 在线证书状态协议（Online Certificate Status Protocol），简称 OCSP

https://www.cnblogs.com/cangqinglang/p/13823213.html

#### 正向代理

##### fe

rewrite

##### be

302 301

> 301

```nginx
server {

...

# 301
   if ($scheme != "https") {
      return 301 https://$host$request_uri;
   }
}
```

#### 反向代理

### 0x04 管理

#### 使用 sysytemd 管理

TODO

```bash
mkdir -p /etc/systemd/system/nginx.service.d
printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" > /etc/systemd/system/nginx.service.d/override.conf

systemctl daemon-reload
systemctl restart nginx.service
```

`/lib/systemd/system/nginx.service`

`nginx.service`

```
[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/srv/nginx/logs/nginx.pid
ExecStartPre=/usr/local/bin/nginx -t
ExecStart=/usr/local/bin/nginx
ExecReload=/usr/local/bin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

---

### TODO

- https://access.redhat.com/documentation/zh-cn/red_hat_enterprise_linux/8/html/deploying_different_types_of_servers/setting-up-and-configuring-nginx_deploying-different-types-of-servers
- h3
- 洋葱网络
- 同步配置
