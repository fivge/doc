---
title: rm -rf /etc/shadow*
date: 2016-09-27 00:04:34
tags:
  - linux
  - shadow
---

### rm -rf /etc/shadow\*

安装 shadowsocks 时遇到十分尴尬的事情

安装 shadowsocks 时，装了好几次都没有成功.以为是配置文件哪里不对，就删了配置文件(rm -rf /etc/shadow\*).

结果第二天，ssh 死活连接不上，无奈从管理端重置了 root 密码才登上

然后各种搜索，发现一条神奇的命令

```bash
pwconv
```

虽然密码不能全部找回，但可以更改密码了

```
passwd ghost
```

这样就恢复 shadow 文件了
