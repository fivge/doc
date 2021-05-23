---
title: Broadcom BCM43xx驱动
date: 2016-11-19 20:34:17
tags:
  - Ubuntu
  - 网卡驱动
---

装了黑苹果,本机网卡不兼容,就买了博通的无线网卡.无奈,Ubuntu 下没有自带的驱动.

谷歌以下解决方法:

```shell
~$ sudo apt-get update
~$ sudo apt-get install bcmwl-kernel-source
```

~~没卵用…~~
