> ..已被占用

```bash
⚒ xattr -l /Volumes/App/【安装包】/Mac/硬件概要.md                            ~
com.apple.FinderInfo:
00000000  62 72 6F 6B 4D 41 43 53 00 00 00 00 00 00 00 00  |brokMACS........|
00000010  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
00000020
com.apple.TextEncoding: utf-8;134217984

⚒ xattr -d com.apple.FinderInfo /Volumes/App/【安装包】/Mac/硬件概要.md
```

> ntfs

```bash
Mac:~ x$ ls /Volumes/
App			OS X			Win10 OS
Mac			Tuxera NTFS 2014	用户

Mac:~ x$ diskutil info /Volumes/用户 | grep UUID
   Volume UUID:              47C13D50-07B9-4D48-AEA0-6B1543F8339E
   Disk / Partition UUID:    427F3E08-3EFD-4D57-8B8D-4A5C0DD8FDF4

Mac:~ x$ echo "UUID=47C13D50-07B9-4D48-AEA0-6B1543F8339E none ntfs rw,auto,nobrowse" | sudo tee -a /etc/fstab

UUID=47C13D50-07B9-4D48-AEA0-6B1543F8339E none ntfs rw,auto,nobrowse
```
