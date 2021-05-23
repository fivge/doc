---
title: macOS-Term
date: 2017-06-29 19:48:51
tags:
  - macOS
  - Term
---

### 3.oh-my-zsh

###### 安装

```shell
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

或者

```shell
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

###### 配置

编辑文件`.zshrc`

设置环境变量和别名

###### 主题

`.zshrc`里`ZSH_THEME`设置主题

相关文件在`~/.oh-my-zsh/themes`目录下

###### autojump

- mac

```shell
brew install autojump
```

- Linux

```shell
git clone git://github.com/joelthelion/autojump.git
```

最后把以下代码加入.zshrc：

```shell
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
```

智能跳转，安装了 autojump 之后，zsh 会自动记录你访问过的目录，通过`j +`目录名 可以直接进行目录跳转，而且目录名支持模糊匹配和自动补全，例如你访问过`hadoop-1.0.0`目录，输入`j hado` 即可正确跳转。`j –stat `可以看你的历史路径库。

###### 插件

oh-my-zsh 项目提供了完善的插件体系，相关的文件在~/.oh-my-zsh/plugins 目录下，默认提供了 100 多种，大家可以根据自己的实际学习和工作环境采用，想了解每个插件的功能，只要打开相关目录下的 zsh 文件看一下就知道了。插件也是在.zshrc 里配置，找到 plugins 关键字，你就可以加载自己的插件了，系统默认加载 git ，你可以在后面追加内容，如下：

plugins=(git textmate ruby autojump osx mvn gradle)

下面简单介绍几个：

- 1、git：当你处于一个 git 受控的目录下时，Shell 会明确显示 「git」和 branch，如上图所示，另外对 git 很多命令进行了简化，例如 gco=’git checkout’、gd=’git diff’、gst=’git status’、g=’git’等等，熟练使用可以大大减少 git 的命令长度，命令内容可以参考~/.oh-my-zsh/plugins/git/git.plugin.zsh
- 2、textmate：mr 可以创建 ruby 的框架项目，tm finename 可以用 textmate 打开指定文件。
- 3、osx：tab 增强，quick-look filename 可以直接预览文件，man-preview grep 可以生成 grep 手册 的 pdf 版本等。

###### 目录浏览和跳转

输入 d，即可列出你在这个会话里访问的目录列表，输入列表前的序号，即可直接跳转。

在当前目录下输入 .. 或 … ，或直接输入当前目录名都可以跳转，你甚至不再需要输入 cd 命令了。

###### 通配符搜索

```shell
ls -l */.sh
```

可以递归显示当前目录下的 shell 文件，文件少时可以代替 find，文件太多就歇菜了。

### 4.vim

```shell
wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x
```

### 5.macvim

###### 安装 macvim

<https://github.com/macvim-dev/macvim/releases>

```
1）安装 MacVim.app
```

```
2）将mvim脚本文件拷贝到"/usr/local/bin"目录下。输入命令"mvim"快速启动MacVim 。
```

​

### 6.Tmux

###### 安装

```shell
brew install tmux
```

### 7.Powerline

###### 安装 powerline

```shell
### 安装python
brew install python
### 安装powerline
brew install coreutils
pip install powerline-status
### 查看powerline安装位置
pip show powerline-status
```

###### 安装缺失字体

```shell
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
### 进入终端偏好设置,设置默认字体即可
```

###### 配置 zsh

```shell
vim .zshrc
### start .zshrc
# Using powerline
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
### end .zshrc
source ~/.zshrc
```

###### 配置 vim

```shell
vim .vimrc
### start .vimrc
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set guifont=Sauce\ Code\ Powerline:h14.5
set laststatus=2
set encoding=utf-8
set t_Co=256
set number
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set background=light
### end .vimrc
source .vimrc
```

### 8.列出磁盘

```shell
diskutil list
```
