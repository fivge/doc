everything start with 0 and 1, then everything.

### 网络

Nat + HostOnly

### 存储

#### 共享文件

#### 磁盘扩容

- 动态分配

- 固定分配

##### 动态分配

```bash

➜   df -hl

Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        5.4G     0  5.4G   0% /dev
tmpfs           5.4G     0  5.4G   0% /dev/shm
tmpfs           5.4G  9.2M  5.4G   1% /run
tmpfs           5.4G     0  5.4G   0% /sys/fs/cgroup
/dev/sda2       8.0G  7.5G  141M  99% /
/dev/sda2       8.0G  7.5G  141M  99% /var
/dev/sda2       8.0G  7.5G  141M  99% /boot/grub2/x86_64-efi
/dev/sda2       8.0G  7.5G  141M  99% /tmp
/dev/sda2       8.0G  7.5G  141M  99% /home
/dev/sda2       8.0G  7.5G  141M  99% /root
/dev/sda2       8.0G  7.5G  141M  99% /boot/grub2/i386-pc
/dev/sda2       8.0G  7.5G  141M  99% /srv
/dev/sda2       8.0G  7.5G  141M  99% /opt
/dev/sda2       8.0G  7.5G  141M  99% /usr/local
tmpfs           1.1G     0  1.1G   0% /run/user/1000

➜   df -hl /var/lib/docker

Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2       8.0G  7.5G  141M  99% /var

➜   du -sh /var/lib/docker

15G     /var/lib/docker
```

```bash
λ  C:\App\VirtualBox\VBoxManage.exe modifyhd .\suse-backup-202001021935.vdi  --resize 20480
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
```

```bash
linux-xtfn at ~ ❯ sudo fdisk -l

GPT PMBR size mismatch (16777215 != 41943039) will be corrected by write.
The backup GPT table is not on the end of the device. This problem will be corrected by write.
Disk /dev/sda: 20 GiB, 21474836480 bytes, 41943040 sectors
Disk model: VBOX HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 3F85C5FD-303D-4AA2-B715-638FCE94A5FB

Device     Start      End  Sectors Size Type
/dev/sda1   2048    18431    16384   8M BIOS boot
/dev/sda2  18432 16777182 16758751   8G Linux filesystem

linux-xtfn at ~ ❯ sudo parted -l
Warning: Not all of the space available to /dev/sda appears to be used, you can
fix the GPT to use all of the space (an extra 25165824 blocks) or continue with
the current setting?
Fix/Ignore? Fix
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sda: 21.5GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags: pmbr_boot

Number  Start   End     Size    File system  Name  Flags
 1      1049kB  9437kB  8389kB                     bios_grub
 2      9437kB  8590MB  8580MB  btrfs              legacy_boot


Error: /dev/sr0: unrecognised disk label
Model: VBOX CD-ROM (scsi)
Disk /dev/sr0: 59.5MB
Sector size (logical/physical): 2048B/2048B
Partition Table: unknown
Disk Flags:

linux-xtfn at ~ ❯ sudo fdisk -l
Disk /dev/sda: 20 GiB, 21474836480 bytes, 41943040 sectors
Disk model: VBOX HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 3F85C5FD-303D-4AA2-B715-638FCE94A5FB

Device     Start      End  Sectors Size Type
/dev/sda1   2048    18431    16384   8M BIOS boot
/dev/sda2  18432 16777182 16758751   8G Linux filesystem
```

<https://www.jianshu.com/p/ba7090b1ef38>

<https://www.cnblogs.com/youbiyoufang/p/7607174.html>

---

```bash
C:\App\VirtualBox\VBoxManage.exe modifyhd .\suse-backup-202001021935.vdi  --resize 20480

fdisk -l
parted -l
fdisk /dev/sda
pvcreate /dev/sda2
```

### ssh

### usb
