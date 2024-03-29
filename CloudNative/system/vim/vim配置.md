### Vim配置



http://www.jianshu.com/p/a0b452f8f720

https://github.com/ma6174/vim

https://github.com/tomasr/molokai/tree/master/colors

https://github.com/yangyangwithgnu/use_vim_as_ide



### 插件管理

既然本文主旨在于讲解如何通过插件将 vim 打造成中意的 C/C++ IDE，那么高效管理插件是首要解决的问题。

vim 自身希望通过在 .vim/ 目录中预定义子目录管理所有插件（比如，子目录 doc/ 存放插件帮助文档、plugin/ 存放通用插件脚本），vim 的各插件打包文档中通常也包含上述两个（甚至更多）子目录，用户将插件打包文档中的对应子目录拷贝至 .vim/ 目录即可完成插件的安装。一般情况下这种方式没问题，但我等重度插件用户，.vim/ 将变得混乱不堪，至少存在如下几个问题：

- 插件名字冲突。所有插件的帮助文档都在 doc/ 子目录、插件脚本都在 plugin/ 子目录，同个名字空间下必然引发名字冲突；
- 插件卸载易误。你需要先知道 doc/ 和 plugin/ 子目录下哪些文件是属于该插件的，再逐一删除，容易多删/漏删。

我希望每个插件在 .vim/ 下都有各自独立子目录，这样需要升级、卸载插件时，直接找到对应插件目录变更即可；另外，我希望所有插件清单能在某个配置文件中集中罗列，通过某种机制实现批量自动安装/更新/升级所有插件。vundle（[https://github.com/VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim) ）为此而生，它让管理插件变得更清晰、智能。

vundle 会接管 .vim/ 下的所有原生目录，所以先清空该目录，再通过如下命令安装 vundle：

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

接下来在 .vimrc 增加相关配置信息：

```
" vundle 环境设置
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
```

其中，每项

```
Plugin 'dyng/ctrlsf.vim'

```

对应一个插件（这与 go 语言管理不同代码库的机制类似），后续若有新增插件，只需追加至该列表中即可。vundle 支持源码托管在 [https://github.com/](https://github.com/) 的插件，同时 vim 官网 [http://www.vim.org/](http://www.vim.org/) 上的所有插件均在 [https://github.com/vim-scripts/](https://github.com/vim-scripts/) 有镜像，所以，基本上主流插件都可以纳入 vundle 管理。具体而言，仍以 ctrlsf.vim 为例，它在 .vimrc 中配置信息为 dyng/ctrlsf.vim，vundle 很容易构造出其真实下载地址 [https://github.com/dyng/ctrlsf.vim.git](https://github.com/dyng/ctrlsf.vim.git) ，然后借助 git 工具进行下载及安装。

此后，需要安装插件，先找到其在 github.com 的地址，再将配置信息其加入 .vimrc 中的call vundle#begin() 和 call vundle#end() 之间，最后进入 vim 执行

```
:PluginInstall
```

便可通知 vundle 自动安装该插件及其帮助文档。比如，我在 .vimrc 中添加了 4 个插件：

```
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
```

要卸载插件，先在 .vimrc 中注释或者删除对应插件配置信息，然后在 vim 中执行`:PluginClean
`即可删除对应插件。插件更新频率较高，差不多每隔一个月你应该看看哪些插件有推出新版本，批量更新，只需执行`:PluginUpdate
`即可。你得注意插件的下载源。同名插件在 github.com 上可能有多个，比如，indexer 插件，至少就有 [https://github.com/vim-scripts/indexer.tar.gz](https://github.com/vim-scripts/indexer.tar.gz) 、[https://github.com/everzet/vim-indexer](https://github.com/everzet/vim-indexer) 、[https://github.com/shemerey/vim-indexer](https://github.com/shemerey/vim-indexer) 等三个，到底应该选哪个呢？以我的经验来看，对于钟意的插件，我会先找其作者的个人网站，上面通常会罗列出托管在 github.com 的具体地址；若没有，我会找该插件在 vim.org 的页面，上面也会有 github.com 托管地址；若还是没有，再以 github 和插件名作为关键字搜索，点赞数多的，通常是你想找的。为节约你找插件地址的时间，本文中出现的每个插件我都会附上其地址。非特殊情况，后文介绍到的插件不再累述如何安装。通过 vundle 管理插件后，切勿通过发行套件自带的软件管理工具安装任何插件，不然 .vim/ 又要混乱了。



### 界面美化



> 主题

### 主题风格

一套好的配色方案绝对会影响你的编码效率，vim 内置了 10 多种配色方案供你选择，GUI 下，可以通过菜单（Edit -> Color Scheme）试用不同方案，字符模式下，需要你手工调整配置信息，再重启 vim 查看效果（csExplorer 插件，可在字符模式下不用重启即可查看效果）。不满意，可以去 [http://vimcolorschemetest.googlecode.com/svn/html/index-c.html](http://vimcolorschemetest.googlecode.com/svn/html/index-c.html) 慢慢选。我自认为“阅美无数”，目前最夯三甲：

- 素雅 solarized（[https://github.com/altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) ）
- 多彩 molokai（[https://github.com/tomasr/molokai](https://github.com/tomasr/molokai) ）
- 复古 phd（[http://www.vim.org/scripts/script.php?script_id=3139](http://www.vim.org/scripts/script.php?script_id=3139) ）

在 .vimrc 中选用某个主题：

```
" 配色方案
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd
```

其中，不同主题都有暗/亮色系之分，这样三种主题六种风格，久不久换一换，给你不一样的心情：



>营造专注氛围

如今的 UX 设计讲究的是内容至上，从 GNOME3 的变化就能看出。编辑器界面展示的应全是代码，不应该有工具条、菜单、滚动条浪费空间的元素，另外，编程是种精神高度集中的脑力劳动，不应出现闪烁光标、花哨鼠标这些分散注意力的东东。配置如下：

```
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
```

>还容易分神？好吧，我们把 vim 弄成全屏模式。vim 自身无法实现全屏，必须借助第三方工具 wmctrl，一个控制窗口 XYZ 坐标、窗口尺寸的命令行工具。先自行安装 wmctrl，再在 .vimrc 中增加如下信息：

```
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()
```

上面是一段简单的 vimscript 脚本，外部命令 wmctrl 及其命令行参数控制将指定窗口 windowid（即，vim）全屏，绑定快捷键 F11 实现全屏/窗口模式切换（linux 下各 GUI 软件约定使用 F11 全屏，最好遵守约定），最后配置启动时自动全屏。

### 3.3 添加辅助信息

去除了冗余元素让 vim 界面清爽多了，为那些实用辅助信息腾出了空间。光标当前位置、显示行号、高亮当前行/列等等都很有用：

```
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
```

>其他美化

默认字体不好看，挑个自己喜欢的，前提是你得先安装好该字体。中文字体，我喜欢饱满方正的（微软雅黑），英文字体喜欢圆润的（Consolas），vim 无法同时使用两种字体，怎么办？有人制作发布了一款中文字体用微软雅黑、英文字体用 Consolas 的混合字体 —— yahei consolas hybrid 字体，号称最适合中国程序员使用的字体，效果非常不错（本文全文采用该字体）。在 .vimrc 中设置下：

```
" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
```

其中，由于字体名存在空格，需要用转义符“\”进行转义；最后的 11.5 用于指定字体大小。

代码折行也不太美观，禁止掉：

```
" 禁止折行
set nowrap
```

前面介绍的主题风格对状态栏不起作用，需要借助插件 Powerline（[https://github.com/Lokaltog/vim-powerline](https://github.com/Lokaltog/vim-powerline) ）美化状态栏，在 .vimrc 中设定状态栏主题风格：

```
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
```





### 代码分析

阅读优秀开源项目源码是提高能力的重要手段，营造舒适、便利的阅读环境至关重要。

### 4.1 语法高亮

代码只有一种颜色的编辑器，就好像红绿灯只有一种颜色的路口，全然无指引。现在已是千禧年后的十年了，早已告别上世纪六、七十年代黑底白字的时代，即使在字符模式下编程（感谢伟大的 fbterm），我也需要语法高亮。所幸 vim 自身支持语法高亮，只需显式打开即可：

```
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
```



vim 对 C++ 语法高亮支持不够好（特别是 C++11/14 新增元素），必须借由插件 vim-cpp-enhanced-highlight（[https://github.com/octol/vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight) ）进行增强。



vim-cpp-enhanced-highlight 主要通过 .vim/bundle/vim-cpp-enhanced-highlight/after/syntax/cpp.vim 控制高亮关键字及规则，所以，当你发现某个 STL 容器类型未高亮，那么将该类型追加进 cpp.vim 即可。如，initializer_list 默认并不会高亮，需要添加`syntax keyword cppSTLtype initializer_list`



### 代码缩进

C/C++ 中的代码执行流由复合语句控制，如 if(){} 判断复合语句、for(){} 循环符号语句等等，这势必出现大量缩进。缩进虽然不影响语法正确性，但对提升代码清晰度有不可替代的功效。

在 vim 中有两类缩进表示法，一类是用 1 个制表符（'\t'），一类是用多个空格（' '）。两者并无本质区别，只是源码文件存储的字符不同而已，但，缩进可视化插件对两类缩进显示方式不同，前者只能显示为粗块，后者可显示为细条，就我的审美观而言，选后者。增加如下配置信息：

```
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
```

其中，注意下 expandtab、tabstop 与 shiftwidth、softtabstop、retab：

- expandtab，把制表符转换为多个空格，具体空格数量参考 tabstop 和 shiftwidth 变量；
- tabstop 与 shiftwidth 是有区别的。tabstop 指定我们在插入模式下输入一个制表符占据的空格数量，linux 内核编码规范建议是 8，看个人需要；shiftwidth 指定在进行缩进格式化源码时制表符占据的空格数。所谓缩进格式化，指的是通过 vim 命令由 vim 自动对源码进行缩进处理，比如其他人的代码不满足你的缩进要求，你就可以对其进行缩进格式化。缩进格式化，需要先选中指定行，要么键入 = 让 vim 对该行进行智能缩进格式化，要么按需键入多次 < 或 > 手工缩进格式化；
- softtabstop，如何处理连续多个空格。因为 expandtab 已经把制表符转换为空格，当你要删除制表符时你得连续删除多个空格，该设置就是告诉 vim 把连续数量的空格视为一个制表符，即，只删一个字符即可。通常应将这tabstop、shiftwidth、softtabstop 三个变量设置为相同值；

另外，你总会阅读其他人的代码吧，他们对制表符定义规则与你不同，这时你可以手工执行 vim 的 retab 命令，让 vim 按上述规则重新处理制表符与空格关系。

很多编码规范建议缩进（代码嵌套类似）最多不能超过 4 层，但难免有更多层的情况，缩进一多，我那个晕啊：



我希望有种可视化的方式能将相同缩进的代码关联起来，Indent Guides（[https://github.com/nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) ）来了。安装好该插件后，增加如下配置信息：

```
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
```



断节？Indent Guides 通过识别制表符来绘制缩进连接线，断节处是空行，没有制表符，自然绘制不出来，算是个小 bug，但瑕不掩瑜，有个小技巧可以解决，换行-空格-退格：



### 代码折叠

有时为了去除干扰，集中精力在某部分代码片段上，我会把不关注部分代码折叠起来。vim 自身支持多种折叠：手动建立折叠（manual）、基于缩进进行折叠（indent）、基于语法进行折叠（syntax）、未更改文本构成折叠（diff）等等，其中，indent、syntax 比较适合编程，按需选用。增加如下配置信息：

```
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
```

操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠



### 接口与实现快速切换

我习惯把类的接口和实现分在不同文件中，常有在接口文件（MyClass.h）和实现文件（MyClass.cpp）中来回切换的操作。你当然可以先分别打开接口文件和实现文件，再手动切换，但效率不高。我希望，假如在接口文件中，vim 自动帮我找到对应的实现文件，当键入快捷键，在新 buffer 中打开对应实现文件。

vim-fswitch（[https://github.com/derekwyatt/vim-fswitch](https://github.com/derekwyatt/vim-fswitch) ）来了。安装后增加配置信息：

```
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

```

这样，键入 ;sw 就能在实现文件和接口文件间切换

### 代码收藏

源码分析过程中，常常需要在不同代码间来回跳转，我需要“收藏”分散在不同处的代码行，以便需要查看时能快速跳转过去，这时，vim 的书签（mark）功能派上大用途了。

vim 书签的使用很简单，在你需要收藏的代码行键入 mm，这样就收藏好了，你试试，没反应？不会吧，难道你 linux 内核编译参数有问题，或者，vim 的编译参数没给全，让我想想，别急，喔，对了，你是指看不到书签？好吧，我承认这是 vim 最大的坑，书签所在行与普通行外观上没任何差别，肉眼，你是找不到他滴。这可不行，得来个让书签可视化的插件，vim-signature（[https://github.com/kshenoy/vim-signature](https://github.com/kshenoy/vim-signature) ）。vim-signature 通过在书签所在行的前面添加字符的形式，以此可视化书签，这就要求你源码安装的 vim 具备 signs 特性，具体可在 vim 命令模式下键入

```
:echo has('signs')

```

若显示 1 则具备该特性，反之 0 则不具备该特性，需参考“1 源码安装编辑器 vim ”重新编译 vim。

vim 的书签分为两类，独立书签和分类书签。独立书签，书签名只能由字母（a-zA-Z）组成，长度最多不超过 2 个字母，并且，同个文件中，不同独立书签名中不能含有相同字母，比如，a 和 bD 可以同时出现在同个文件在，而 Fc 和 c 则不行。分类书签，书签名只能由可打印特殊字符（!@#$%^&*()）组成，长度只能有 1 个字符，同个文件中，你可以把不同行设置成同名书签，这样，这些行在逻辑上就归类成相同类型的书签了。下图定义了名为 a 和 dF 两个独立书签（分别 259 行和 261 行）、名为 # 的一类分类书签（含 256 行和 264 行）、名为 @ 的一类分类书签（257 行）



两种形式的书签完全分布在各自不同的空间中，所以，它俩的任何操作都是互不相同的，比如，你无法遍历所有书签，要么只能在各个独立书签间遍历，要么只能在分类书签间遍历。显然，两种形式的书签都有各自的使用场景，就我而言，只使用独立书签，原因有二：一是独立书签可保存，当我设置好独立书签后关闭文档，下次重新打开该文档时，先前的独立书签仍然有效，而分类书签没有该特性（其他文档环境恢复参见“6.3 环境恢复”）；一是减少记忆快捷键，光是独立书签就有 8 种遍历方式，每种遍历对应一种快捷键，太难记了。

vim-signature 快捷键如下：

```
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

```

够多了吧，粗体部分是按个人习惯重新定义的快捷键，请添加进 .vimrc 中。

常用的操作也就如下几类：

- 书签设定。mx，设定/取消当前行名为 x 的标签；m,，自动设定下一个可用书签名，前面提说，独立书签名是不能重复的，在你已经有了多个独立书签，当想再设置书签时，需要记住已经设定的所有书签名，否则很可能会将已有的书签冲掉，这可不好，所以，vim-signature 为你提供了 m, 快捷键，自动帮你选定下一个可用独立书签名；mda，删除当前文件中所有独立书签。
- 书签罗列。m?，罗列出当前文件中所有书签，选中后回车可直接跳转；
- 书签跳转。mn，按行号前后顺序，跳转至下个独立书签；mp，按行号前后顺序，跳转至前个独立书签。书签跳转方式很多，除了这里说的行号前后顺序，还可以基于书签名字母顺序跳转、分类书签同类跳转、分类书签不同类间跳转等等。

我虽然选用了 vim-signature，但不代表它完美了，对我而言，无法在不同文件的书签间跳转绝对算是硬伤。另外，如果觉得收藏的代码行只有行首符号来表示不够醒目，你可以考虑 BOOKMARKS--Mark-and-Highlight-Full-Lines 这个插件（[https://github.com/vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines](https://github.com/vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines) ），它可以让书签行高亮，如下是它的快捷键：，高亮所有书签行；，关闭所有书签行高亮；，清除 [a-z] 的所有书签；，收藏当前行；，取消收藏当前行。

### 4.6 标识符列表

本节之前的内容，虽说与代码开发有些关系，但最多也只能算作用户体验层面的，真正提升生产效率的内容将从此开始。

本文主题是探讨如何将 vim 打造成高效的 C/C++ 开发环境，希望实现标识符列表、定义跳转、声明提示、实时诊断、代码补全等等系列功能，这些都需要 vim 能够很好地理解我们的代码（不论是 vim 自身还是借助插件甚至第三方工具），如何帮助 vim 理解代码？基本上，有两种主流方式：标签系统和语义系统。至于优劣，简单来说，标签系统配置简单，而语义系统效果精准，后者是趋势。目前对于高阶 IDE 功能，部分已经有对应基于语义的插件支撑，而部分仍只能通过基于标签的方式实现，若同个功能既有语义插件又有标签插件，优选语义。

#### 标签系统

代码中的类、结构、类成员、函数、对象、宏等等这些统称为标识符，每个标识符的定义、所在文件中的行位置、所在文件的路径等等信息就是标签（tag）。

Exuberant Ctags（[http://ctags.sourceforge.net/](http://ctags.sourceforge.net/) ，后简称 ctags）就是一款经典的用于生成代码标签信息的工具 。ctags 最初只支持生成 C/C++ 语言，目前已支持 41 种语言，具体列表运行如下命令获取：

```
ctags --list-languages

```

学习知识最好方式就是动手实践。我们以 main.cpp、my_class.h、my_class.cpp 三个文件为例：

第一步，准备代码文件。创建演示目录 /data/workplace/example/、库子目录 /data/workplace/example/lib/，创建如下内容的 main.cpp：

```
#include <iostring> 
#include <string> 
#include "lib/my_class.h" 
using namespace std; 
int g_num = 128; 
// 重载函数 
static void 
printMsg (char ch) 
{ 
	std::cout << ch << std::endl; 
} 
int 
main (void) 
{ 
	// 局部对象
	const string	name = "yangyang.gnu"; 
	// 类 
	MyClass	one; 
	// 成员函数 
	one.printMsg(); 
	// 使用局部对象 
	cout << g_num << name << endl; 
	return	(EXIT_SUCCESS); 
} 

```

创建如下内容的 my_class.h：

```
#pragma once 
class MyClass 
{ 
	public: 
		void printMsg(void); 	 
	private: 
		; 
};

```

创建如下内容的 my_class.cpp：

```
#include "my_class.h" 
// 重载函数 
static void 
printMsg (int i) 
{ 
	std::cout << i << std::endl; 
} 
void 
MyClass::printMsg (void) 
{ 
	std::cout << "I'M MyClass!" << std::endl; 
}

```

第二步，生成标签文件。现在运行 ctags 生成标签文件：

```
cd /data/workplace/example/
ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++

```

命令行参数较多，主要关注 --c++-kinds，ctags 默认并不会提取所有标签，运行

```
ctags --list-kinds=c++ 

```

可看到 ctags 支持生成标签类型的全量列表：

```
c  classes 
d  macro definitions 
e  enumerators (values inside an enumeration) 
f  function definitions 
g  enumeration names 
l  local variables [off] 
m  class, struct, and union members 
n  namespaces 
p  function prototypes [off] 
s  structure names 
t  typedefs 
u  union names 
v  variable definitions 
x  external and forward variable declarations [off] 

```

其中，标为 off 的局部对象、函数声明、外部对象等类型默认不会生成标签，所以我显式加上所有类型。运行完后，example/ 下多了个文件 tags，内容大致如下：

```
!_TAG_FILE_FORMAT	2	/extended format; --format=1 will not append ;" to lines/ 
!_TAG_FILE_SORTED	1	/0=unsorted, 1=sorted, 2=foldcase/ 
!_TAG_PROGRAM_AUTHOR	Darren Hiebert	/dhiebert@users.sourceforge.net/ 
!_TAG_PROGRAM_NAME	Exuberant Ctags	// 
!_TAG_PROGRAM_URL	http://ctags.sourceforge.net	/official site/ 
!_TAG_PROGRAM_VERSION	5.8	// 
MyClass	lib/my_class.h	/^class MyClass $/;"	c 
MyClass::printMsg	lib/my_class.cpp	/^MyClass::printMsg (void) $/;"	f	class:MyClass	signature:(void) 
MyClass::printMsg	lib/my_class.h	/^		void printMsg(void);$/;"	p	class:MyClass	access:public	signature:(void) 
endl	lib/my_class.cpp	/^	std::cout << "I'M MyClass!" << std::endl;$/;"	m	class:std	file: 
endl	lib/my_class.cpp	/^	std::cout << i << std::endl;$/;"	m	class:std	file: 
endl	main.cpp	/^	cout << g_num << name << endl;$/;"	l 
endl	main.cpp	/^	std::cout << ch << std::endl;$/;"	m	class:std	file: 
g_num	main.cpp	/^int g_num = 128;$/;"	v 
main	main.cpp	/^main (void) $/;"	f	signature:(void) 
name	main.cpp	/^	const string	name = "yangyang.gnu";$/;"	l 
one	main.cpp	/^	MyClass	one;$/;"	l 
printMsg	lib/my_class.cpp	/^MyClass::printMsg (void) $/;"	f	class:MyClass	signature:(void) 
printMsg	lib/my_class.cpp	/^printMsg (int i) $/;"	f	file:	signature:(int i) 
printMsg	lib/my_class.h	/^		void printMsg(void);$/;"	p	class:MyClass	access:public	signature:(void) 
printMsg	main.cpp	/^	one.printMsg();$/;"	p	file:	signature:() 
printMsg	main.cpp	/^printMsg (char ch) $/;"	f	file:	signature:(char ch) 
std::endl	lib/my_class.cpp	/^	std::cout << "I'M MyClass!" << std::endl;$/;"	m	class:std	file: 
std::endl	lib/my_class.cpp	/^	std::cout << i << std::endl;$/;"	m	class:std	file: 
std::endl	main.cpp	/^	std::cout << ch << std::endl;$/;"	m	class:std	file:

```

其中，! 开头的几行是 ctags 生成的软件信息忽略之，下面的就是我们需要的标签，每个标签项至少有如下字段（命令行参数不同标签项的字段数不同）：标识符名、标识符所在的文件名（也是该文件的相对路径）、标识符所在行的内容、标识符类型（如，l 表示局部对象），另外，若是函数，则有函数签名字段，若是成员函数，则有访问属型字段等等。

#### 语义系统

通过 ctags 这类标签系统在一定程度上助力 vim 理解我们的代码，对于 C 语言这类简单语言来说，差不多也够了。近几年，随着 C++11/14 的推出，诸如类型推导、lamda 表达式、模版等等新特性，标签系统显得有心无力，这个星球最了解代码的工具非编译器莫属，如果编译器能在语义这个高度帮助 vim 理解代码，那么我们需要的各项 IDE 功能肯定能达到另一个高度。

语义系统，编译器必不可少。GCC 和 clang 两大主流 C/C++ 编译器，作为语义系统的支撑工具，我选择后者，除了 clang 对新标准支持及时、错误诊断信息清晰这些优点之外，更重要的是，它在高内聚、低耦合方面做得非常好，各类插件可以调用 libclang 获取非常完整的代码分析结果，从而轻松且优雅地实现高阶 IDE 功能。你对语义系统肯定还是比较懵懂，紧接着的“基于语义的声明/定义跳转”会让你有更为直观的了解，现在，请跳转至“7.1 编译器/构建工具集成”，一是了解 clang 相较 GCC 的优势，二是安装好最新版 clang 及其标准库，之后再回来。

#### 基于标签的标识符列表

在阅读代码时，经常分析指定函数实现细节，我希望有个插件能把从当前代码文件中提取出的所有标识符放在一个侧边子窗口中，并且能能按语法规则将标识符进行归类，tagbar （[https://github.com/majutsushi/tagbar](https://github.com/majutsushi/tagbar) ）是一款基于标签的标识符列表插件，它自动周期性调用 ctags 获取标签信息（仅保留在内存，不落地成文件）。安装完 tagbar 后，在 .vimrc 中增加如下信息：

```
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

```

前面提过，ctags 默认并不会提取局部对象、函数声明、外部对象等类型的标签，我必须让 tagbar 告诉 ctags 改变默认参数，这是 tagbar_type_cpp 变量存在的主要目的，所以前面的配置信息中将局部对象、函数声明、外部对象等显式将其加进该变量的 kinds 域中。具体格式为

```
{short}:{long}[:{fold}[:{stl}]]

```

用于描述函数、变量、结构体等等不同类型的标识符，每种类型对应一行。其中，short 将作为 ctags 的 --c++-kinds 命令行选项的参数，类似：

```
--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v

```

long 将作为 short 的简要描述展示在 vim 的 tagbar 子窗口中；fold 表示这种类型的标识符是否折叠显示；stl 指定是否在 vim 状态栏中显示附加信息。