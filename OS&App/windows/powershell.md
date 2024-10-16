# powershell

https://github.com/PowerShell/PowerShell

https://learn.microsoft.com/zh-cn/powershell/scripting/learn/shell/using-light-theme?view=powershell-7.4

https://learn.microsoft.com/zh-cn/windows/terminal/tutorials/custom-prompt-setup

https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode

https://github.com/hardhackerlabs/theme-windows-terminal/tree/f9cf3d596582c2ae7cc2424d4428df4065327f00

```powershell
winget install JanDeDobbeleer.OhMyPosh
```

https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2

---

## openssh

安装

https://github.com/PowerShell/Win32-OpenSSH/wiki/Install-Win32-OpenSSH

卸载自带的

https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse

## 桌面

https://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1894735

任务栏卡顿

https://docs.microsoft.com/en-us/answers/questions/661639/how-do-i-make-the-windows-11-taskbar-always-on-top.html

https://github.com/dechamps/RudeWindowFixer

https://blogs.windows.com/windows-insider/2022/03/02/announcing-windows-11-insider-preview-build-22567/

```
win11 任务栏，放在顶上
10多年的任务栏置顶习惯太难改了终于找到了。
\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3
第一个fe下方数字改成01或者其他就可以改变位置了，改完重启资源管理器。我已经改成置顶了。舒服。要是打开位置也在中间就更舒服了
第一个fe下面的03（默认底部），改成其他的如01就是置顶，改成02就是靠右，00靠左
```

## nodejs

wtf is `corepack`

## powershell

https://docs.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup

### ohmyposh

https://ohmyposh.dev/

### winget

https://docs.microsoft.com/zh-cn/windows/package-manager/winget/

---

https://github.com/JanDeDobbeleer/oh-my-posh

https://blog.walterlv.com/post/beautify-powershell-like-zsh.html

https://sspai.com/post/59380

https://blog.ixk.me/say-goodbye-to-the-ugly-and-hard-to-use-windows-terminal-and-build-a-good-powershell.html

为了更加美观实用，我们还可以添加一个图标。我事先准备了一个 GPU 的图标并将之命名为 gpu.png（因为我这台内网服务器是学校训练用的 GPU 服务器），将图标同样放置在 Windows Terminal 素材文件夹 RoamingState 里，并向刚刚创建的环境入口配置中填入图标的定义：
