---
title: SSL 证书
---

### 一、申请

> certbot(letsencrypt) > acme.sh

> 使用 acme.sh 生成、更新证书

https://github.com/acmesh-official/acme.sh

#### 1. 安装

```bash
curl https://get.acme.sh | sh -s email=
```

#### 2. 设置 ca

```bash
acme.sh --set-default-ca --server letsencrypt
acme.sh --set-default-ca --server google
acme.sh --set-default-ca --server zerossl
```

- google https://pki.goog/

  https://cloud.google.com/certificate-manager/docs/public-ca-tutorial

  ```bash
  acme.sh --register-account -m foo@bar.com --server google \
      --eab-kid xx \
      --eab-hmac-key xxx
  ```

- zerossl

  ```bash
  ### zerossl
  acme.sh  --register-account  --server zerossl  --eab-kid  xxx --eab-hmac-key xxx
  ```

#### 3. 生成证书

##### 3.1 http 方式

http 方式需要在你的网站根目录下放置一个文件, 来验证你的域名所有权,完成验证. 然后就可以生成证书了.

```bash
acme.sh --issue -d example.com -d www.example.com -d xxx.example.com -w /home/wwwroot/example.com
```

##### 3.2 dns 方式

https://github.com/acmesh-official/acme.sh/wiki/dnsapi

`dnspod`

```bash
acme.sh --issue --dns dns_dp -d 0x64.in
```

`cloudflare`

```
acme.sh --issue --dns dns_cf -d 0x64.in
```

泛域名

```bash
acme.sh --issue --dns dns_cf -d *.0x64.in
```

**⚠freenom 注册的域名不可以用 cloudflare dns**

https://github.com/acmesh-official/acme.sh/issues/2989

#### 4. 安装证书

```bash
acme.sh --installcert -d example.com \
--key-file xxx \
--fullchain-file xxx \
--reloadcmd "systemctl restart nginx"
```

### 二、续期

#### 1. 自动续期

#### 2. 手动续期

```bash
acme.sh --renew -d  example.com
### 强制
acme.sh --renew -d  example.com --force
```

### 三、其他配置

> 生成`迪菲-赫尔曼密钥`以增强安全

```shell
openssl dhparam -out /etc/ssl/certs/dhparams.pem 2048
```

> nginx 配置

https://ssl-config.mozilla.org/

### 四、验证

https://www.ssllabs.com/ssltest/
