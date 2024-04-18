powerline-status

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
