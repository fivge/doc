---
title: mysql更改root密码
date: 2017-07-08 22:51:09
tags:
- Server
- mysql
---

> ### 问题描述

在尝试登陆mysql时,无法登陆,提示:

```shell
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
```

![](https://ws4.sinaimg.cn/large/006tNc79ly1fhcv7tb680j30rp02eaab.jpg)

若不加`-p`参数,`using password: NO`

而其他账户可以登陆

故更改root密码

> ### 解决方案

#### 1. 更新mysql密码

```shell
➜  ~ mysqladmin -u root password  1234
mysqladmin: connect to server at 'localhost' failed
error: 'Access denied for user 'root'@'localhost' (using password: NO)'
```

![](https://ws2.sinaimg.cn/large/006tNc79ly1fhcvf69vxwj30mc02eglw.jpg)

*失败*

#### 2. 进入安全模式

```shell
systemctl stop mariadb
mysqld_safe --skip-grant-tables    ### 持续运行
mysql -u root
```

```mysql
UPDATE mysql.user SET Password=PASSWORD('password') WHERE User='root';   ### password 即为设置的密码
```

```shell
systemctl start mariadb
```

密码更改成功



### 参考链接

+ https://stackoverflow.com/questions/21944936/error-1045-28000-access-denied-for-user-rootlocalhost-using-password-y