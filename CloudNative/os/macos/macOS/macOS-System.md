---
title: macOS System
date: 2017-06-29 19:48:42
updated: 2018-04-21
tags:
- macOS
categories:
- macOS
---


### 1. 挂载NTFS分区

```bash
Mac:~ x$ ls /Volumes/
App			OS X			Win10 OS
Mac			Tuxera NTFS 2014	用户
Mac:~ x$ diskutil info /Volumes/用户 | grep UUID
   Volume UUID:              47C13D50-07B9-4D48-AEA0-6B1543F8339E
   Disk / Partition UUID:    427F3E08-3EFD-4D57-8B8D-4A5C0DD8FDF4
Mac:~ x$ echo "UUID=47C13D50-07B9-4D48-AEA0-6B1543F8339E none ntfs rw,auto,nobrowse" | sudo tee -a /etc/fstab 
```

```bash
UUID=47C13D50-07B9-4D48-AEA0-6B1543F8339E none ntfs rw,auto,nobrowse
```

### 2. ...已被占用

```bash
⚒ xattr -l /Volumes/App/【安装包】/Mac/硬件概要.md                            ~
com.apple.FinderInfo:
00000000  62 72 6F 6B 4D 41 43 53 00 00 00 00 00 00 00 00  |brokMACS........|
00000010  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
00000020
com.apple.TextEncoding: utf-8;134217984
⚒ xattr -d com.apple.FinderInfo /Volumes/App/【安装包】/Mac/硬件概要.md   
```

### 3.pkg

#### Term

##### (1) 显示包列表

```bash
pkgutil --pkgs
```

##### (2)列出所关联的文件

```bash
pkgutil --files com.Hackintosh.voodoohda287.Voodoo.pkg
```

#### UninstallPKG(要钱的)

[UninstallPKG][2]

#### pkg_uninstaller(貌似没用)

[pkg_uninstaller][1]

##### Installation

Installation is as simple as:

```bash
[sudo] bash < <(curl -sL https://raw.github.com/mpapis/pkg_uninstaller/master/pkg-install)
```

Adding to PATH, for system installation (with sudo):

```bash
echo 'PATH=$PATH:/opt/pkg_uninstaller' >> /etc/profile
```

Adding PATH when installed as user (without sudo):

```bash
echo 'PATH=$PATH:$HOME/.pkg_uninstaller' >> $HOME/.bash_profile
```

Note the single quotes are important in both cases.

##### Installing package file

Install packages with:

```bash
pkg-install <package_file.pkg>
```

This will create `uninstall_<package_file_pkg>.sh` in current directory.

To uninstall this package just execute `./uninstall_<package_file_pkg>.sh`.

##### Uninstalling single packages by name.

List available package names (possibly filtering by [name]):

```bash
pkg-list [name]
```

Uninstall package:

```bash
pkg-uninstall <name>
```

##### Using internally in package to build uninstaller

- You have to bundle `pkg-wrapper` with your application 
  and install it to disk before executing the hook bellow.
- In before installing hook call this script:

```shell
#!/bin/bash

pkg-wrapper before "your package name"
```

- In after installing hook call this script:

```shell
#!/bin/bash

pkg-wrapper before "your package name" /path/to/uninstaller_name.sh
```

- In uninstall hook call:

```shell
#!/bin/bash

/path/to/uninstaller_name.sh
rm /path/to/uninstaller_name.sh
```

[1]: https://github.com/mpapis/pkg_uninstaller
[2]: http://www.corecode.at/uninstallpkg/

### 4.mac汇编语言

```bash
brew install nasm
```

### 5.字体

- ~/资源库/Fonts/
  - /资源库/Fonts/
  - /系统/资源库/Fonts/

### 6.刻制原版安装盘

> OS X 系统下:

- 打开磁盘工具，选择U盘，进行分区；
- 分为一个300MB左右的名为EFI的FAT类型的盘，剩下的都为OS X扩展，命名为Install OS X El Capitan
- 右击Install OS X El Capitan.app -> 显示包内容 -> Contents -> Resources -> 
  createinstallmedia , 复制该文件至桌面
- 打开终端

```bash
diskutil list  ### 列出磁盘
sudo su
/Users/x/Desktop/createinstallmedia --volume /Volumes/Install/ --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app [--force]
```

开始写入镜像

- 刻录完毕

### 7.显示隐藏文件

> ~~显示隐藏文件~~

```bash
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder
```

> ~~恢复~~

```bash
defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder
```

**new**

> 在macOS 10.12中可以直接通过快捷键![](https://ws4.sinaimg.cn/large/006tKfTcly1fh2blomlehj301y00ka9u.jpg) 来开关