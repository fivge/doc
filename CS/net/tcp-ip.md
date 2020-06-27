> TCP 三次握手与四次挥手

![](https://raw.githubusercontent.com/fivge/hexo-pic/master/2020/20200624184412.png)

| Name           | Description                                                                                                                                                                                                                                                                                                                                                                                             |
| :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Blocked        | Time spent in a queue waiting for a network connection.The browser imposes a limit on the number of simultaneous connections that can be made to a single server. In Firefox this defaults to 6, but can be changed using the `network.http.max-persistent-connections-per-server` preference. If all connections are in use, the browser can't download more resources until a connection is released. |
| DNS resolution | Time taken to resolve a host name.                                                                                                                                                                                                                                                                                                                                                                      |
| Connecting     | Time taken to create a TCP connection.                                                                                                                                                                                                                                                                                                                                                                  |
| Sending        | Time taken to send the HTTP request to the server.                                                                                                                                                                                                                                                                                                                                                      |
| Waiting        | Waiting for a response from the server.                                                                                                                                                                                                                                                                                                                                                                 |
| Receiving      | Time taken to read the entire response from the server (or cache).                                                                                                                                                                                                                                                                                                                                      |

![](https://raw.githubusercontent.com/fivge/hexo-pic/master/2020/20200624151109.png)

`req`

```http
GET / HTTP/1.1
Host: localhost:3000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0
Accept: application/json, text/plain, */*
Accept-Language: zh-CN,en-US;q=0.5
Accept-Encoding: gzip, deflate
Authorization: fake-user-token
Origin: http://localhost:3001
Connection: keep-alive
Referer: http://localhost:3001/
Pragma: no-cache
Cache-Control: no-cache
```

`res`

```http
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: *
Access-Control-Allow-Headers: Content-Type, Content-Length, Authorization, Accept, X-Requested-With
Access-Control-Allow-Methods: PUT, POST, GET, DELETE, OPTIONS
Access-Control-Max-Age: 1728000
Content-Type: application/json; charset=utf-8
Content-Length: 13
ETag: W/"d-pedE0BZFQNM7HX6mFsKPL6l+dUo"
Date: Wed, 24 Jun 2020 11:13:21 GMT
Connection: keep-alive
```

##### 三次握手

所谓三次握手(Three-way Handshake)，是指建立一个 TCP 连接时，需要客户端和服务器总共发送 3 个包。

三次握手的目的是连接服务器指定端口，建立 TCP 连接，并同步连接双方的序列号和确认号，交换 TCP 窗口大小信息。在 socket 编程中，客户端执行 `connect()` 时。将触发三次握手。

- 第一次握手(SYN=1, seq=x):

  客户端发送一个 TCP 的 SYN 标志位置 1 的包，指明客户端打算连接的服务器的端口，以及初始序号 X,保存在包头的序列号(Sequence Number)字段里。

  发送完毕后，客户端进入 `SYN_SEND` 状态。

- 第二次握手(SYN=1, ACK=1, seq=y, ACKnum=x+1):

  服务器发回确认包(ACK)应答。即 SYN 标志位和 ACK 标志位均为 1。服务器端选择自己 ISN 序列号，放到 Seq 域里，同时将确认序号(Acknowledgement Number)设置为客户的 ISN 加 1，即 X+1。 发送完毕后，服务器端进入 `SYN_RCVD` 状态。

- 第三次握手(ACK=1，ACKnum=y+1)

  客户端再次发送确认包(ACK)，SYN 标志位为 0，ACK 标志位为 1，并且把服务器发来 ACK 的序号字段+1，放在确定字段中发送给对方，并且在数据段放写 ISN 的+1

  发送完毕后，客户端进入 `ESTABLISHED` 状态，当服务器端接收到这个包时，也进入 `ESTABLISHED` 状态，TCP 握手结束。

##### KeepAlive

TCP KeepAlive 的基本原理是，隔一段时间给连接对端发送一个探测包，如果收到对方回应的 ACK，则认为连接还是存活的，在超过一定重试次数之后还是没有收到对方的回应，则丢弃该 TCP 连接。

[TCP-Keepalive-HOWTO](http://www.tldp.org/HOWTO/html_single/TCP-Keepalive-HOWTO/) 有对 TCP KeepAlive 特性的详细介绍，有兴趣的同学可以参考。这里主要说一下，TCP KeepAlive 的局限。首先 TCP KeepAlive 监测的方式是发送一个 probe 包，会给网络带来额外的流量，另外 TCP KeepAlive 只能在内核层级监测连接的存活与否，而连接的存活不一定代表服务的可用。例如当一个服务器 CPU 进程服务器占用达到 100%，已经卡死不能响应请求了，此时 TCP KeepAlive 依然会认为连接是存活的。因此 TCP KeepAlive 对于应用层程序的价值是相对较小的。需要做连接保活的应用层程序，例如 QQ，往往会在应用层实现自己的心跳功能。

##### 四次挥手

TCP 的连接的拆除需要发送四个包，因此称为四次挥手(Four-way handshake)，也叫做改进的三次握手。客户端或服务器均可主动发起挥手动作，在 socket 编程中，任何一方执行 `close()` 操作即可产生挥手操作。

- 第一次挥手(FIN=1，seq=x)

  假设客户端想要关闭连接，客户端发送一个 FIN 标志位置为 1 的包，表示自己已经没有数据可以发送了，但是仍然可以接受数据。

  发送完毕后，客户端进入 `FIN_WAIT_1` 状态。

- 第二次挥手(ACK=1，ACKnum=x+1)

  服务器端确认客户端的 FIN 包，发送一个确认包，表明自己接受到了客户端关闭连接的请求，但还没有准备好关闭连接。

  发送完毕后，服务器端进入 `CLOSE_WAIT` 状态，客户端接收到这个确认包之后，进入 `FIN_WAIT_2` 状态，等待服务器端关闭连接。

- 第三次挥手(FIN=1，seq=y)

  服务器端准备好关闭连接时，向客户端发送结束连接请求，FIN 置为 1。

  发送完毕后，服务器端进入 `LAST_ACK` 状态，等待来自客户端的最后一个 ACK。

- 第四次挥手(ACK=1，ACKnum=y+1)

  客户端接收到来自服务器端的关闭请求，发送一个确认包，并进入 `TIME_WAIT`状态，等待可能出现的要求重传的 ACK 包。

  服务器端接收到这个确认包之后，关闭连接，进入 `CLOSED` 状态。

  客户端等待了某个固定时间（两个最大段生命周期，2MSL，2 Maximum Segment Lifetime）之后，没有收到服务器端的 ACK ，认为服务器端已经正常关闭连接，于是自己也关闭连接，进入 `CLOSED` 状态。

---

应用层 传输层 网络互连层 网络链接层

**“传输层”的功能，就是建立“端口到端口”之间的通信。相比之下，“网络层”的功能是建立“主机到主机"的通信。**

---

需要将 The Connection 首部的值设置为 "keep-alive" 这个首部才有意义。同时需要注意的是，在 HTTP/2 协议中， Connection 和 Keep-Alive 是被忽略的；在其中采用其他机制来进行连接管理。

https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Connection_management_in_HTTP_1.x
