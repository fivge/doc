---
title: macOS Term使用Shadowsocks
date: 2017-08-01 00:37:53
tags:
- macOSTerm
- Shadowsocks
categories:
- macOS
---

### 理论基础

macOS新版的ShadowsocksX-NG已经集成了http代理,所以直接在终端中启用http代理即可

![](https://ws4.sinaimg.cn/large/006tKfTcly1fi3jl0lozkj30di09taat.jpg)

### 启用代理

在终端中输入

```bash
export http_proxy=http://127.0.0.1:1087
export https_proxy=$http_proxy
```

终端即可调用`http_proxy`,`https_proxy` 这两个环境变量进行代理

### 取消代理

若要取消代理

```bash
unset http_proxy https_proxy
```

###  具体效果

代理效果可以`curl ip.gs`查看

```bash
curl ip.gs ### ip.gs无法访问
curl ip.sb
```

##### 代理前

![](https://ws3.sinaimg.cn/large/006tKfTcly1fi3jreoeskj30uu0970vs.jpg)

##### 代理后

![](https://ws3.sinaimg.cn/large/006tKfTcly1fi3jtx9nzgj30uq09c788.jpg)