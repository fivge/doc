---
title: vim
date: 2018-02-04 03:51:00
update: 2018-05-16 23:03:00
tags:
- vim
- Term
categories:
- Term
---

### VIM配置

##### 0x01 Vundle

> 插件管理工具
>
> <https://github.com/VundleVim/Vundle.vim>

```basic
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
" Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后
```

```basic
" 简要帮助文档

" :PluginList       - 列出所有已配置的插件

" :PluginInstall    - 安装插件,追加 ! 用以更新或使用 :PluginUpdate

" :PluginSearch foo - 搜索 foo ; 追加 ! 清除本地缓存

" :PluginClean      - 清除未使用插件,需要确认; 追加 ! 自动批准移除未使用插件
```

<!--more-->

##### 0x02 YouCompleteMe

> 自动补全插件(待配置,已安装)
>
> <https://github.com/Valloric/YouCompleteMe>

##### 0x03 语法高亮

<https://github.com/vim-syntastic/syntastic>

##### 0x04 状态栏(不喜)

<https://github.com/vim-airline/vim-airline>

##### 0x05 主题

<https://github.com/tomasr/molokai>

<https://github.com/altercation/vim-colors-solarized>

<https://github.com/nathanaelkane/vim-indent-guides>

<https://github.com/flazz/vim-colorschemes>

##### 0x06 alpertuna/vim-header

> 自动插入头文件(不好用)

<https://github.com/alpertuna/vim-header>

*F4自动添加作者信息*

##### 快捷键

空格 可折叠代码

##### 0x07 .vimrc(待配置)

```basic
" mac使用系统剪贴板
set clipboard+=unnamed
" 文件编码
set encoding=utf-8
```

```basic
"显示行号
set nu

"启动时隐去援助提示
set shortmess=atI

"语法高亮
syntax on

"使用vim的键盘模式
"set nocompatible

"不需要备份
set nobackup

"没有保存或文件只读时弹出确认
set confirm

"鼠标可用
set mouse=a

"tab缩进
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

"文件自动检测外部更改
set autoread

"c文件自动缩进
set cindent

"自动对齐
set autoindent

"智能缩进
set smartindent

"高亮查找匹配
set hlsearch

"背景色
set background=dark

"显示匹配
set showmatch

"显示标尺，就是在右下角显示光标位置
set ruler

"去除vi的一致性
set nocompatible

"允许折叠
set foldenable
"""""""""""""""""设置折叠"""""""""""""""""""""
"
"根据语法折叠
set fdm=syntax

"手动折叠
"set fdm=manual

"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"不要闪烁
set novisualbell

"启动显示状态行
set laststatus=2

"浅色显示当前行
autocmd InsertLeave * se nocul

"用浅色高亮当前行
autocmd InsertEnter * se cul

"显示输入的命令
set showcmd

"被分割窗口之间显示空白
set fillchars=vert:/

set fillchars=stl:/

set fillchars=stlnc:/
```

##### 0x08 重新加载vim配置

 在vim中执行:

```basic
:source %
```

即重新加载当前文件

##### 0x09 盘古之白

<https://github.com/hotoo/pangu.vim>

> 如果想在其他格式的文件中使用这个功能，可以执行 `:Pangu` 命令

##### 0x0A Usful link

> 插件平台
>
>  <https://vimawesome.com>

