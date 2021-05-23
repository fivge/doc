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
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"快捷键。把 vim（非插件）常用操作设定成快捷键，提升效率：
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 立即生效。全文频繁变更 .vimrc，要让变更内容生效，一般的做法是先保存 .vimrc 再重启 vim，太繁琐了，增加如下设置，可以实现保存 .vimrc 时自动重启加载它：
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" " 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 搜索、vim 命令补全等设置：

" 开启实时搜索功能
" set incsearch
" " 搜索时大小写不敏感
" set ignorecase
" " 关闭兼容模式
" set nocompatible
" " vim 自身命令行模式智能补全
" set wildmenu
"
"
"
"
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vundle 环境设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""