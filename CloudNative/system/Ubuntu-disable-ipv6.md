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

![](https://ws2.sinaimg.cn/large/006tNc79ly1fr7rspy5btj30ju04w74v.jpg)

##### 效果

- before

![](https://ws3.sinaimg.cn/large/006tNc79ly1fr7rtbb9s2j30ss0a6god.jpg)

- after

![](https://ws4.sinaimg.cn/large/006tNc79ly1fr7rti2d2ej30wd06tac2.jpg)
