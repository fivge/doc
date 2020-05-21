---
title: 防火墙高级篇
date: 2016-10-17 00:13:34
tags:
  - Server
  - Firewall
---

> 理解直接接口

firewalld 有一个被称为 “direct interface”（直接接口），它可以直接通过 iptables、ip6tables 和 ebtables 的规则。它适用于应用程序，而不是用户。如果您不太熟悉 iptables，那么使用直接接口是很危险的，因为您可能无意中导致防火墙被入侵。firewalld 保持对所增加项目的追踪，所以它还能质询 firewalld 和发现由使用直接端口模式的程序造成的更改。直接端口由增加 --direct 选项到 firewall-cmd 命令来使用。
直接端口模式适用于服务或者程序，以便在运行时间内增加特定的防火墙规则。这些规则不是永久性的，它们需要在每次通过 D-BU S 从 firewalld 接到启动、重新启动和重新加载信息后运用

> 使用直接接口

通过 firewall-cmd 工具，可以使用 --direct 选项在运行时间里增加或者移除链。
直接端口模式适用于服务或者程序，以便在运行时间内增加特定的防火墙规则。这些规则不是永久性的，它们需要在每次通过 D-BU S 从 firewalld 接到启动、重新启动和重新加载信息后运用。

###### 1.使用直接接口增加一个自定义规则

以 root 身份按照以下格式发布一个命令，增加一个自定义规则到 “IN_public_allow” 链里

```shell
firewall-cmd --direct --add-rule ipv4 filter IN_public_allow 0 -m tcp -p tcp --dport 666 -j ACCEPT
```

###### 2. 用直接接口移除一个自定义规则

以 root 用户身份按照以下格式发布一个命令，从 “IN_public_allow” 链移除一个自定义规则

```shell
firewall-cmd --direct --remove-rule ipv4 filter IN_public_allow 0 -m tcp -p tcp --dport 666 -j ACCEPT
```

###### 3. 用直接接口列出自定义规则

以 root 用户身份按照以下格式发布一个命令，列出 “IN_public_allow” 链中的规则

```shell
firewall-cmd --direct --get-rules ipv4 filter IN_public_allow
```

> 给复杂防火墙规则配置“Rich Language" 语法

通过 `rich language` 语法，可以用比直接接口方式更易理解的方法建立复杂防火墙规则。此外，还能永久保留设置。这种语言使用关键词值，是 iptables 工具的抽象表示。这种语言可以用来配置分区，也仍然支持现行的配置方式。

###### 1. 多语言命令的格式

_在这个部分，所有命令都必须以 root 用户身份运行。_

1. 增加一项规则的命令格式如下

```shell
firewall-cmd [--zone=zone] --add-rich-rule='rule' [--timeout 9=seconds]
```

这样将为 zone 分区增加一项多语言规则 rule 。这个选项可以多次指定。如果分区被省略，将使用默认分区。如果出现超时，规则将在指定的秒数内被激活，并在之后被自动移除。

2. 移除一项规则

firewall-cmd [--zone=zone] --remove-rich-rule='rule'
这将为 zone 分区移除一项多语言规则 （rule） 。这个选项可以多次指定。如果分区被省略，将使用默认分区。

3. 检查一项规则是否存在

```shell
firewall-cmd [--zone=zone] --query-rich-rule='rule'
```

这将复查是否已经为区域（zone） 增加一个多语言规则 （rule） 。如果可用，屏幕会显示 yes，退出状态为 0； 否则，屏幕显示 no，退出状态为 1。如果省略 zone，默认区域将被使用。

###### 2. 理解多规则结构

多规则命令的格式或结构如下所示：

```
rule [family="<rule family>"]
    [ source address="<address>" [invert="True"] ]
    [ destination address="<address>" [invert="True"] ]
    [ <element> ]
    [ log [prefix="<prefix text>"] [level="<log level>"] [limit value="rate/duration"] ]
    [ audit ]
    [ accept|reject|drop ]
```

一个规则是关联某个特定分区的，一个分区可以有几个规则。如果几个规则互相影响或者冲突，则执行和数据包相匹配的第一个规则。如果提供了规则系列，它可以是 ipv4 或者 ipv6 。规则系列把规则限定在 IPv4 或 IPv6 。如果没有提供规则系列， 将为 IPv4 和 IPv6 增加规则。如果源地址或者目标地址在一个规则中被使用，那么必须提供规则系列。端口转发也存在这种情况。

###### 3. 理解多规则命令

- source

通过制定源地址，一个尝试连接的源头可以被限制在源地址中。一个源地址或者地址范围是一个为 IPv4 或者 IPv6 做掩护的 IP 地址或者一个网络 IP 地址。网络系列（ IPv4 或 IPv6 ）将被自动覆盖。针对 IPv4 的伪装可以是一个网络伪装或者一个普通数字。针对 IPv4 的伪装是一个简单数字。不支持使用主机名。可以通过增加 invert="true" 或 invert="yes" 来颠倒源地址命令的意思。所有提供的地址都匹配。

- destination

通过制定目的地址，目标可以被限制在目的地址中。目标地址使用跟源地址相同的语法。原地址和目标地址的使用是有选择的，不可能目标地址的所有要素都使用。这取决于目标地址的使用，例如在服务项中，这个要素只可以是以下要素类型之一： service ， port ， protocol ， masquerade ， icmp-block 和 forward-port 。

- service

服务名称是 firewalld 提供的其中一种服务。要获得被支持的服务的列表，输入以下命令： firewall-cmd --get-services 。如果一个服务提供了一个目标地址，它将和规则中的目标地址冲突，并且导致一个错误。使用内部目的地址的服务大多是使用了多路传送的服务。命令为以下形式：

```shell
service name=service_name
```

- port

端口既可以是一个独立端口数字，又或者端口范围，例如，5060-5062。协议可以指定为 tcp 或 udp 。命令为以下形式

```shell
port port=number_or_range protocol=protocol
```

- protocol

协议值可以是一个协议 ID 数字，或者一个协议名。预知可用协议，请查阅 /etc/protocols。

```shell
protocol value=protocol_name_or_ID
```

- icmp-block

用这个命令阻绝一个或多个 ICMP 类型。 ICMP 类型是 firewalld 支持的 ICMP 类型之一。要获得被支持的 ICMP 类型列表，输入以下命令

```shell
firewall-cmd --get-icmptypes
```

在此，指定一个动作是不被允许的。icmp-block 在内部使用 reject 动作。命令为以下形式：

```shell
icmp-block name=icmptype_name
```

- masquerade

打开规则里的 IP 伪装。用源地址而不是目的地址来把伪装限制在这个区域内。在此，指定一个动作是不被允许的。

- forward-port

从一个带有指定为 tcp 或 udp 协议的本地端口转发数据包到另一个本地端口，或另一台机器，或另一台机器上的另一个端口。 port 和 to-port 可以是一个单独的端口数字，或一个端口范围。而目的地址是一个简单的 IP 地址。在此，指定一个动作是不被允许的。 forward-port 命令使用内部动作 accept 。这个命令为以下形式：

```shell
forward-port port=number_or_range protocol=protocol to-port=number_or_range to-addr=address
```

- log

注册含有内核记录的新的连接请求到规则中，比如系统记录。您可以定义一个前缀文本——可以把记录信息作为前缀加入。记录等级可以是 emerg 、 alert 、 crit 、 error 、warning 、 notice 、 info 或者 debug 中的一个。可以选择记录的用法，可以按以下方式限制注册

```shell
log [prefix=prefix text] [level=log level] limit value=rate/duration
```

等级用正的自然数 [1, ..] 表达，持续时间的单位为 s 、 m 、 h 、 d 。 s 表示秒， m 表示分钟， h 表示小时， d 表示天。最大限定值是 1/d ，意为每天最多有一条日志进入。

- audit

审核为发送到 auditd 服务的审核记录来注册提供了另一种方法。审核类型可以是 ACCEPT 、 REJECT 或 DROP 中的一种，但不能在 audit 命令后指定，因为审核类型将会从规则动作中自动收集。审核不包含自身参数，但可以选择性地增加限制。审核的使用是可选择的。

- accept|reject|drop

可以是 accept 、reject 或 drop 中的一个行为。规则中仅仅包含一个要素或者来源。如果规则中包含一个要素，那么行为可以处理符合要素的新连接。如果规则中包含一个来源，那么指定的行为可以处理来自源地址的一切内容。

```shell
accept | reject [type=reject type] | drop
```

选择 accept 所有新的连接请求都会被允许。选择 reject ，连接将被拒绝，连接来源将接到一个拒绝信息。拒绝的类型可以被设定为使用另一种值。选择 drop ， 所有数据包会被丢弃，并且不会向来源地发送任何信息。

###### 4.使用多规则登录命令

使用 Netfilter 登录目标可以完成登录，也可以使用审核目标。用 “zone_log” 格式命名的新链可以加入到所有分区，其中 zone 为该分区名。在 deny 链之前进行该项处理，以便获得适当的排序。根据规则的行为，整个规则或者部分规则会按照规则被分别放置在独立链中

```shell
zone_log

zone_deny

zone_allow
```

所有登录规则将放在 “zone_log” 链中，这会最先被解析。所有 reject 和 drop 规则都被放置在 “zone_deny” 链，在登录链之后被解析。所有 accept 规则被放在 “zone_allow” 链里，它将在 deny 链之后被解析。如果规则中既包含了 log ，又有 deny 或者 allow ，各部分将被放在相应的链中。

1. 多规则登录命令使用示例 1

为认证报头协议 AH 使用新的 IPv4 和 IPv6 连接

```shell
rule protocol value="ah" accept
```

2. 多规则登录命令使用示例 2

同意新的 IPv4 和 IPv6 连接 FTP，并使用审核每分钟登录一次

```shell
rule service name="ftp" log limit value="1/m" audit accept
```

3. 多规则登录命令使用示例 3

为 TFTP 协议同意来自 192.168.0.0/24 地址的新的 IPv4 连接，并且使用系统日志每分钟登录一次

```shell
rule family="ipv4" source address="192.168.0.0/24" service name="tftp" log prefix="tftp" level="info" limit value="1/m" accept
```

4. 多规则登录命令使用示例 4

为 RADIUS 协议拒绝所有来自 1:2:3:4:6:: 的新 IPv6 连接，并每分钟在级别 3 登录。接受来自其他来源的新的 IPv6 连接

```shell
rule family="ipv6" source address="1:2:3:4:6::" service name="radius" log prefix="dns" level="info" limit value="3/m" reject

rule family="ipv6" service name="radius" accept

```

5. 多规则登录命令使用示例 5

转发带有 TCP 协议的端口 4011 上的来自 1:2:3:4:6:: 的 IPv6 包，到端口 4012 上的 1::2:3:4:7

```shell
rule family="ipv6" source address="1:2:3:4:6::" forward-port to-addr="1::2:3:4:7" to-port="4012" protocol="tcp" port="4011"
```

6. 多规则登录命令使用示例 6

把一个源地址加入白名单，以便允许来自这个源地址的所有连接

```shell
rule family="ipv4" source address="192.168.2.2" accept
```

> 锁定防火墙

如果以 root 身份运行本地应用或者服务（比如 libvirt ），就能更改防火墙设置。因为这个功能，管理员可以锁定防火墙设置，这样无论是不向锁定的白名单添加应用，还是仅允许添加应用，都可以要求防火墙更改。锁定设置默认不启动，如果启动，用户可以确保本地应用或者服务不需要对防火墙做任何设置更改。

###### 1. 设置防火墙锁定

以 root 身份运行一个编辑器，把以下行增加到 /etc/firewalld/firewalld.conf 文件：

```
Lockdown=yes
```

以 root 身份使用以下命令重启防火墙

```shell
firewall-cmd --reload
```

欲在默认区内使用 imaps 服务，则以管理员账户，也就是 wheel 组中的用户（通常是系统的第一位用户），使用以下命令

```shell
~]$ firewall-cmd --add-service=imaps

Error: ACCESS_DENIED: lockdown is enabled

```

欲使用 firewall-cmd ，以 root 身份输入以下命令

```shell
firewall-cmd --add-lockdown-whitelist-command='/usr/bin/python -Es /usr/bin/firewall-cmd*' --permanent
```

以管理员账户输入以下命令，尝试在默认区里再次启动 imaps 服务。您将被提示输入用户密码

```shell
firewall-cmd --add-service=imaps
```

###### 2. 用命令行客户端配置锁定

查询锁定是否执行

```shell
firewall-cmd --query-lockdown
```

如果是锁定状态，打印退出状态为 0 的 yes。否则，打印退出状态为 1 的 no。

启动锁定

```shell
firewall-cmd --lockdown-on
```

关闭锁定

```shell
firewall-cmd --lockdown-off
```

###### 3. 用命令行配置锁定白名单选项

锁定白名单可以包含命令，安全环境，用户和用户 ID。如果白名单上输入的一个命令以一个星号 `*` 结束，那么所有以这个命令开始的命令行都匹配。如果没有 `*`，那么包括参数的绝对命令必须匹配。
环境，是指一个正在运行的应用或者服务的安全 (SELinux) 环境。

获取一个正在运行的应用的环境

```shell
ps -e --context
```

这个命令检查所有运行中的应用。

通过 grep 工具将输出转移，得到需要的应用

```shell
ps -e --context | grep example_program
```

列出白名单上的所有命令行

```shell
firewall-cmd --list-lockdown-whitelist-commands
```

增加一个 command 命令到白名单

```shell
firewall-cmd --add-lockdown-whitelist-command='/usr/bin/python -Es /usr/bin/command'
```

从白名单移除一个 command 命令

```shell
firewall-cmd --remove-lockdown-whitelist-command='/usr/bin/python -Es /usr/bin/command'
```

查询 command 命令是否在白名单上

```shell
firewall-cmd --query-lockdown-whitelist-command='/usr/bin/python -Es /usr/bin/command'
```

如果存在，显示退出状态为 0 的 yes ，否则，显示退出状态为 1 的 no

列出白名单上的所有安全环境

```shell
firewall-cmd --list-lockdown-whitelist-contexts
```

增加一个环境 context 到白名单

```shell
firewall-cmd --add-lockdown-whitelist-context=context --parmanent
```

从白名单移除一个环境 context

```shell
firewall-cmd --remove-lockdown-whitelist-context=context --permanent
```

查询白名单上是否有环境 context

```shell
firewall-cmd --query-lockdown-whitelist-context=context
```

如果存在，显示退出状态为 0 的 yes ，否则，显示退出状态为 1 的 no

列出白名单上所有用户 ID

```shell
firewall-cmd --list-lockdown-whitelist-uids
```

增加一个用户 ID uid 到白名单

```shell
 firewall-cmd --add-lockdown-whitelist-uid=uid --permanent
```

从白名单上移除一个用户 ID uid

```shell
 firewall-cmd --remove-lockdown-whitelist-uid=uid  --permanent
```

查询用户 ID uid 是否在白名单上

```shell
firewall-cmd --query-lockdown-whitelist-uid=uid
```

如果存在，显示退出状态为 0 的 yes ，否则，显示退出状态为 1 的 no

列出白名单上所有用户名

```shell
firewall-cmd --list-lockdown-whitelist-users
```

增加一个用户名 user 到白名单

```shell
firewall-cmd --add-lockdown-whitelist-user=user  --permanent
```

从白名单移除一个用户名 user

```shell
firewall-cmd --remove-lockdown-whitelist-user=user  --permanent
```

查询用户名 user 是否在白名单上

```shell
firewall-cmd --query-lockdown-whitelist-user=user
```

如果存在，显示退出状态为 0 的 yes ，否则，显示退出状态为 1 的 no

###### 4. 用配置文件来配置锁定白名单选项

默认的白名单配置文件包括 NetworkManager 环境和 libvirt 的默认环境。列表里也有用户 ID 0。

```xml
<?xml version="1.0" encoding="utf-8"?>

<whitelist>

  <selinux context="system_u:system_r:NetworkManager_t:s0"/>

  <selinux context="system_u:system_r:virtd_t:s0-s0:c0.c1023"/>

  <user id="0"/>

</whitelist>

```

这里跟随了一个示例白名单配置文件，它启动用于 firewall-cmd 功能的所有命令，为名为 user、用户 ID 为 815 的用户

```xml
<?xml version="1.0" encoding="utf-8"?>

<whitelist>

  <command name="/usr/bin/python -Es /bin/firewall-cmd*"/>

  <selinux context="system_u:system_r:NetworkManager_t:s0"/>

  <user id="815"/>

  <user name="user"/>

</whitelist>

```

在这个范例里，我们出示了 user id 和 user name 两样，但只需要一个即可。Python 是一个解释器，所以写在命令行的最前面。您也可以使用一个非常特别的命令，比如

```shell
/usr/bin/python /bin/firewall-cmd --lockdown-on
```

在这例子里，只有 `--lockdown-on` 命令会被允许。

**注意**
**在 Red Hat Enterprise Linux 7 中，所有功能现在都放在 /usr/bin/ 中，而且 /bin/ 目录被系统链接到 /usr/bin/ 目录。换言之，尽管以 root 身份运行的 firewall-cmd 路径可能解析到 /bin/firewall-cmd，但是现在会使用 /usr/bin/firewall-cmd 。所有新的脚本可以使用新的地址，但要意识到，如果以 root 身份运行的脚本被写入使用 /bin/firewall-cmd 路径，那么，命令路径除了是传统意义上仅用于非 root 用户的 /usr/bin/firewall-cmd 路径以外，还必须被加入白名单。**
**在一个命令的名字属性结尾的 `*`意味着所有以此行开头的命令都匹配。如果没有 `*` ，那么包括参数的绝对命令必须匹配。**
