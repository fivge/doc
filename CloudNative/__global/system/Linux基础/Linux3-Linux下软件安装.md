---
title: Linux3 Linux下软件安装
tags:
- apt
- dpkg
- Linux
date: 2016-10-26 14:30:43
---

## apt包管理工具

### `apt-get`

+ `install` 	其后加上软件包名，用于安装一个软件包
  + `update` 从软件源镜像服务器上下载/更新用于更新本地软件源的软件包列表
  + `upgrade` 升级本地可更新的全部软件包，但存在依赖问题时将不会升级，通常会在更新之前执行一次update
  + `dist-upgrade` 解决依赖关系并升级(存在一定危险性)
  + `remove `移除已安装的软件包，包括与被移除软件包有依赖关系的软件包，但不包含软件包的配置文件
  + `purge` 与remove相同，但会完全移除软件包，包含其配置文件
  + `autoremove `移除之前被其他软件包依赖，但现在不再被使用的软件包
  + `clean `移除下载到本地的已经安装的软件包，默认保存在/var/cache/apt/archives/
  + `autoclean `移除已安装的软件的旧版本软件包


<!-- more -->

+ `-y` 	自动回应是否安装软件包的选项，在一些自动化安装脚本中使用这个参数将十分有用
  + `-s` 模拟安装
  + `-q` 静默安装方式，指定多个q或者-q=#,#表示数字，用于设定静默级别，这在你不想要在安装软件包时屏幕输出过多时很有用
  + `-f `修复损坏的依赖关系
  + `-d` 只下载不安装
  + `--reinstall `重新安装已经安装但可能存在问题的软件包
  + `--install-suggests` 同时安装APT给出的建议安装的软件包

**软件一般下载到`『/var/cache/apt/archives/』`中

### `apt-cache` 

apt-cache 命令是针对本地数据进行相关操作的工具

搜索软件

```shell
sudo apt-cache search softname1 softname2 softname3
```

## dpkg

+ `-i `	安装指定deb包
  + `-R` 后面加上目录名，用于安装该目录下的所有deb安装包
  + `-r` remove，移除某个已安装的软件包
  + `-I` 显示deb包文件的信息
  + `-s` 显示已安装软件的信息
  + `-S` 搜索已安装的软件包
  + `-L` 显示已安装软件包的目录信息

***

## Examples


+ `.deb`

```shell
sudo dpkg -i sougo.deb
sudo apt-get install -f
```

+ `.run` `.bundle`

```shell
chmod 555 sougo.run   添加可执行权限 
sudo ./sougo.run
```

+ `.tar`

```shell
sudo tar –xvzf  *.tar 
cd firefox
sudo chmod 755 *
sudo mv firefox /opt
sudo mv /usr/bin/firefox  /usr/bin/firefox-old
sudo ln -s /opt/firefox/firefox /usr/bin/firefox
```

+  `Makefile`


```shell
    make
```
---

## More

+ java安装

```shell
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
```

+ 深度系列软件

PPA方式
国外用户建立了深度系列软件的PPA, 可以在其它发行版本上很方便的安装深软件 终端执行: 

```shell
 sudo apt-add-repository ppa:noobslab/deepin-sc
 sudo apt-get update
 sudo apt-get install  deepin-music-player deepin-media-player##安装深度音乐和深度影音
```

推荐使用此方法，但该PPA由个人维护，非LinuxDeepin官方提供，部分软件可能会更新不及时会导致出现问题。 

添加源方式
编辑源列表
终端执行：

``` shell
 sudo gedit /etc/apt/sources.list 
```

然后将下面两行内容复制到上述文件末尾，然后保存：

``` shell
 deb http://packages.linuxdeepin.com/deepin raring main non-free universe
 deb-src http://packages.linuxdeepin.com/deepin raring main non-free universe
```

导入密钥

终端执行： 

```shell
 wget http://packages.linuxdeepin.com/deepin/project/deepin-keyring.gpg
 gpg --import deepin-keyring.gpg
 sudo gpg --export --armor 209088E7 | sudo apt-key add -
```

刷新源列表

终端执行： 

```shell
  sudo apt-get update
```

安装

终端执行： 

```shell
 sudo apt-get install python-deepin-gsettings deepin-music-player deepin-media-player deepin-software-center
 sudo apt-get install dde-meta-core
```

安装深度桌面环境和度音乐、深度影音、深度软件中心，注销选择从 Deepin 登录即可 

```shell
     apt-get update && apt-get dist-upgrade
```
会下载更新800多个包，linux系统下载很快，800多个包数字吓人，但很快。
更新完，就是安装deepin桌面了


```shell
 apt-get install deepin-desktop-base dde-workspace
```
又是一堆安装好像占用300多磁盘空间。
接着就是安装几款deepin应用了:软件中心 影院 音乐 终端 截图

```shell
 apt-get install deepin-software-center deepin-movie deepin-music deepin-terminal deepin-screenshot
```


我没有安装crossover，它在i386源里，要输入

```shell
dpkg --add-architecture i386 && apt-get update && apt-get install crossover
```
可以安装成功，但crossover不能创建容器，缺依赖。就不试了。



