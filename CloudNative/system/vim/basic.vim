"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 定义快捷键的前缀，即<Leader>
" let mapleader=";"
"
" 定义快捷键到行首和行尾
" nmap LB 0
" nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
" vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
" nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
" nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
" nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
" nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
" nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
" nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
" nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
" nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
" nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
" nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
" nmap <Leader>M %
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件类型侦测
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 开启文件类型侦测
" filetype on
" 根据侦测到的不同类型加载对应的插件
" filetype plugin on
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 立即生效
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 搜索、vim 命令补全等设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vundle 环境设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 去除VI一致性
set nocompatible              " 必须
filetype off                  " 必须
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
" 让vundle管理插件版本
Plugin 'VundleVim/Vundle.vim'       " 必须
"
" 格式为 Plugin '用户名/插件仓库名'
"Plugin 'altercation/vim-colors-solarized'
"
"Plugin 'tomasr/molokai'
"
"Plugin 'vim-scripts/phd'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/DrawIt'
"Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-protodef'
"Plugin 'scrooloose/nerdtree'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
" 加载vim自带和插件相应的语法和文件类型相关脚本  
filetype plugin indent on                " 必须
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 主题配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 配色方案
" set background=dark
" colorscheme solarized
" colorscheme molokai
" colorscheme phd
"
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
" set guioptions-=l
" set guioptions-=L
" set guioptions-=r
" ser guioptions-=R
" 禁止显示菜单和工具条
" set guioptions-=m
" set guioptions-=T
"
"
"
"，必须借助第三方工具 wmctrl，一个控制窗口 XYZ 坐标、窗口尺寸的命令行工具。先自行安装 wmctrl
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
" fun! ToggleFullscreen()
"   call system("wmctrl -ir " . v:windowid . " -B TOGGLE,FULLscreen")
"   endf
"   " 全屏开/关快捷键
"   map <silent> <F11> :call ToggleFullscreen()<CR>
"   " 启动 vim 时自动全屏
"   autocmd VimEnter * call ToggleFullscreen()
"
"添加辅助信息
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
" set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap
"
" 前面介绍的主题风格对状态栏不起作用，需要借助插件 Powerline（https://github.com/Lokaltog/vim-powerline ）美化状态栏，在 .vimrc 中设定状态栏主题风格：
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 语法高亮 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 代码缩进 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
"
" /nathanaelkane/vim-indent-guides
" " 随 vim 自启动
" let g:indent_guides_enable_on_vim_startup=1
" " 从第二层开始可视化显示缩进
" let g:indent_guides_start_level=2
" " 色块宽度
" let g:indent_guides_guide_size=1
" " 快捷键 i 开/关缩进可视化
" :nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" end
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 代码缩进 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码
" set nofoldenable





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""










