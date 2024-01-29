---
title: VPS配置
date: 2017-05-02 13:35:19
tags:
  - Server
  - Hexo
---

### 博客迁移

https://blog.yizhilee.com/post/deploy-hexo-to-vps/

https://aotu.io/notes/2016/08/16/nginx-https/

> 安装

ubuntu 16.04

> 配置

#### 0. 添加用户

```shell
adduser luan
sudo usermod -G sudo
```

#### 1. 安装 zsh,vim

```bash
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

```

#### 2. 安装 nvm

https://github.com/creationix/nvm

```shell
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
```

add to .zshrc

```shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
```

#### 3.防火墙配置

#### 4. 安装 nginx,阿帕奇

#### 5. 安装 shadowsocks

- 安装 ss

  http://shadowsocks.github.io/shadowsocks-go/

  https://github.com/shadowsocks/go-shadowsocks2

  ​

- 控制面板

  https://github.com/orvice/ss-panel

  https://github.com/orvice/ss-panel/wiki/v3-Install

  http://539go.com/index.php/archives/201601/96.html

  ​

- Kcptun 加速

  https://github.com/xtaci/kcptun

  http://k162.space/kcptun/

  https://blog.kuoruan.com/102.html

  https://github.com/shadowsocks-plus/shadowsocks-plus?WTF

  https://www.cmsky.com/kcptun/

  ​

多用户 https://mechanus.io/yi-ge-xin-shou-xiang-de-ss-panel-bu-shu-jiao-cheng/

```shell
### 安装go版ss
apt install golang
cd
mkdir gocode
export GOPATH=$HOME/gocode
go get -u -v github.com/shadowsocks/go-shadowsocks2
```

https://github.com/shadowsocks/go-shadowsocks2

```shell
nn
```

#### 6. 安装 hexo

https://blog.yizhilee.com/post/deploy-hexo-to-vps/

https://hexo.io/zh-cn/

```shell
npm config set user 0
npm config set unsafe-perm true

npm install hexo-cli -g
hexo init blog
cd blog
npm install
hexo server
```

#### 7.主题配置

https://material.viosey.com/intro/

https://material.viosey.com/services/

https://github.com/hexojs/hexo-generator-feed

https://github.com/viosey/hexo-theme-material

https://blog.viosey.com/2017/01/11/Duoshuo2Disqus/

https://material.viosey.com

https://material.viosey.com/services/

https://material.viosey.com

#### 8. 启用 HTTPS

https://aotu.io/notes/2016/08/16/nginx-https/

#### 9.后台监控服务
