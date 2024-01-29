---
title: 防火墙基础篇
date: 2016-10-15 21:21:46
tags:
  - Server
  - Firewall
---

> 待了解

- wheel
- D-bus
- NetworkManager
- Panic

---

> 安装,使用&禁用防火墙

- 安装防火墙

```shell
yum install firewalld
# firewall-config 图形界面
```

- 启用&禁用防火墙

```shell

systemctl start firewalld
systemctl enabled firewalld

systemctl disable firewalld
systemctl stop firewalld
```

- 查看状态

```shell
systemctl status firewalld
```

- 检查 firewall-cmd 是否可以通过输入以下命令来连接后台程序

```shell
firewall-cmd --state
```

> 了解防火墙

由 firewalld 提供的是动态的防火墙服务，而非静态的。因为配置的改变可以随时随地立刻执行，不再需要保存或者执行这些改变。现行网络连接的意外中断不会发生，正如防火墙的所有部分都不需要重新下载。

**`firewall-cmd` 命令可以由 root 用户运行，也可以由管理员用户——换言之， wheel 群体的成员运行。**在后一种情况里，命令将通过 `polkit` 进程来授权。

`firewalld` 的配置储存在`/usr/lib/firewalld/` 和 `/etc/firewalld/` 里的各种 XML 文件里，这样保持了这些文件被编辑、写入、备份的极大的灵活性，使之可作为其他安装的备份等等。

其他应用程序可以使用 `D-bus` 和 `firewalld` 通信。

> 比较 system-config-firewall 以及 iptables 的 firewalld

总结就是`system-config-firewall`比`iptables`好

> 对网络区的理解

基于用户对网络中设备和交通所给与的信任程度，防火墙可以用来将网络分割成不同的区域。 NetworkManager 通知 firewalld 一个接口归属某个区域。接口所分配的区域可以由 NetworkManager 改变，也可以通过能为您打开相关 NetworkManager 窗口的 firewall-config 工具进行。
在/etc/firewalld/的区域设定是一系列可以被快速执行到网络接口的预设定。列表并简要说明如下：

- drop（丢弃）

  任何接收的网络数据包都被丢弃，没有任何回复。仅能有发送出去的网络连接。

* block（限制）

  任何接收的网络连接都被 IPv4 的 icmp-host-prohibited 信息和 IPv6 的 icmp6-adm-prohibited 信息所拒绝。

- public（公共）

  **在公共区域内使用，不能相信网络内的其他计算机不会对您的计算机造成危害，只能接收经过选取的连接。**

* external（外部）

  特别是为路由器启用了伪装功能的外部网。您不能信任来自网络的其他计算，不能相信它们不会对您的计算机造成危害，只能接收经过选择的连接。

- dmz（非军事区）

  用于您的非军事区内的电脑，此区域内可公开访问，可以有限地进入您的内部网络，仅仅接收经过选择的连接。

* work（工作）

  用于工作区。您可以基本相信网络内的其他电脑不会危害您的电脑。仅仅接收经过选择的连接。

* home（家庭）

  用于家庭网络。您可以基本信任网络内的其他计算机不会危害您的计算机。仅仅接收经过选择的连接。

* internal（内部）

  用于内部网络。您可以基本上信任网络内的其他计算机不会威胁您的计算机。仅仅接受经过选择的连接。

- trusted（信任）

  可接受所有的网络连接。

指定其中一个区域为默认区域是可行的。当接口连接加入了 NetworkManager，它们就被分配为默认区域。**安装时，firewalld 里的默认区域被设定为公共区域。**

> 预先定义的服务

默认的预先定义服务 `/usr/lib/firewalld/services/`

系统或者用户创建的系统`/etc/firewalld/services/`

**请勿编辑/usr/lib/firewalld/services/ ，只有 /etc/firewalld/services/ 的文件可以被编辑。**

编辑 /etc/firewalld/services/ 中的 XML 文件，服务可以被增加和删除。如果服务没有被用户增加或者改变，那么 /etc/firewalld/services/ 中不会发现相应的 XML 文件。如果您希望增加或者改变服务， /usr/lib/firewalld/services/ 文件可以作为模板使用。

**firewalld 优先使用 /etc/firewalld/services/ 里的文件，如果一份文件被删除且服务被重新加载后，会切换到 /usr/lib/firewalld/services/。**

> 用命令行工具 firewall-cmd 配置防火墙

```shell
firewall-cmd --version
firewall-cmd --help
```

**为了设置一个永久或者可执行命令，除了 --direct 命令（它们本质上是暂时的）之外，要向所有命令添加 --permanent 选择。注意，这不只是意味着永久更改，而且更改将仅仅在防火墙重新加载、服务器重启或者系统重启之后生效。用 firewall-cmd 设置的缺少 --permanent 选项的设定能立即生效，但是它仅仅在下次防火墙重新加载、系统启动或者 firewalld 服务重启之前可用。防火墙不会在断开连接时重新加载，而会提示您通过重新加载，放弃临时更改。**

##### 查看防火墙设置

输入以下命令，得到 firewalld 的状态的文本显示：

```shell
firewall-cmd --state
```

输入以下命令，查看活动分区的列别，并附带一个目前分配给它们的接口列表：

```shell
firewall-cmd --get-active-zones
```

输入以下命令，找出当前分配了接口（例如 em1）的区域：

```shell
firewall-cmd --get-zone-of-interface=em1

public
```

以 root 身份输入以下命令，找出分配给一个区域（例如公共区域）的所有接口：

```shell
firewall-cmd --zone=public --list-interfaces

em1 wlan0
```

从 NetworkManager 可以得到这个信息，并且仅显示接口而非连接。
以 root 用户身份输入以下命令，找出像公共区域这样的一个区域的所有设置：

```shell
firewall-cmd --zone=public --list-all

public
  interfaces:
  services: mdns dhcpv6-client ssh
  ports:
  forward-ports:
  icmp-blocks: source-quench
```

以 root 身份输入以下命令，查看目前活动的网络区域：

```shell
firewall-cmd --get-service

cluster-suite pop3s bacula-client smtp ipp radius bacula ftp mdns samba dhcpv6-client dns openvpn imaps samba-client http https ntp vnc-server telnet libvirt ssh ipsec ipp-client amanda-client tftp-client nfs tftp libvirt-tls
```

这样将列出 `/usr/lib/firewalld/services/` 中的服务器名称。注意，配置文件是以服务本身命名的 `service-name.xml`。
以 root 身份输入以下命令，查看所有在防火墙下次加载后将活跃的网络区域：

```shell
firewall-cmd --get-service --permanent
```

##### 更改防火墙设置

###### 1. 终止所有数据包（Panic 模式）

```shell
# 开始终止所有输入和输出的数据包
firewall-cmd --panic-on
# 开始再次传输输入和输出的数据包
firewall-cmd --panic-off
# 确定 panic 模式被使用或者禁用: 如果在运行模式，屏幕会显示 yes，退出状态为 0，如果被启用，屏幕会显示 no，退出状态为 0。
firewall-cmd --query-panic
```

###### 2.重新加载防火墙

- 重新加载防火墙，并不中断用户连接，即不丢失状态信息

  ```shell
  firewall-cmd --reload
  ```

* 重新加载防火墙并中断用户连接，即丢弃状态信息

  ```shell
  firewall-cmd --complete-reload
  ```

  通常在防火墙出现严重问题时，这个命令才会被使用。比如，防火墙规则是正确的，但却出现状态信息问题和无法建立连接。

###### 3. 为分区增加接口

要为一个分区增加接口，比如，把 em1 增加到公共分区

```shell
 firewall-cmd --zone=public --add-interface=em1 --permanent
```

###### 4.设置默认分区

以 root 用户身份输入以下命令来设置默认分区，比如设置为公共区域

```shell
firewall-cmd --set-default-zone=public
```

**这个更改将立刻生效，而且在此情况下不需要重新加载防火墙**

###### 5.打开防火墙的端口

通过以 root 身份输入以下命令，列出一个区域，例如 `public` 的所有开放端口

```shell
firewall-cmd --zone=public --list-ports
```

要将一个端口加入一个分区，例如，允许 TCP 的流量通过端口 8080 的 进入`public`分区，则以 root 身份输入以下命令：

```shell
firewall-cmd --zone=public --add-port=8080/tcp --permanent
```

要将一系列端口加入一个分区，比如允许从 5060 到 5061 的端口都接入公共分区，则以 root 身份输入以下命令：

```shell
firewall-cmd --zone=public --add-port=5060-5061/udp
```

增加 --permanent 选项并重新加载防火墙，使之成为永久性设置。

###### 6.将一个服务加入到分区

```shell
firewall-cmd --zone=work --add-service=smtp --permanent
```

###### 7.从一个分区移除服务

```shell
firewall-cmd --zone=work --remove-service=smtp --permanent
```

###### 8.配置伪装 IP 地址

1. 检查

```shell
firewall-cmd --zone=external --query-masquerade
```

如果可用，屏幕会显示 yes，退出状态为 0； 否则，屏幕显示 no，退出状态为 1。如果省略 zone ，默认区域将被使用。

2. 允许伪装 IP

```shell
firewall-cmd --zone=external --add-masquerade --permanent
```

3. 禁用伪装 IP

```shell
firewall-cmd --zone=external --remove-masquerade --permanent
```

###### 9. 配置端口转发

1. 要将进入网络的程序包从一个端口转发到一个替代端口或者地址，首先需以 root 身份输入以下命令来为一个区域（比如外部区域），运行伪装 IP 地址

```shell
firewall-cmd --zone=external --add-masquerade
```

2. 以 root 身份输入以下命令，把程序包转发到一个本地端口，即相同系统上的一个端口

```shell
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=3753
```

在这个例子里，本来要送到 22 端口的程序包现在被转发到 3753 端口。源目的端口用 port 选项指定。这个选项可以是一个端口，或者一组端口范围并加上协议。如果指定协议的话，这个协议必须是 tcp 或 udp。这个新的本地端口，即流量被转发过去的端口或者端口范围，需用 toport 选项指定。

3. 以 root 身份输入以下命令，不改变目的端口将程序包转发到另一个通常是内部地址的 IPv4 地址

```shell
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toaddr=192.0.2.55
```

在这个示例中，原本发往 22 端口的程序包现在被转发到相同的端口，地址则由 toaddr 提供。源目的地端口用 port 指定。这个选项可能是一个端口，或者一组端口范围并加上协议。如果被指定，协议必须是 tcp 或 udp 中的一个。这个新端口，即流量被转发过去的端口或者端口范围，用 toport 指定。

4. 以 root 身份输入以下命令，把程序包转发到通常是内部地址的另一个 IPv4 地址

```shell
firewall-cmd --zone=external --add-forward-port=port=22:proto=tcp:toport=2055:toaddr=192.0.2.55
```

在这个示例中，原本发往 22 端口的程序包现在被转发到和 toaddr 选项一起给出地址的 2055 端口。源目的端口用 port 选项指定。这个选项可以是一个端口，或者打包了协议的端口范围。如果被指定，这个协议一定是 tcp 或 udp 中的一个。这个新的目的端口，即流量被转发过去的端口或者端口范围，用 toport 指定。

增加 `--permanent` 选项并重新加载防火墙，使这些设置永久保留。

---

总结：

- 安装防火墙

  ```shell
  yum install firewalld firewall-config
  ```

* 启用防火墙

  ```shell
  systemctl satrt firewalld
  systemctl enabled firewalld
  ```

* 查看状态

  ```shell
  systemctl status firewalld
  firewall-cmd state
  ```

* 查看端口启用情况

  ```shell
  firewall-cmd --list-ports
  ```

* 启用端口

  ```shell
  firewall-cmd --zone=public --add-port=8080/tcp --permanent
  firewall-cmd --zone=public --add-port=23333/tcp --permanent
  firewall-cmd --zone=public --add-port=443/tcp --permanent
  ```

- 重新加载防火墙(不丢失用户信息)

  ```shell
  firewall-cmd --reload
  ```

---

参考文章：

1. [红帽企业版 LINUX 7 安全性指南](https://access.redhat.com/documentation/zh-CN/Red_Hat_Enterprise_Linux/7/html/Security_Guide/sec-Using_Firewalls.html#sec-Comparison_of_Firewalld_to_system-config-firewall_and_iptables)
