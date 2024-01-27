### ssh

#### 0x01 基本配置

##### 启用 ssh 服务

```shell
systemctl status sshd
systemctl start sshd
systemctl enable sshd
```

#### 0x02 禁用 root 登录

```bash
# 锁住
passwd -l root
# 解锁
sudo passwd -u root
```

`/etc/ssh/sshd_config`

```
PermitRootLogin no
```

#### 0x03 修改登录欢迎语

`/etc/motd`

- `/usr/lib/motd.d/welcome`
- `/usr/lib/issue.d/`

> 请注意，要覆盖，您不应更改 `/usr/lib/motd.d/` 中的任何内容，否则您的更改将在软件包更新时被覆盖。相反，您应该在 /etc/motd.d/ 中创建一个具有相同名称的空（或已更改）文件。请参阅 `pam_motd` 文档。

#### 0x04 sshd 服务端心跳

`/etc/ssh/sshd_config`

```
ClientAliveInterval 60
ClientAliveCountMax 4
```

#### 0x05 自动登录

> 使用公钥认证

公钥认证比密码登录安全多了，因为它不受暴力密码攻击的影响，但是并不方便因为它依赖于 RSA 密钥对。首先，你要创建一个公钥/私钥对。下一步，私钥放于你的客户端电脑，并且复制**公钥**到你想登录的远程服务器。

你只能从拥有私钥的电脑登录才能登录到远程服务器。你的私钥就和你的家门钥匙一样敏感；任何人获取到了私钥就可以获取你的账号。你可以给你的私钥加上密码来增加一些强化保护规则。

使用 RSA 密钥对管理多个用户是一种好的方法。当一个用户离开了，只要从服务器删了他的公钥就能取消他的登录。

以下例子，它比默认的 2048 位更安全，而且为它起一个独一无二的名字，这样你就可以知道它属于哪个服务器。

##### a、在客户端创建密钥对

创建一个新的 3072 位长度的密钥对，名为 fooo

```bash
ssh-keygen -t rsa -b 3072 -f fooo
```

回车不设置加密参数，生成两个文件，`fooo`, `fooo.pub`

`fooo`为密钥，`fooo.pub`为公钥

密钥不要泄露，对外配置时，均使用公钥

```
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in fooo
Your public key has been saved in fooo.pub
The key fingerprint is:
SHA256:
The key's randomart image is:
```

##### b、复制公钥到服务器

> ssh-copy-id

```bash
ssh-copy-id -i foo.pub -p 233 user@remoteserver
### 添加私钥到 ssh-agent
ssh-add ~/.ssh/id_rsa
### 若执行失败，提示
### Could not open a connection to your authentication agent
### 则执行
eval `ssh-agent`
```

> 手动操作

追加公钥到 `~/.ssh/authorized_keys`

##### c、编辑服务端 sshd_config 文件 （待验证 😳）

一旦你已经测试并且验证了你的公钥可以登录，就可以取消密码登录，这样你的远程服务器就不会被暴力密码攻击。如下设置你的远程服务器的 `/etc/ssh/sshd_config` 文件。

```
#修改端口
Port 2222
#禁用密码验证
PasswordAuthentication no
#启用密钥验证
RSAAuthentication yes
PubkeyAuthentication yes
#指定公钥数据库文件
AuthorsizedKeysFile .ssh/authorized_keys
```

**重启 SSH 服务前建议多保留一个会话以防不测**

然后重启服务器上的 SSH 守护进程

```bash
systemctl restart sshd
```

##### d、客户端配置自动登录文件

编辑`~/.ssh/config`

```bash
Host {name}
    HostName {host}
    Port {port}
    User {user}
    IdentityFile ~/.ssh/id_rsa
```

例如

```
Host fooo
  HostName 10.0.0.3
  User lux
  IdentityFile ~/.ssh/fooo
```

登录使用

```bash
ssh -p 233 root@servers
# 指定密钥
ssh -p 233 root@servers -i .ssh/fooo
# 使用简称
ssh foo
```

#####

#### 0x06 最佳命令

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

更具移植性的版本

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

参考文章:

1. <https://linux.cn/article-7683-1.html>
2. <https://linux.cn/article-5776-1.html>
3. <http://os.51cto.com/art/201304/390042.htm>
