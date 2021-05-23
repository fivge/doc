### ipreote2

| 用途           | net-tool（被淘汰） | iproute2         |
| -------------- | ------------------ | ---------------- |
| 地址和链路配置 | ifconfig           | ip addr, ip link |
| 路由表         | route              | ip route         |
| 邻居           | arp                | ip neigh         |
| VLAN           | vconfig            | ip link          |
| 隧道           | iptunnel           | ip tunnel        |
| 组播           | ipmaddr            | ip maddr         |
| 统计           | netstat            | ss               |

#### ip

替代 `ifconfig`

```bash
➜  ~ cheat ip
# Display all interfaces with addresses
ip addr

# Take down / up the wireless adapter
ip link set dev wlan0 {up|down}

# Set a static IP and netmask
ip addr add 192.168.1.100/32 dev eth0

# Remove a IP from an interface
ip addr del 192.168.1.100/32 dev eth0

# Remove all IPs from an interface
ip address flush dev eth0

# Display all routes
ip route

# Display all routes for IPv6
ip -6 route

# Add default route via gateway IP
ip route add default via 192.168.1.1

# Add route via interface
ip route add 192.168.0.0/24 dev eth0

# Change your mac address
ip link set dev eth0 address aa:bb:cc:dd:ee:ff

# View neighbors (using ARP and NDP)
ip neighbor show
```

##### example

```bash
ip link
ip link set eth0 down
ip link set eth0 up
ip addr add 172.20.41.198/24 dev eth0
ip route add default via 172.20.41.254
echo 'nameserver 211.87.191.66' > /etc/resolv.conf
echo 'nameserver 211.87.191.77' >> /etc/resolv.conf

iw dev wlan0 scan | less
```

```bash
ip addr flush dev interface
ip route flush dev interface
ip link set interface down
```

```bash
ip monitor all
```

<https://zh.wikipedia.org/wiki/无类别域间路由>

自动连接到已知网络
警告: 不要同时使用该方案和已启用的无线连接配置文件 profile, 比如 netctl enable profile.
安装 wpa_actiond, netctl-auto 要用到它：

#### ss

替代 `netstat`

```bash
ss
Utility to investigate sockets

Args
-4/-6 list ipv4/ipv6 sockets
-n numeric addresses instead of hostnames
-l list listing sockets
-u/-t/-x list udp/tcp/unix sockets
-p Show process(es) that using socket

# show all listing tcp sockets including the corresponding process
ss -tlp

# show all sockets connecting to 192.168.2.1 on port 80
ss -t dst 192.168.2.1:80

# show all ssh related connection
ss -t state established '( dport = :ssh or sport = :ssh )'
```

```bash
# 查看当前服务器的网络连接统计
ss -s
# 查看所有打开的网络端口
ss -l
ss -pl ### 列出具体的程序名称
# 查看所有的socket连接
ss -a
ss -ta ### 只想查看TCP sockets
ss -ua ### 只想查看UDP sockets
ss -wa ### 只想查看RAW sockets
ss -xa ### 只想查看UNIX sockets
# 查看TCP相关定时器信息
ss -to
```

#### 附注

#### 查看 ip

```bash
curl icanhazip.com
curl ifconfig.me
curl curlmyip.com
curl ip.appspot.com
curl ipinfo.io/ip
curl ipecho.net/plain
curl www.trackip.net/i
### json
curl ipinfo.io/json
curl ifconfig.me/all.json
curl www.trackip.net/ip?json
### xml
curl ifconfig.me/all.xml
### curl 得到所有 IP 细节 （挖掘机）
curl ifconfig.me/all
### 使用 DYDNS （当你使用 DYDNS 服务时有用）
curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g'
curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"
### 使用 Wget 代替 Curl
wget http://ipecho.net/plain -O - -q ; echo
wget http://observebox.com/ip -O - -q ; echo
### 使用 host 和 dig 命令
### 如果有的话，你也可以直接使用 host 和 dig 命令。
host -t a dartsclink.com | sed 's/.*has address //'
dig +short myip.opendns.com @resolver1.opendns.com
### bash 脚本示例:
#!/bin/bash
PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
echo $PUBLIC_IP
```

---

pacman -S wpa_actiond

激活 netctl-auto 服务，它会自动连接到已知网络，并且出色地处理重新连接于漫游：

systemctl enable netctl-auto@interface_name.service

提示: Netctl 亦提供 netctl-ifplugd, 它可以和 netctl-auto 同时使用，以处理自动有线连接。

---
