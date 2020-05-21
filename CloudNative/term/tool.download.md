---
title: 终端下载工具
date: 2018-04-23 23:13:09
tags:
  - Term
categories:
  - Term
---

### 终端下载工具

- Aria2
- wget
- curl
- axel

<!--more-->

##### aria2

<https://aria2.github.io>

```bash
aria2c http://

```

在初始化下载的时候，我们可以使用 `-o`（小写）选项在保存文件的时候使用不同的名字。这儿我们将要使用 owncloud.zip 文件名来保存文件。

```
# aria2c -o owncloud.zip https://download.owncloud.org/community/owncloud-9.0.0.tar.bz2
```

##### 参考链接

<https://linux.cn/article-7982-1.html>
