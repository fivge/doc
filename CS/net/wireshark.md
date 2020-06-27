tcp.stream eq 1

> eq ==
> or ||
> and &&
> dst src

> - 等号可以用 eq 替代，如 ip.dst eq 10.10.10.10
> - dst 表示过滤目标 ip, src 表示过滤来源 ip, addr 则同时过滤两者；
> - or 操作符可以同时使用多条过滤规则，如 ip.dst==10.10.10.10 or ip.dst=10.10.10.11

### 过滤 ip

ip.dst==10.10.10.10
ip.src==10.10.10.10
ip.addr==10.10.10.10

### 过滤 端口

tcp.port==80
tcp.dstport==80
tcp.srcport==80

tcp.dstport == 3000 || tcp.srcport == 3000

### 协议过滤

直接在过滤框输入协议名即可。如 http, tcp, udp, ftp 等

### http 模式过滤

http.host=="[www.baidu.com](https://link.jianshu.com?t=http://www.baidu.com)"
http.uri=="/img/logo-edu.gif"
http.request.method=="GET"
http.request.method=="POST"
http contains "baidu"
