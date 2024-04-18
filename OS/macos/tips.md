---
title: macOS System
date: 2017-06-29 19:48:42
updated: 2018-04-21
tags:
  - macOS
categories:
  - macOS
---

### 1. 挂载 NTFS 分区

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

### 4.mac 汇编语言

```bash
brew install nasm
```

### 5.字体

- ~/资源库/Fonts/
  - /资源库/Fonts/
  - /系统/资源库/Fonts/

### 6.刻制原版安装盘

> OS X 系统下:

- 打开磁盘工具，选择 U 盘，进行分区；
- 分为一个 300MB 左右的名为 EFI 的 FAT 类型的盘，剩下的都为 OS X 扩展，命名为 Install OS X El Capitan
- 右击 Install OS X El Capitan.app -> 显示包内容 -> Contents -> Resources ->
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

> 在 macOS 10.12 中可以直接通过快捷键来开关

`Command-Shift-G`

---

> directory-not-empty-sudo-rm-r-i-file-name-not-working

https://apple.stackexchange.com/questions/116217/directory-not-empty-sudo-rm-r-i-file-name-not-working

file

```bash
find / -name "Adobe Application Manager"
```

> 列出磁盘

    diskutil list

##### 如何确定已经当前 SIP 的开关状态？可在终端中使用官方的 csrutil 命令行工具进行查询：

csrutil status

从 10.11 DB5/PB3 版开始，rootless=0 以及 kext-dev-mode=1 启动参数已经被废除，请不要再使用。第三方 kext 推荐安装至/Library/Extensions/，尽量避免对 SLE 下的原版 kext 进行直接修改
