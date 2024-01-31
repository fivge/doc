# vm

> win11 + virtualbox + opensuse + vscode

## 0x00 安装配置虚拟机

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

- zsh
- git
- oh-my-zsh

## 0x03 开发环境搭建

### git

`GCM` `GPG` `pass`

### node

```bash
# nodejs
sudo zypper install nodejs21
# yarn
sudo npm --proxy http://10.0.2.2:23333  install -g corepack
corepack enable
yarn -v
```

## 0x04 其他配置
