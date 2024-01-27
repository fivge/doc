---
title: Windows安装
date: 2016-01-11 23:39:32
categories:
  - Windows
---

## Windows 安装

### 0x01 名词解释

- 镜像

  常用镜像下载网站[I tell you](http://msdn.itellyou.cn)

- Bios，UEFI

- 分区格式:GPT,MBR

### 0x02 安装前的准备

#### (1) 检查刻录镜像

如果电脑是 4G 及以上的内存，则安装 64 位的操作系统

如果电脑的内存为 2G 或更低，则安装 64 位的操作系统

#### (2) 直接安装法

直接双击`setup.exe`安装

Win8,Win8.1 及 Win10 下直接双击镜像文件即可;

Win7 及更低版本需解压镜像文件(一般解压到非系统盘(一般为 C 盘)下，以免安装失败)

#### (3) 启动盘安装法

- 使用软件刻录镜像到 U 盘，制造启动盘

~~Win 下推荐使用[软碟通](https://drive.google.com/open?id=0BzUyH3cJ-_5gVDY3bXJyX0VYeGs)进行刻录~~

Windows 下使用[rufus](https://github.com/pbatard/rufus/)进行刻录

![](https://img.0x64.in/2023/05/32ffbb6072012726c7ea86815d8de48e.jpg)

![](https://img.0x64.in/2023/05/f589f4923b34cb4a45b623132768bb9a.jpg)

![](https://img.0x64.in/2023/05/10896ca1206cce243c663f7d2d670977.jpg)

![](https://img.0x64.in/2023/05/6ec60487923c7a9767fe532b48b4e02f.jpg)

![](https://img.0x64.in/2023/05/fb76f48ff7a539c5c7357ab06730ee23.jpg)

- 开机按`F2`或`F12`(一般这俩键了)进入`Bios`
- 设置 Bios 中 U 盘为第一启动项
- `F10`保存并退出(一般是 F10)

![](https://img.0x64.in/2023/05/86b86e43dd78f41b38aa7a00aaf9328e.jpg)

![](https://img.0x64.in/2023/05/37134a8e3469b4e12b1fe1a4618b483b.jpg)

#### (4) 进入 PE 安装系统

首先，刻录 WinPE 到 U 盘，然后进入 PE 安装系统

推荐使用[微 PE](http://www.wepe.com.cn)刻录 WinPE

**推荐使用第二种方法安装系统, 若原系统能进入，可使用第一种方法**

### 0x03 开始安装系统

#### 安装 XP

#### 安装 Win7

安装 Win7 有两种方法

- 如果电脑支持 UEFI 启动，那么就选择 UEFI+GPT 的安装方法

- 如果电脑不支持 UEFI,只支持 Bios，那么就选择 Bios+MBR 的安装方法

#### 安装 Win8 && Win8.1

#### 安装 Win10

安装 Win8,Win8.1 及 Win10 一般都使用 UEFI+GPT 的方案

- 原系统内，直接进去 CMD 就好(别问我什么是 CMD)
- 如果进入系统安装界面了，则按 Shift+F10 调出 CMD

然后输入:

```
diskpart
list disk    //列出所有磁盘
sel disk 0    //选择磁盘0
convert GPT    //将磁盘转换成GPT格式的(如果是GPT的就不要转换了)
create partition EFI size=300    (选择EFI为300M是为了安装其他系统(如Mac)方便)
create partition MSR size=128
exit
exit
```

**convert GPT[^1]**

[^1]: 若无法转换，可在 PE 下通过磁盘工具无损转换分区格式

![](https://img.0x64.in/2023/05/27ca61a20d23735a5ced12c2d74df5d3.jpg)

![](https://img.0x64.in/2023/05/efd054c573c555c6c65d5678b0180e63.jpg)

### 0x04 安装之后

#### 激活 Windows

安装系统之后使用 KMS 激活，如想体验正版 Win10，可加入[Insider 计划](https://insider.windows.com)免费激活 Win10

---

**激活器**

- 激活 Win10 及 Office2016[KMSpico Portable](https://drive.google.com/open?id=0BzUyH3cJ-_5gZXZzZFJoS1ZhdUk)先以管理员身份运行`Auto (Run as Admin).cmd` ,再以管理员身份运行`AutoPico.exe`
- 激活 Windows 及 Office 常用 [HEU KMS Activator v10.0.0](https://drive.google.com/open?id=0BzUyH3cJ-_5gaXhXNjlmYVpYeW8)
- 如无法激活可尝试使用[KMSpico_Install.3987](https://drive.google.com/open?id=0BzUyH3cJ-_5gV0ZCMnY1eklIbzQ)

#### 设置 Win8，Win8.1 及 Win10 自动登录

运行`（Win+R）`->输入“netplwiz”后进入
