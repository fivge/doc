# grub2

`/boot/grub/grub.cfg`

https://wiki.archlinuxcn.org/wiki/GRUB#

https://documentation.suse.com/zh-cn/sles/15-SP4/html/SLES-all/cha-grub2.html

```bash
grub2-mkconfig -o /boot/grub2/grub.cfg
```

> 重装 Grub

```
1.使用Deepin Live CD模式启动电脑，任何装有Grub2的系统的Live CD都可以。
2.进入Live CD系统后打开终端，挂载需要修复系统的 / 挂载到/mnt，可以利用gparted或者sudo fdisk -l命令查看，例如 需要修复系统的 /分区为/dev/sda1，那么终端执行：
 sudo mount /dev/sda1 /mnt
如果需要修复系统的/boot单独分了出来（假设为/dev/sda2），也要挂上，终端执行：
 sudo mount /dev/sda2 /mnt/boot
另外,将Live CD系统的/dev目录同时挂在/mnt下，终端执行：
 sudo mount --bind /dev /mnt/dev
然后使用chroot命令，将Live CD的 / 设为以前的 /，终端执行：
 sudo mount --bind /proc /mnt/proc
 sudo mount --bind /sys /mnt/sys
 sudo chroot /mnt
安装并刷新Grub设置(主板为Bios引导)，请终端执行：
 grub-probe -t device /boot/grub
 grub-install /dev/sda
 grub-install --recheck /dev/sda
 sudo update-grub
安装并刷新Grub设置(主板为UEFI引导)，请终端执行：
 grub-probe -t device /boot/grub
 grub-install --target=$(ls /usr/lib/grub/ | grep efi)
 grub-install --recheck /dev/sda
 sudo update-grub
至此，修复完成。
```
