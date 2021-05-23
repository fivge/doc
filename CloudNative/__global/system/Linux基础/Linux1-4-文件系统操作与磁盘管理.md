---
title: Linux1.4 文件系统操作与磁盘管理
date: 2016-10-25 15:25:29
tags:
  - Linux
---

## 简单文件系统操作

### 1.`df`（report file system disk space usage）

查看磁盘的容量

① 默认以 blocks 的大小展示

②`-h` 以更易读的方式展示

`rootfs` : （Root File System）它是 Ramfs（Ramfs 是一个非常简单的 Linux 文件系统用于实现磁盘缓存机制作为动态可调整大小的基于 ram 的文件系统）或者 tmpfs 的一个特殊实例，它作为系统启动时内核载入内存之后，在挂载真正的的磁盘之前的一个临时文件系统。通常的主机会在系统启动后用磁盘上的文件系统替换，只是在一些嵌入式系统中会只存在一个 rootfs ，或者运行在虚拟环境中共享主机资源的系统也可能会采用这种方式。

### 2.`du`（estimate file space usage）

查看目录的容量

① 默认同样以 blocks 的大小展示

②`-h` 以更易读的方式展示

③`-d` 指定查看目录的深度

<!-- more -->

只查看 1 级目录的信息

```shell
du -h -d 0 ~
```

查看 2 级

```shell
    du -h -d 1 ~
```

## 简单的磁盘管理

### 1.`dd` 转换和复制文件

`dd`默认从标准输入中读取，并写入到标准输出中

但可以用选项`if`（input file，输入文件）和`of`（output file，输出文件）改变。

- `bs`（block size）用于指定块大小（缺省单位为 Byte，也可为其指定如'K'，'M'，'G'等单位）

- `count`用于指定块数量。

① 输出到文件

```shell
 dd of=test bs=10 count=1
```

或者

```shell
dd if=/dev/stdin of=test bs=10 count=1
```

② 输出到标准输出

```shell
dd if=/dev/stdin of=/dev/stdout bs=10 count=1
```

上述命令从标准输入设备读入用户输入（缺省值，所以可省略）然后输出到 test 文件

③ 将输出的英文字符转换为大写再写入文件：

```shell
dd if=/dev/stdin of=test bs=10 count=1 conv=ucase
```

④ 使用 dd 命令创建虚拟镜像文件

从/dev/zero 设备创建一个容量为 256M 的空文件：

```shell
dd if=/dev/zero of=virtual.img bs=1M count=256
du -h virtual.img
```

### 2.`mkfs` 格式化磁盘

你可以在命令行输入 mkfs 然后按下 Tab 键，你可以看到很多个以 mkfs 为前缀的命令，这些不同的后缀其实就是表示着不同的文件系统，可以用 mkfs 格式化成的文件系统：

将虚拟磁盘镜像格式化为 ext4 文件系统：

```shell
mkfs.ext4 virtual.img
```

如果你想想知道 Linux 支持哪些文件系统你可以输入

```shell
ls -l /lib/modules/$(uname -r)/kernel/fs
```

### 3.`mount` 挂载磁盘到目录树

查看已经挂载的文件系统：

```shell
sudo mount
```

输出的结果中每一行表示一个设备或虚拟设备,每一行最前面是设备名，然后是 on 后面是挂载点，type 后面表示文件系统类型，再后面是挂载选项（比如可以在挂载时设定以只读方式挂载等等）。

mount [-o [操作选项]][-t 文件系统类型] [-w|--rw|--ro][文件系统源] [挂载点]

我们现在直接来挂载我们创建的虚拟磁盘镜像到/mnt 目录：

```shell
mount -o loop -t ext4 virtual.img /mnt
```

_也可以省略挂载类型，很多时候 mount 会自动识别_

以只读方式挂载

```shell
mount -o loop --ro virtual.img /mnt
```

或者

```shell
mount -o loop,ro virtual.img /mnt
```

### 4.`umount` 卸载已挂载磁盘

`sudo umount 已挂载设备名或者挂载点`

```shell
sudo umount /mnt
```

在类 UNIX 系统中，`/dev/loop`（或称 vnd （vnode disk）、`lofi`（循环文件接口））是一种伪设备，这种设备使得文件可以如同块设备一般被访问。

在使用之前，循环设备必须与现存文件系统上的文件相关联。这种关联将提供给用户一个应用程序接口，接口将允许文件视为块特殊文件（参见设备文件系统）使用。因此，如果文件中包含一个完整的文件系统，那么这个文件就能如同磁盘设备一般被挂载。

这种设备文件经常被用于光盘或是磁盘镜像。通过循环挂载来挂载包含文件系统的文件，便使处在这个文件系统中的文件得以被访问。这些文件将出现在挂载点目录。如果挂载目录中本身有文件，这些文件在挂载后将被禁止使用。

### 5.`fdisk` 为磁盘分区

查看硬盘分区表信息

```shell
sudo fdisk -l
```

进入磁盘分区模式

```shell
sudo fdisk virtual.img
```

### 6.综合

使用 losetup 命令建立镜像与回环设备的关联

```shell
sudo losetup /dev/loop0 virtual.img
```

**如果提示设备忙你也可以使用其它的回环设备,`ls /dev/loop`看所有回环设备**

解除设备关联
​

```shell
sudo losetup -d /dev/loop0
```

然后再使用 mkfs 格式化各分区（前面我们是格式化整个虚拟磁盘镜像文件或磁盘），不过格式化之前，我们还要为各分区建立虚拟设备的映射，用到 kpartx 工具，需要先安装：

```shell
sudo apt-get install kpartx
sudo kpart kpartx -av /dev/loop0
```

取消映射
​

```shell
sudo kpart kpartx -dv /dev/loop0
```

接着再是格式化，我们将其全部格式化为 ext4：

```shell
sudo mkfs.ext4 -q /dev/mapper/loop0p1
sudo mkfs.ext4 -q /dev/mapper/loop0p5
sudo mkfs.ext4 -q /dev/mapper/loop0p6
```

格式化完成后在/media 目录下新建四个空目录用于挂载虚拟磁盘：

```shell
mkdir -p /media/virtualdisk_{1..3}
```

挂载磁盘分区

```shell
sudo mount /dev/mapper/loop0p1 /media/virtualdisk_1
sudo mount /dev/mapper/loop0p5 /media/virtualdisk_2
sudo mount /dev/mapper/loop0p6 /media/virtualdisk_3
```

卸载磁盘分区

```shell
sudo umount /dev/mapper/loop0p1
sudo umount /dev/mapper/loop0p5
sudo umount /dev/mapper/loop0p6
```

然后：

```shell
df -h
```
