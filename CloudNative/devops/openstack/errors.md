---
title: OpenStack环境配置
---



### 0x01 配置网络

配置两个网络,一个是管理网络10.0.0.0/24,另一个可访问外部网络.

配置hosts,`/etc/hosts`

```
# controller
10.0.0.11       controller

# compute1
10.0.0.31       compute1

# .....
```

### 0x02 Controller

>  网络时间协议(NAT)

你应该安装Chrony，一个在不同节点同步服务实现 :term:[`](https://docs.openstack.org/mitaka/zh_CN/install-guide-ubuntu/environment-ntp.html#id1)NTP`的方案。我们建议你配置控制器节点引用更准确的(lower stratum)NTP服务器，然后其他节点引用控制节点。

```sh
apt-get install chrony
vim /etc/chrony/chrony.conf 
```

```
server NTP_SERVER iburst
```

使用NTP服务器的主机名或者IP地址替换 `NTP_SERVER` 。配置支持设置多个 `server` 值。

控制节点默认跟公共服务器池同步时间。但是你也可以选择性配置其他服务器，比如你组织中提供的服务器。

```sh
 service chrony restart
```



### 0x03 Computer

>  网络时间协议(NAT)

<http://www.pool.ntp.org/zone/cn>

```
apt-get install chrony
```

编辑``/etc/chrony/chrony.conf`` 文件并注释除``server`` 值外的所有内容。修改它引用控制节点：

```
server controller iburst

```

重启 NTP 服务

```
# service chrony restart
```

我们建议您在继续进一步的操作之前验证 NTP 的同步。有些节点，特别是哪些引用了控制节点的，需要花费一些时间去同步。

+ 验证

1. 在控制节点上执行这个命令：

   ```
   # chronyc sources
     210 Number of sources = 2
     MS Name/IP address         Stratum Poll Reach LastRx Last sample
     ===============================================================================
     ^- 192.0.2.11                    2   7    12   137  -2814us[-3000us] +/-   43ms
     ^* 192.0.2.12                    2   6   177    46    +17us[  -23us] +/-   68ms

   ```

   在 *Name/IP address* 列的内容应显示NTP服务器的主机名或者IP地址。在 *S* 列的内容应该在NTP服务目前同步的上游服务器前显示 ***。

2. 在所有其他节点执行相同命令：

   ```
   # chronyc sources
     210 Number of sources = 1
     MS Name/IP address         Stratum Poll Reach LastRx Last sample
     ===============================================================================
     ^* controller                    3    9   377   421    +15us[  -87us] +/-   15ms
   ```

   在 *Name/IP address* 列的内容应显示控制节点的主机名。




### KeyStone

数据库设置

同步 nova / keystone 数据库时

![](https://ws2.sinaimg.cn/large/006tNc79ly1fh9fyt0lybj31h90d2ag0.jpg)

```sql
ALTER SCHEMA keystone DEFAULT CHARACTER SET utf8 ;
```

 flush privileges

### mariadb~~(未解决)~~

~~computer 无法连接 controller 的`3306`端口~~



### Glance

镜像服务



---

```
Caused by: com.rabbitmq.client.AuthenticationFailureException: ACCESS_REFUSED - Login was refused using authentication mechanism PLAIN. For details see the



```







### NOVA



- [x] nova-api


- [x] nova-conductor


- [x] nova-consoleauth
- [x] nova-manage
- [ ] nova-novncproxy
- [x] nova-scheduler 


---

rabbitmqctl list_permissions 

---



### mongo

![](https://ws2.sinaimg.cn/large/006tKfTcly1fhfxvohqkdj30td073q45.jpg)

https://docs.mongodb.com/manual/reference/method/db.createUser/#create-administrative-user-with-roles

```shell
mongo --host controller --eval '
  db = db.getSiblingDB("ceilometer");
  db.addUser({user: "ceilometer",
  pwd: "1234",
  roles: [ "readWrite", "dbAdmin" ]})'

```

to

```
mongo --host controller --eval '
db = db.getSiblingDB("ceilometer");  
db.createUser({user: "ceilometer",
pwd: "1234",
roles: [ "readWrite", "dbAdmin" ]})'
```



---

➜  local ll

total 52K

-rw-rw-r-- 1 root root    0 3月  20 22:45 _build_horizon-j0U_ef_horizon-11.0.1_openstack_dashboard_local_.secret_key_store.lock

drwxr-xr-x 2 root root 4.0K 7月   9 19:01 enabled

-rw-r--r-- 1 root root    0 3月  11 04:49 __init__.py

-rw-r--r-- 1 root root  155 7月   9 19:01 __init__.pyc

drwxr-xr-x 2 root root 4.0K 7月   9 18:58 local_settings.d

lrwxrwxrwx 1 root root   42 3月  20 22:45 local_settings.py -> /etc/openstack-dashboard/local_settings.py

-rw-r--r-- 1 root root 5.5K 7月   9 19:01 local_settings.pyc

-rw-r--r-- 1 root root  32K 3月  20 22:45 local_settings.py.example

➜  local 

➜  local pwd

/usr/share/openstack-dashboard/openstack_dashboard/local

➜  local ls     

_build_horizon-j0U_ef_horizon-11.0.1_openstack_dashboard_local_.secret_key_store.lock  __init__.py   local_settings.d   local_settings.pyc

enabled                                                                                __init__.pyc  local_settings.py  local_settings.py.example

➜  local rm -rf _build_horizon-j0U_ef_horizon-11.0.1_openstack_dashboard_local_.secret_key_store.lock 

➜  local ls

enabled  __init__.py  __init__.pyc  local_settings.d  local_settings.py  local_settings.pyc  local_settings.py.example

---

访问controller/horizon出错500：internal server error

访问controller/horizon出错504：internal server error  gateway timeout

 

 

解决方案：

 

```
WSGIApplicationGroup %{GLOBAL}

```

把上面这行添加到/etc/apache2/conf-available/openstack-dashboard.conf



---

### free -m 

ps auxw|head -1;ps auxw|sort -rn -k4|head -20 

```shell
ps auxw|head -1;ps auxw|sort -rn -k4|head -20 
```

---

### Network

控制节点与计算节点的网络无法连接

只有控制节点的代理



![](https://ws3.sinaimg.cn/large/006tKfTcly1fhjmipl32fj30u20tyjt4.jpg)



---

```shell
openstack image list
```

