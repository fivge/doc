### Install

download

make

### Conf

#### gzip

`main.conf`

```properties
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```

`default.conf`

```properties
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    #location ~ \.php$ {
    #    root           html;
    #    fastcgi_pass   127.0.0.1:9000;
    #    fastcgi_index  index.php;
    #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
    #    include        fastcgi_params;
    #}

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}
```

`gzip.conf`

```properties
# Gzip Settings
gzip on;
gzip_min_length 1k;
gzip_buffers 4 16k;
gzip_comp_level 5;
gzip_types text/css text/xml text/plain image/jpeg image/gif image/png application/javascript application/json;
```

#### https/tls

#### h2

http1.1 最多一次加载 6 个文件

h2 没有这个限制

速度更快，对 TSL 更友好

#### br

需要模块支持

todo

https://github.com/google/ngx_brotli

#### onion

todo

https://community.torproject.org/onion-services/

#### h3

需要模块支持

todo

https://quic.nginx.org/README

https://github.com/cloudflare/quiche/tree/master/nginx

### Use

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
