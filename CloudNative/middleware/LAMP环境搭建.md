---
title: LAMP环境搭建
date: 2018-01-10 15:47:06
tags:
- Server
- linux
- LAMP
---

### LAMP环境搭建

<http://www.cnblogs.com/mingc/p/7864030.html>

##### linux

##### apache

```bash
sudo apt-get install apache2
```

##### mysql

```bash
sudo apt-get install mysql-server
```

##### php

```bash
sudo apt-get install php7.1 php7.1-dev
```

> #####  PHP 连接测试脚本

```php
<?php
$link=mysql_connect('localhost','root','');
if ($link)
echo "successfu";
else
echo "Faile";
mysql_close();
?>
```

### errors

##### 无法连接数据库

```bash
Fatal error: Call to undefined function mysql_connect()
```

```bash
sudo apt-get install php5-mysql
sudo apt-get install mysql-server
```