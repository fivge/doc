---
title: Tmux
date: 2016-11-19 20:47:12
tags:
- Tmux
- Term
categories:
- Term
---

### 安装

> CentOS 

```shell
sudo yum install tmux
```

> macOS

```shell
brew install tmux
```

### 基础

```shell
### 运行
tmux
### 关闭
Ctrl + d
### 或退出
exit
```

### 快捷键

**Tmux的快捷键的触发为`Ctrl+b`，下文简记为`C-b`**

<!-- more -->

- `?` 查看帮助
- `d` detach当前会话,输入`tmux attach`可重新进入

![](http://ww1.sinaimg.cn/large/006tKfTcly1femc4u97z4j31kw0qwe84.jpg)

###### Windows操作

- `c` 新建窗口
- `&` 关闭当前窗口
- `w` 列出所有窗口
- `p` 切换到上一个窗口
- `n`切换到下一个窗口
- `{0-n}`  切换到窗口号
- `,` 重命名当前窗口

**在新的会话界面，您可以在底部看到绿色的 Tmux 会话记录，\* 号标记的会话表示当前的会话。**

###### Pane操作

- `%` 横向分屏
- `"` 纵向分屏
- `方向键` 选择个面板
- `q` 显示面板编号

###### Session操作

- `s` 选择并切换会话

```shell
# 创建一个新的session
$ tmux new -s <name-of-my-session>
# 在当前session中创建一个新的Session, 并保证之前session依然存在
# C-b : 然后输入下面命令
new -s <name-of-my-new-session>
# 进入名为test的session
$ tmux attach -t test
```

### 美化

<https://github.com/gpakosz/.tmux>

```shell
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

> ###### Features

C-a acts as secondary prefix, while keeping default C-b prefix
visual theme inspired by Powerline
maximize any pane to a new window with <prefix> +
SSH aware username and hostname status line information
mouse mode toggle with <prefix> m
automatic usage of reattach-to-user-namespace if available
laptop battery status line information
uptime status line information
optional highlight of focused pane (tmux 2.1+)
configurable new windows and panes behavior (optionally retain current path)
SSH aware split pane (reconnects to remote server, experimental)
Facebook PathPicker integration if available
Urlview integration if available
This configuration uses the following bindings:

<prefix> C-c creates a new session
<prefix> e opens ~/.tmux.conf.local with the editor defined by the $EDITOR environment variable (defaults to vim when empty)
<prefix> r reloads the configuration
<prefix> C-f lets you switch to another session by name
<prefix> C-h and <prefix> C-l let you navigate windows (default <prefix> n and <prefix> p are unbound)
<prefix> Tab brings you to the last active window
<prefix> h, <prefix> j, <prefix> k and <prefix> l let you navigate panes ala Vim
<prefix> H, <prefix> J, <prefix> K, <prefix> L let you resize panes
<prefix> < and <prefix> > let you swap panes
<prefix> + maximizes the current pane to a new window
<prefix> m toggles mouse mode on or off
<prefix> U launches Urlview (if available)
<prefix> F launches Facebook PathPicker (if available)
<prefix> Enter enters copy-mode
<prefix> b lists the paste-buffers
<prefix> p pastes from the top paste-buffer
<prefix> P lets you choose the paste-buffer to paste from
C-l clears both the screen and the history
Additionally, vi-choice, vi-edit and vi-copy named tables are adjusted to closely match my own Vim configuration

Bindings for the vi-choice mode-table:

h collapses the current tree node
l expands the current tree node
H collapses all the tree nodes
L expands all the tree nodes
K jumps to the start of list (tmux 2.0+)
L jumps to the end of list (tmux 2.0+)
Escape cancels the current operation
Bindings for the vi-edit mode-table:

H jumps to the start of line
L jumps to the end of line
q cancels the current operation
Escape cancels the current operation
Bindings for the vi-copy mode-table:

v begins selection / visual mode
C-v toggles between blockwise visual mode and visual mode
H jumps to the start of line
L jumps to the end of line
y copies the selection to the top paste-buffer
Escape cancels the current operation
The "maximize any pane to a new window with <prefix> +" feature is different from builtin resize-pane -Z as it allows you to further split a maximized pane. It's also more flexible by allowing you to maximize a pane to a new window, then change window, then go back and the pane is still in maximized state in its own window. You can then minimize a pane by using <prefix> + either from the source window or the maximized window.



------

参考文章:

- <https://linux.cn/article-5399-1.html>
- <https://linux.cn/article-5666-1.html>
- <https://linux.cn/article-3952-1.html>
- <https://github.com/tmuxinator/tmuxinator>
- <http://skwp.github.io/dotfiles/>
- <https://github.com/benmills/vimux>
- <https://github.com/antono/shelr>
- <https://github.com/altercation/solarized>
- <https://github.com/jimeh/tmuxifier