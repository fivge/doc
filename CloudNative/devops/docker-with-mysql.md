### Docker

<https://yeasy.gitbooks.io/docker_practice/content/introduction/what.html>

```shell
docker search ubuntu   ### 查找镜像
docker pull ubuntu     ### 安装镜像
docker images / docker image ls    ### 列出镜像
docker image rm +id    ### 删除镜像
```

```shell
docker run <image id>  -i -t /bin/bash  # -i 同步输入  -t 同步输出 -d 持续运行
```

### mysql

> ######安装

```shell
docker pull hub.c.163.com/library/mysql:latest
```

> ###### 使用

```shell
mkdir -p ~/mysql/data

docker run -p 3306:3306 --name mysql -v ~/mysql/data/:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=1234 -d hub.c.163.com/library/mysql:latest
```

<https://www.jianshu.com/p/d9b6bbc7fd77>

> ###### 容器内访问

```shell
docker exec -it mysql bash
```

### mycli

> A Terminal Client for MySQL with AutoCompletion and Syntax Highlighting.

```shell
brew install mycli
```

<https://github.com/dbcli/mycli>

> ###### 连接数据库

```shell
mycli -h localhost -p 3306 -u root -p 1234
```

> ###### 效果图

![](https://ws3.sinaimg.cn/large/006tNc79ly1fn3jw2q8caj31ez0eqwgt.jpg)

### Connector to asp.net

<https://dev.mysql.com/downloads/connector/net/>

<https://dev.mysql.com/doc/connector-net/en/connector-net-installation-unix.html>

```shell
gacutil /i MySql.Data.dll
```

<http://lazynight.me/2612.html>

<https://stackoverflow.com/questions/43263509/asp-net-core-how-to-create-a-connectionstring-on-macbook-pro/43267227>

### lamp

```shell
docker run -itd -p 8989:80 -p 3306:3306 --name lamp -v ~/Docker/lamp:/var/www/html 14e0318d2c44

docker run -d -p 8080:80 -p 3306:3306 tutum/lamp
#启动应用并映射 8080 端口和 3306 端口


docker run -p 3306:3306 --name mysql -v ~/mysql/data/:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=1234 -d hub.c.163.com/library/mysql:latest

```

### mysql error

```shell
[root@localhost ~]# mysql -u root -h 172.17.0.2 -p123456
ERROR 1130 (HY000): Host '172.17.0.1' is not allowed to connect to this MySQL server
出现错误的原因：
容器的网络ip是根据宿主机的虚拟桥接网卡docker0自动分配的，而docker0的ip默认是172.17.0.1.
容器的mysql内需要给这个ip授权。
[root@localhost ~]# ifconfig
docker0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 0.0.0.0
..........

登陆容器内的mysql，进行授权
[root@a02f56c3e731 /]# /usr/local/mysql/bin/mysql -p123456
.......
mysql> select host,user,password from mysql.user;
+--------------+------+-------------------------------------------+
| host         | user | password                                  |
+--------------+------+-------------------------------------------+
| localhost    | root | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
| 2ccd29e52286 | root |                                           |
| 127.0.0.1    | root |                                           |
| ::1          | root |                                           |
| localhost    |      |                                           |
| 2ccd29e52286 |      |                                           |
+--------------+------+-------------------------------------------+
6 rows in set (0.00 sec)

mysql> grant all privileges on *.* to root@'%' identified by "123456";
Query OK, 0 rows affected (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.00 sec)

mysql> select host,user,password from mysql.user;
+--------------+------+-------------------------------------------+
| host         | user | password                                  |
+--------------+------+-------------------------------------------+
| localhost    | root | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
| 2ccd29e52286 | root |                                           |
| 127.0.0.1    | root |                                           |
| ::1          | root |                                           |
| localhost    |      |                                           |
| 2ccd29e52286 |      |                                           |
| %            | root | *6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9 |
+--------------+------+-------------------------------------------+
8 rows in set (0.00 sec)

再次在宿主机本机尝试连接容器的mysql，发现可以正常连接！
[root@localhost ~]# mysql -u root -h 172.17.0.2 -p123456
```

<http://www.cnblogs.com/kevingrace/p/6425424.html>

### mysql

> ### 更改密码

```shell
用UPDATE直接编辑user表

mysql -u root

mysql> use mysql;

mysql> UPDATE user SET Password = PASSWORD('newpass') WHERE user = 'root';

mysql> FLUSH PRIVILEGES;
```
