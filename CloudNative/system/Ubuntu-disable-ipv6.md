---
title: Ubuntu disable ipv6
date: 2018-05-11 22:25:41
tags:
  - Linux
---

### Ubuntu disable ipv6

##### 编辑`/etc/sysctl.d/99-sysctl.conf`

```shell
sudo vim /etc/sysctl.d/99-sysctl.conf
```

##### 添加

```
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```

##### 刷新

```bash
sudo sysctl -p
```

##### 在`host`中注释掉 ipv6 地址
