# wsl

### 1. 安装

<https://learn.microsoft.com/zh-cn/windows/wsl/install>

```bash
wsl --list --online

```

<https://docs.microsoft.com/zh-cn/windows/wsl/about>

> install

<https://docs.microsoft.com/en-us/windows/wsl/install>

>

```powershell
wsl -l -o

wsl -l -v


wsl --set-version <distro name> 2
wsl --set-version Debian 2
```

### 2. 配置

> arch

<https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/>

> 参考的对象类型不支持尝试的操作

<https://github.com/microsoft/WSL/issues/4194>

<https://answers.microsoft.com/zh-hans/insider/forum/all/wsl2%E5%AE%89%E8%A3%85kali/b6dd4c62-1130-4a7c-9462-1e9e5f38dab2>

执行 netsh winsock reset ,可以启动

> 使用代理

```bash
## 获取主机 IP
## 主机 IP 保存在 /etc/resolv.conf 中
export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')

## 配置代理
export http_proxy="socks5://${hostip}:7890"
export https_proxy="socks5://${hostip}:7890"
## 或者
export all_proxy="socks5://${hostip}:7890"

## 取消配置
unset all_proxy
```

> 高级配置

[WSL 中的高级设置配置](https://learn.microsoft.com/zh-CN/windows/wsl/wsl-config)

例如: WSL 是否会将 Windows 路径元素添加到 $PATH 环境变量

### 3. 常用软件

`screenfetch`

`git`

`zsh` `oh-my-zsh`

`vim`

### 4. 开发环境

`node`

`go`

`rust`

`c`系列

`VS Code`

```bash
export PATH=$PATH:/mnt/c/App/Microsoft\ VS\ Code/bin
```

### 5. Q&A

#### Q1

> ```bash
>  ➜  ~ tmux
>  couldn't create directory /run/tmux/1000 (No such file or directory)
> ```

A:

<https://github.com/microsoft/WSL/issues/2530>

1、 `zshrc`

```bash
export TMUX_TMPDIR='/tmp'
```

2、 systemd

```bash
sudo systemd-tmpfiles --create
```
