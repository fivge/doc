---
title: ssh自动登录
tags:
- ssh
- Term
date: 2016-09-30 20:15:03
categories:
- Term
---


### 使用公钥认证

公钥认证比密码登录安全多了，因为它不受暴力密码攻击的影响，但是并不方便因为它依赖于 RSA 密钥对。首先，你要创建一个公钥/私钥对。下一步，私钥放于你的客户端电脑，并且复制公钥到你想登录的远程服务器。你只能从拥有私钥的电脑登录才能登录到远程服务器。你的私钥就和你的家门钥匙一样敏感；任何人获取到了私钥就可以获取你的账号。你可以给你的私钥加上密码来增加一些强化保护规则。

使用 RSA 密钥对管理多个用户是一种好的方法。当一个用户离开了，只要从服务器删了他的公钥就能取消他的登录。

<!-- more -->

以下例子创建一个新的 3072 位长度的密钥对，它比默认的 2048 位更安全，而且为它起一个独一无二的名字，这样你就可以知道它属于哪个服务器。

```
ssh-keygen -t rsa -b 3072 -f id_mailserver
```

以下创建两个新的密钥, `id_mailserver` 和 `id_mailserver.pub`，`id_mailserver` 是你的私钥--不要传播它！

现在用 `ssh-copy-id` 命令安全地复制你的公钥到你的远程服务器。你必须确保在远程服务器上有可用的 SSH 登录方式。

---

>What!Mac上没有`ssh-copy-id`

```
curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh | sh 
```

详见<https://github.com/beautifulcode/ssh-copy-id-for-OSX>

---

```bash
ssh-copy-id -i  id_rsa.pub user@remoteserver
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
user@remoteserver's password:
Number of key(s) added: 1
Now try logging into the machine, with:   "ssh 'user@remoteserver'"
and check to make sure that only the key(s) you wanted were added.
```

`ssh-copy-id` 会确保你不会无意间复制了你的私钥。从上述输出中复制登录命令，记得带上其中的单引号，以测试你的新的密钥登录。

```
ssh 'user@remoteserver'
```

它将用你的新密钥登录，如果你为你的私钥设置了密码，它会提示你输入。

### 编辑sshd_config文件

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

**重启SSH服务前建议多保留一个会话以防不测**

然后重启服务器上的 SSH 守护进程。

```bash
systemctl restart sshd
```

以后登录使用

```bash
ssh -p 2222 root@servers
```


### 手动增加管理用户

**可以在== 后加入用户注释标识方便管理**

```bash
echo 'ssh-rsa XXXX' >>/root/.ssh/authorized_keys
# 复查
cat /root/.ssh/authorized_keys
```

---

参考文章:

1. <https://linux.cn/article-7683-1.html>
2. <https://linux.cn/article-5776-1.html>
