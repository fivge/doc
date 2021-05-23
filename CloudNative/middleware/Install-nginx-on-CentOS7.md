---
title: Install nginx on CentOS7
date: 2017-07-28 20:34:00
tags:
  - Server
  - CentOS
  - nginx
---

CentOS 中无法直接安装 nginx.

```bash
yum install epel-release
```

安装 EPEL repository 后扔无法安装 nginx

```bash
rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum install nginx
```

在`/etc/yum.repos.d/` 目录中多了个名为`nginx.repo` 的文件
