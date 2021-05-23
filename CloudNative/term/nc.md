### nc

> nc -- arbitrary TCP and UDP connections and listens

```bash
# To open a TCP connection to port 42 of host.example.com, using port 31337 as the source port, with a timeout of 5 seconds:
nc -p 31337 -w 5 host.example.com 42

# To open a UDP connection to port 53 of host.example.com:
nc -u host.example.com 53

# To open a TCP connection to port 42 of host.example.com using 10.1.2.3 as the IP for the local end of the connection:
nc -s 10.1.2.3 host.example.com 42

# To create and listen on a UNIX-domain stream socket:
nc -lU /var/tmp/dsocket

# To connect to port 42 of host.example.com via an HTTP proxy at 10.2.3.4, port 8080. This example could also be used by ssh(1); see the ProxyCommand directive in ssh_config(5) for more information.
nc -x10.2.3.4:8080 -Xconnect host.example.com 42

# The same example again, this time enabling proxy authentication with username "ruser" if the proxy requires it:
nc -x10.2.3.4:8080 -Xconnect -Pruser host.example.com 42

# To choose the source IP for the testing using the -s option
nc -zv -s source_IP target_IP Port
```

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

#### example

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

#### 参考链接

<https://linux.cn/article-9190-1.html>
