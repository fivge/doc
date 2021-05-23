### 1. 挂载NTFS分区


```shell
Mac:~ x$ ls /Volumes/
App			OS X			Win10 OS
Mac			Tuxera NTFS 2014	用户
Mac:~ x$ diskutil info /Volumes/用户 | grep UUID
   Volume UUID:              47C13D50-07B9-4D48-AEA0-6B1543F8339E
   Disk / Partition UUID:    427F3E08-3EFD-4D57-8B8D-4A5C0DD8FDF4
Mac:~ x$ echo "UUID=47C13D50-07B9-4D48-AEA0-6B1543F8339E none ntfs rw,auto,nobrowse" | sudo tee -a /etc/fstab 
```

```shell
UUID=47C13D50-07B9-4D48-AEA0-6B1543F8339E none ntfs rw,auto,nobrowse
```


Command-Shift-G 

### 2. ...已被占用

```shell
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
```shell
pkgutil --pkgs
```
#####(2)列出所关联的文件
```shell
pkgutil --files com.Hackintosh.voodoohda287.Voodoo.pkg
```
#### UninstallPKG(要钱的)
[UninstallPKG][2]
#### pkg_uninstaller(貌似没用)
[pkg_uninstaller][1]
##### Installation

Installation is as simple as:

```shell
[sudo] bash < <(curl -sL https://raw.github.com/mpapis/pkg_uninstaller/master/pkg-install)
```

Adding to PATH, for system installation (with sudo):

```shell
echo 'PATH=$PATH:/opt/pkg_uninstaller' >> /etc/profile
```

Adding PATH when installed as user (without sudo):

```shell
echo 'PATH=$PATH:$HOME/.pkg_uninstaller' >> $HOME/.bash_profile
```

Note the single quotes are important in both cases.

##### Installing package file

Install packages with:

```shell
pkg-install <package_file.pkg>
```

This will create `uninstall_<package_file_pkg>.sh` in current directory.

To uninstall this package just execute `./uninstall_<package_file_pkg>.sh`.

##### Uninstalling single packages by name.

List available package names (possibly filtering by [name]):

```shell
pkg-list [name]
```

Uninstall package:

```shell
pkg-uninstall <name>
```

##### Using internally in package to build uninstaller

- You have to bundle `pkg-wrapper` with your application 
  and install it to disk before executing the hook bellow.

- In before installing hook call this script:

```sh
#!/bin/bash

pkg-wrapper before "your package name"
```

- In after installing hook call this script:

```sh
#!/bin/bash

pkg-wrapper before "your package name" /path/to/uninstaller_name.sh
```

- In uninstall hook call:

```sh
#!/bin/bash

/path/to/uninstaller_name.sh
rm /path/to/uninstaller_name.sh
```


[1]:https://github.com/mpapis/pkg_uninstaller
[2]:http://www.corecode.at/uninstallpkg/

### 4.mac汇编语言


```shell
brew install nasm
```

### 5.字体
+ ~/资源库/Fonts/

  + /资源库/Fonts/

  + /系统/资源库/Fonts/

### 6.刻制原版安装盘

> OS X 系统下:

+ 打开磁盘工具，选择U盘，进行分区；

+ 分为一个300MB左右的名为EFI的FAT类型的盘，剩下的都为OS X扩展，命名为Install OS X El Capitan

+ 右击Install OS X El Capitan.app -> 显示包内容 -> Contents -> Resources -> 
  createinstallmedia , 复制该文件至桌面

+ 打开终端

````shell
sudo su
/Users/x/Desktop/createinstallmedia --volume /Volumes/Install/ --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app [--force]
````
开始写入镜像

+ 刻录完毕

