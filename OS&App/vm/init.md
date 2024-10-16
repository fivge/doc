# Start

> win11 + virtualbox|vmware + opensuse + vscode

## 0x00 安装配置虚拟机

https://get.opensuse.org/tumbleweed/

### virtualbox

### vmware

```
1.	⁠in the boot menu, edit the default boot entry
2.	⁠append `init=/bin/sh` to the `linux` line
3.	⁠boot with Ctrl+X and wait for the shell
4.	⁠`mount -o remount,rw /`
5.	⁠`passwd`
6.	⁠Set a new passphrase and reset (restart) the machine
```

## 0x01 联通宿主机和虚拟机

### 使用宿主机代理

查看路由

```bash
ip route
```

```
default via 10.0.2.2 dev enp0s3 proto dhcp src 10.0.2.15 metric 101
10.0.0.0/24 dev enp0s8 proto kernel scope link src 10.0.0.3 metric 100
10.0.2.0/24 dev enp0s3 proto kernel scope link src 10.0.2.15 metric 101
```

配置代理

```bash
export all_proxy="http://10.0.2.2:23333"
# 取消配置
unset all_proxy
```

## 0x02 初始化

##### 创建用户

```bash
passwd -l root
```

```bash
useradd -m x
passwd x
```

##### sudo

```bash
visudo
```

```
#includedir /etc/sudoers.d
```

`/etc/sudoers/default`

```
x ALL=(ALL) NOPASSWD:ALL
```

##### proxy

```bash
x@localhost:~> ip route show

default via 10.0.3.2 dev ens33 proto dhcp src 10.0.3.3 metric 100
10.0.2.0/24 dev ens37 proto kernel scope link src 10.0.2.1 metric 101
10.0.3.0/24 dev ens33 proto kernel scope link src 10.0.3.3 metric 100

x@localhost:~> ip a

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:66:c3:b3 brd ff:ff:ff:ff:ff:ff
    altname enp2s1
    inet 10.0.3.3/24 brd 10.0.3.255 scope global dynamic noprefixroute ens33
       valid_lft 1292sec preferred_lft 1292sec
    inet6 fe80::acd8:e694:ab17:b145/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
3: ens37: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:66:c3:bd brd ff:ff:ff:ff:ff:ff
    altname enp2s5
    inet 10.0.2.1/24 brd 10.0.2.255 scope global dynamic noprefixroute ens37
       valid_lft 77792sec preferred_lft 77792sec
    inet6 fe80::88a4:9e1a:d61f:d241/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

```bash
export all_proxy="http://10.0.3.1:23333"
```

##### 镜像

https://mirrors.tuna.tsinghua.edu.cn/help/opensuse/

##### apps

- zsh
- git
- oh-my-zsh

## 0x03 开发环境搭建

### git

`GCM` `GPG` `pass`

### node

fnm

```bash
# nodejs
sudo zypper install nodejs21
# yarn
sudo npm --proxy http://10.0.2.2:23333  install -g corepack
corepack enable
yarn -v
```

## 0x04 其他配置
