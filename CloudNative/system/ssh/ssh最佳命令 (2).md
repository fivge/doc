---
title: ssh最佳命令
tags:
  - ssh
  - Term
date: 2016-10-01 21:18:13
categories:
  - Term
---

- 从某主机的 80 端口开启到本地主机 2001 端口的隧道

```shell
ssh -N -L2001:localhost:80 某主机
```

现在你可以直接在浏览器中输入<http://localhost:2001>访问这个网站。

- 将你的麦克风输出到远程计算机的扬声器

```shell
dd if=/dev/dsp | ssh -c arcfour -C 用户名@远程主机 dd of=/dev/dsp
```

这样来自你麦克风端口的声音将在 SSH 目标计算机的扬声器端口输出，但遗憾的是，声音质量很差，你会听到很多嘶嘶声。

- 比较远程和本地文件

```shell
ssh 用户名@远程主机 cat /path/to/remotefile | diff /path/to/localfile –
```

在比较本地文件和远程文件是否有差异时这个命令很管用。

- 通过 SSH 挂载目录/文件系统

```shell
sshfs 用户名@远程主机:/path/to/folder /path/to/mount/point
```

从<http://fuse.sourceforge.net/sshfs.html>下载 sshfs，它允许你跨网络安全挂载一个目录。

- 通过中间主机建立 SSH 连接

```shell
ssh -t 中间主机 ssh 远程不可直接访问的主机
```

从本地网络无法直接访问的主机，但可以从中间主机所在网络访问时，这个命令通过到中间主机的“隐藏”连接，创建连接到远程不可直接访问的主机的连接。

- 创建到目标主机的持久化连接

```shell
ssh -MNf 用户名@主机
```

在后台创建到目标主机的持久化连接，将这个命令和你~/.ssh/config 中的配置结合使用

```
Host host

ControlPath ~/.ssh/master-%r@%h:%p

ControlMaster no

```

所有到目标主机的 SSH 连接都将使用持久化 SSH 套接字，如果你使用 SSH 定期同步文件（使用 rsync/sftp/cvs/svn），这个命令将非常有用，因为每次打开一个 SSH 连接时不会创建新的套接字。

- 通过 SSH 连接屏幕

```shell
ssh -t remote_host screen –r
```

直接连接到远程屏幕会话（节省了无用的父 bash 进程）。

- 端口检测（敲门）

```shell
knock 主机 3000 4000 5000 && ssh -p 端口 用户名@主机 && knock 主机 5000 4000 3000
```

在一个端口上敲一下打开某个服务的端口（如 SSH），再敲一下关闭该端口，需要先安装 knockd，下面是一个配置文件示例。

```shell
[options]

logfile = /var/log/knockd.log

[openSSH]

sequence = 3000,4000,5000

seq_timeout = 5

command = /sbin/iptables -A INPUT -i eth0 -s %IP% -p tcp –dport 22 -j ACCEPT

tcpflags = syn

[closeSSH]

sequence = 5000,4000,3000

seq_timeout = 5

command = /sbin/iptables -D INPUT -i eth0 -s %IP% -p tcp –dport 22 -j ACCEPT

tcpflags = syn

```

- 从已知主机列表中删除一个主机

```shell
ssh-keygen -R 要删除的主机名
```

- 通过 SSH 运行复杂的远程 shell 命令（不用转义特殊字符）

```shell
ssh host -l user $(<cmd.txt)
```

​ 更具移植性的版本

```shell
ssh host -l user “cat cmd.txt”
```

- 通过 SSH 将 MySQL 数据库复制到新服务器

```shell
mysqldump –add-drop-table –extended-insert \

  –force –log-error=error.log \

  -uUSER -pPASS OLD_DB_NAME \

  | ssh -C user@newhost “mysql -uUSER -pPASS NEW_DB_NAME”

```

通过压缩的 SSH 隧道 Dump 一个 MySQL 数据库，将其作为输入传递给 mysql 命令，我认为这是迁移数据库到新服务器最快最好的方法。

- 从一台没有 ssh-copy-id 命令的主机将你的 SSH 公钥复制到服务器

```shell
cat ~/.ssh/id_rsa.pub | ssh user@machine “mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys”
```

如果你使用 Mac OS X 或其它没有 ssh-copy-id 命令的\*nix 变种，这个命令可以将你的公钥复制到远程主机，因此你照样可以实现无密码 SSH 登录。

- 实时 SSH 网络吞吐量测试

```shell
yes | pv | ssh 主机 "cat > /dev/null"
```

通过 SSH 连接到主机，显示实时的传输速度，将所有传输数据指向/dev/null，需要先安装 pv。

- 建立一个可以重新连接的远程 GNU screen

```shell
ssh -t 用户名@主机 /usr/bin/screen –xRR
```

人们总是喜欢在一个文本终端中打开许多 shell，如果会话突然中断，或你按下了“Ctrl-a d”，远程主机上的 shell 不会受到丝毫影响，你可以重新连接，其它有用的 screen 命令有“Ctrl-a c”（打开新的 shell）和“Ctrl-a a”（在 shell 之间来回切换），请访问<http://aperiodic.net/screen/quick_reference>阅读更多关于 screen 命令的快速参考。

- 继续 scp 大文件

```shell
rsync –partial –progress –rsh=ssh 源文件 用户名@主机:目标文件
```

它可以恢复失败的 rsync 命令，当你通过 VPN 传输大文件，如备份的数据库时这个命令非常有用，需要在两边的主机上安装 rsync。

- 通过 SSH w/wireshark 分析流量

```shell
ssh 用户名@主机 ‘tshark -f “port !22″ -w -’ | wireshark -k -i -
```

使用 tshark 捕捉远程主机上的网络通信，通过 SSH 连接发送原始 pcap 数据，并在 wireshark 中显示，按下 Ctrl+C 将停止捕捉，但也会关闭 wireshark 窗口，可以传递一个“-c #”参数给 tshark，让它只捕捉“#”指定的数据包类型，或通过命名管道重定向数据，而不是直接通过 SSH 传输给 wireshark，我建议你过滤数据包，以节约带宽，tshark 可以使用 tcpdump 替代

```shell
ssh 用户名@主机 tcpdump -w – ‘port !22′ | wireshark -k -i -
```

- 更稳定，更快，更强的 SSH 客户端

```shell
ssh -4 -C -c blowfish-cbc
```

强制使用 IPv4，压缩数据流，使用 Blowfish 加密。

- 使用 cstream 控制带宽

```shell
tar -cj /backup | cstream -t 777k | ssh host ‘tar -xj -C /backup’
```

使用 bzip 压缩文件夹，然后以 777k bit/s 速率向远程主机传输。Cstream 还有更多的功能，请访问<http://www.cons.org/cracauer/cstream.html#usage>了解详情，例如：

```shell
echo w00t, i’m 733+ | cstream -b1 -t2
```

- 将标准输入（stdin）复制到你的 X11 缓冲区

```shell
ssh 用户名@主机 cat /path/to/some/file | xclip
```

你是否使用 scp 将文件复制到工作用电脑上，以便复制其内容到电子邮件中？xclip 可以帮到你，它可以将标准输入复制到 X11 缓冲区，你需要做的就是点击鼠标中键粘贴缓冲区中的内容。

---

参考文章：

1. <http://os.51cto.com/art/201304/390042.htm>
