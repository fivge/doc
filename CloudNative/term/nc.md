---
title: nc
date: 2018-01-06 23:19:56
updated:
tags:
  - nc
  - Term
categories:
  - Term
---

```bash
### server开启TCP端口
nc -l -p 22
### server开启UDP端口
nc -ul -p 123
### server查看TCP开启情况
netstat -ntpl
### server查看UDP开启情况
netstat -nupl
### h1/h2检验server端口连通性
### TCP
nc -vz 10.0.0.3 22
### UDP
nc -u -vz 10.0.0.1 123
```

---

> 查看端口号开启情况

```shell
### UDP
netstat -nupl
### TCP
netstat -ntpl
###
lsof -i:80
```

![](https://ws1.sinaimg.cn/large/006tNbRwly1fft8elqrxhj30r80cb7ab.jpg)

```shell
telnet 10.0.0.1 344
### 开启TCP端口
nc -l -p 344
nc 10.0.0.1 344
### 开启UDP端口
nc -ul -p 344
### 检测端口信息
nc -v 10.0.0.1 344
-z => 扫描模式。不做输入输出。

可以为端口号,也可以为范围,如 341-348
```

> ### 参考链接

<https://linux.cn/article-9190-1.html>

<!-- more -->

未完待续.........
