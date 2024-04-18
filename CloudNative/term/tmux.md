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

```shell
# CentOS
sudo yum install tmux
# macOS
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

**Tmux 的快捷键的触发为`Ctrl+b`，下文简记为`C-b`**

- `?` 查看帮助
- `d` detach 当前会话,输入`tmux attach`可重新进入

###### Windows 操作

- `c` 新建窗口
- `&` 关闭当前窗口
- `w` 列出所有窗口
- `p` 切换到上一个窗口
- `n`切换到下一个窗口
- `{0-n}` 切换到窗口号
- `,` 重命名当前窗口

**在新的会话界面，您可以在底部看到绿色的 Tmux 会话记录，\* 号标记的会话表示当前的会话。**

###### Pane 操作

- `%` 横向分屏
- `"` 纵向分屏
- `方向键` 选择个面板
- `q` 显示面板编号

###### Session 操作

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

https://github.com/gpakosz/.tmux

```shell
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

参考文章:

- https://linux.cn/article-5399-1.html
- https://linux.cn/article-5666-1.html
- https://linux.cn/article-3952-1.html
- https://github.com/tmuxinator/tmuxinator
- http://skwp.github.io/dotfiles/
- https://github.com/benmills/vimux
- https://github.com/antono/shelr
- https://github.com/altercation/solarized
- https://github.com/jimeh/tmuxifier
