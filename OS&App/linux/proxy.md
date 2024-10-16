- https://github.com/jiangxufeng/v2rayL

* https://github.com/trancx/vmess-cli

* https://github.com/v2rayA/v2rayA

```bash
base64 -d

CTRL D
```

---

... => v2ray => socks5 10808 && https/http 10809

#### socks5 to https/http

`privoxy`

`/etc/privoxy/config`

```config
forward-socks5   /               127.0.0.1:10808  .
listen-address [::1]:10809
listen-address  127.0.0.1:10809
```

#### https/http proxy

```
export http_proxy=http://localhost:8035/ https_proxy=http://localhost:8035/
```

`git`

```bash
git config --global https.proxy http://127.0.0.1:10809
git config --global http.proxy http://127.0.0.1:10809

git config --global --unset https.proxy
```

`ssh`

```bash
https_proxy=http://localhost:8123 ssh root@123.123.123.123
```

#### socks5 proxy

#### https://github.com/tinyproxy/tinyproxy
