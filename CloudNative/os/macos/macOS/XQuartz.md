---
title: XQuartz
date: 2018-05-10 15:19:22
updated: 2018-05-25 22:00:23
tags:
- macOS
categories:
- macOS
---

### XQuartz

##### 问题

```bash
➜  topo git:(master) ✗ wireshark
QXcbConnection: Could not connect to display 
[1]    6057 abort (core dumped)  wireshark
➜  topo git:(master) ✗ xterm 
xterm: Xt error: Can't open display: 
xterm: DISPLAY is not set
```

<!--more--> 

#####安装

<https://www.xquartz.org/releases/index.html>

##### 连接

**添加`-X`选项**

```bash
ssh x@192.168.56.101 -X
```

---

##### Updated

当远程主机禁用 ipv6 时,又无法连接到 X11

![](https://ws3.sinaimg.cn/large/006tNc79ly1frnxoqzgfrj30jw0b4wkx.jpg)

##### 解决

```bash
vim /etc/ssh/sshd_config
### 注释 AddressFamily any
### 添加 AddressFamily inet
```

### ssh -X -Y 区别

```
 -X      Enables X11 forwarding.  This can also be specified on a per-host
         basis in a configuration file.

         X11 forwarding should be enabled with caution.  Users with the
         ability to bypass file permissions on the remote host (for the
         user's X authorization database) can access the local X11 display
         through the forwarded connection.  An attacker may then be able
         to perform activities such as keystroke monitoring.

         For this reason, X11 forwarding is subjected to X11 SECURITY
         extension restrictions by default.  Please refer to the ssh -Y
         option and the ForwardX11Trusted directive in ssh_config(5) for
         more information.

 -Y      Enables trusted X11 forwarding.  Trusted X11 forwardings are not
         subjected to the X11 SECURITY extension controls.
```

If you use ssh -X remotemachine the remote machine is treated as an untrusted client. So your local client sends a command to the remote machine and receives the graphical output. If your command violates some security settings you'll receive an error instead.

But if you use ssh -Y remotemachine the remote machine is treated as trusted client. This last option can open security problems. Because other graphical (X11) client could sniff data from the remote machine (make screenshots, do keylogging and other nasty stuff) and it is even possible to alter those data.