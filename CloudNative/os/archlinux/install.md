```shell
wifi-menu
ping 163.com
lsblk -l
mount /dev/sda5 /mnt
mkdir -p /mnt/boot
mount /dev/sdb1 /mnt/boot

vim /etc/pacman.d/mirrorlist
/China
2dd
Crrl + o
p
dG

pacman -Syy
pacstrap -i /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc

nano /etc/locale.gen
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
zh_TW.UTF-8 UTF-8

locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo myhostname > /etc/hostname

vim /etc/hosts
127.0.0.1	localhost.localdomain	localhost
::1		localhost.localdomain	localhost
127.0.1.1	myhostname.localdomain	myhostname

Internet

passwd
exit
reboot
```
