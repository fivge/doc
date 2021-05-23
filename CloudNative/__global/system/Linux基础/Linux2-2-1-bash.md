---
title: Linux2.2.1 bash
tags:
- shell
- Linux
date: 2016-10-26 14:24:30
---


#shell入门
显示当前使用shell

```shell
ps $$ 
ps -p $$
echo "$0"
```

显示登陆取得的shell

```shell
cat /etc/passwd
```

显示可用shell

```shell
cat /etc/shells 
```

<!-- more -->

显示已安装shell的完整路径

```shell
type -a zsh
```

临时改变shell
直接输入要使用的shell的名字，如

```shell
zsh
```

找出子shell的层级或临时shell的嵌套层级

```shell
echo "$SHLVL"
```

永久切换shell

```shell
chsh -s /bin/zsh
```
切换其他用户

```shell
sudo chsh -s /bin/zsh useranme
```

#shell的功能

`alias` 命令别名设置    
`type` 显示命令位置    
 ` -a` ,`-t` ,`-p`;    
`\[Enter]` 换行    

# 
查看当前的环境变量

```shell
env
env |less
env |more
env |grep 'NAME'
```
显示环境变量的值

使用下面任意一条命令显示环境变量HOME的值：

```shell
printenv HOME
echo "$HOME"
printf "%s\n" "$HOME"
```

增加或设定一个新环境变量

下面是bash，zsh，sh和ksh的语法：

```shell
## 语法 ##
VAR=value
FOO=bar
## 设定vim为默认文本编辑器 ##
EDITOR=vim
export $EDITOR
## 考虑安全性，设定默认shell连接超时时间 ##
TMOUT=300
export TMOUT
## 你可以直接使用export命令设定命令的搜素路径 ##
export PATH=$PATH:$HOME/bin:/usr/local/bin:/path/to/mycoolapps
```

然后，使用printenv或者echo或printf命令查看环境变量PATH，EDITOR，和TMOUT的值：

```shell
printenv PATH
echo "$EDITOR"
printf "%s\n" $TMOUT
```

怎么修改一个现有的环境变量？

下面是语法：

```shell
export VAR=value
## 或者 ##
VAR=value
export $VAR
## 把默认文本编辑器从vim改为emacs ##
echo "$EDITOR" ## <--- 屏幕输出vim
EDITOR=emacs   ## <--- 修改
export $EDITOR ## <--- 让修改在其他会话生效
echo "$EDITOR" ## <--- 屏幕输出emacs 
```

tcsh shell下增加和修改变量的语法是下面这样的：

```shell
## 语法
setenv var value
printenv var
## 设置变量foo的值为bar ##
setenv foo bar
echo "$foo"
printenv foo
## 设置变量PATH ##
setenv PATH $PATH\:$HOME/bin
echo "$PATH"
## 设置变量PAGER ##
setenv PAGER most
printf "%s\n" $PAGER
```

找出bash shell的配置文件

用下面的命令列出bash shell的文件：

```shell
ls -l ~/.bash* ~/.profile /etc/bash* /etc/profile
```
要查看所有的bash配置文件，输入：

```shell
less ~/.bash* ~/.profile /etc/bash* /etc/profile
```

可以使用文字编辑器比如vim或emacs来一个一个编辑bash配置文件：

```shell
vim ~/.bashrc
```

编辑/etc/目录下的文件，输入：

```shell
## 首先是备份，以防万一
sudo cp -v /etc/bashrc /etc/bashrc.bak.22_jan_15
########################################################################
## 然后，随心所欲随便改吧，好好玩玩shell环境或者提高一下效率:)                 ##
########################################################################
sudo vim /etc/bashrc
```
找出zsh shell配置文件

zsh的wiki中建议用下面的命令：

```shell
strings =zsh | grep zshrc
```

示例输出：

```shell
/etc/zshrc
.zshrc
```

输入下面的命令列出你的zsh shell文件：

```shell
ls -l /etc/zsh/* /etc/profile ~/.z*
```

查看所有zsh配置文件：

```shell
less /etc/zsh/* /etc/profile ~/.z*
```

找出ksh shell配置文件

```shell
查看~/.profile或者/etc/profile文件。
```

找出tcsh shell配置文件

```shell
C shell查看~/.login，~/.cshrc文件。
TC shell查看~/.tcshrc和~/.cshrc文件。
```

我可以写个类似这样每次登录时都自动执行的脚本吗？

是的，把你的命令或别名或其他设定添加到~/.bashrc（bash shell）或者~/.profile（sh/ksh/bash）或者~/.login（csh/tcsh）文件中。
我可以写个类似这样每次登出都自动执行的脚本吗？

是的，把你的命令或别名或其他设定添加到~/.bash_logout（bash）或者~/.logout（csh/tcsh）文件。
history：获取关于shell会话的更多信息

输入history命令来查看本次会话的历史：

```shell
history
```

输入history 20来查看命令历史的后20条：

```shell
history 20
```

你可以重复使用之前的命令。简单地按下[上]或[下]方向键就可以查看之前的命令。在shell提示符下按下[CTRL-R]可以向后搜索历史缓存或文件来查找命令。重复最后一次命令，只需要在shell提示符下输入!!就好了：

```shell
ls -l /foo/bar
!!
```

在以上的历史记录中找到命令#93 (hddtemp /dev/sda)，输入：

```shell
!93
```

使用sudo或su改变用户

下面是语法：

```shell
su userName
## 登录为tom用户 ##
su tom
## 为用户tom打开一个新的shell会话 ##
su tom
## 登录为root用户 ##
su -
## sudo命令语法（必须在系统中配置有这个命令） ##
sudo -s
sudo tom
```

shell别名

别名仅仅是命令的一个快捷方式。
列出所有的别名

```shell
alias
```

设定一个别名

bash/zsh语法：

```shell
alias c='clear'
alias down='sudo /sbin/shutdown -h now'
```

shell函数

bash/ksh/zsh函数允许你更进一步地配置shell环境。在这个例子中，我写了一个简单的名叫memcpu()的bash函数，用来显示前10个最占用CPU和内存的进程：

```shell
memcpu() { echo "*** Top 10 cpu eating process ***"; ps auxf | sort -nr -k 3 | head -10;
echo  "*** Top 10 memory eating process ***"; ps auxf | sort -nr -k 4 | head -10;  }
```

输入memcpu就可以在屏幕上看到下面的信息：

```shell
memcpu
```

#综合一下：定制你自己的Linux或Unix bash shell工作环境

现在，你将使用bash shell配置自己的环境。我只介绍bash。但是理论上zsh，ksh和其他常用shell都差不多。让我们看看如何调整shell来适合我作为系统管理员的需求。编辑你的~/.bashrc文件来附加设定。下面是一些常用的配置选项。
##1: 设定bash路径和环境变量

```shell
# 设定路径 ##
export PATH=$PATH:/usr/local/bin:/home/vivek/bin:/opt/firefox/bin:/opt/oraapp/bin
# 为cd命令设定路径
export CDPATH=.:$HOME:/var/www
```

使用less或more命令作为翻页器：

```shell
export PAGER=less
```

设定vim作为默认文本编辑器：

```shell
export EDITOR=vim
export VISUAL=vim
export SVN_EDITOR="$VISUAL"
```

设定Oracle数据库特别要求的参数：

```shell
export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
export ORACLE_SID=XE
export NLS_LANG=$($ORACLE_HOME/bin/nls_lang.sh)
```

设定JAVA_HOME和其他java路径，比如java版本：

```shell
export JAVA_HOME=/usr/lib/jvm/java-6-sun/jre
# 把ORACLE和JAVA加入到PATH里
export PATH=$PATH:$ORACLE_HOME/bin:$JAVA_HOME/bin
```

使用密钥实现免密码登录让ssh远程登录更安全：

```shell
# 再也不用输密码了
/usr/bin/keychain $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOSTNAME-sh
```

最后，打开bash命令补齐

```shell
source /etc/bash_completion
```

##2: 设定bash命令提示符

设定定制的bash提示符(PS1):

```shell
PS1='{\u@\h:\w }\$ '
```

##3: 设定默认文件权限

```shell
## 设定默认权限为644 ##
umask 022
```

##4: 调整shell命令历史设定

```shell
# 不往命令历史里写入相同的行
HISTCONTROL=ignoreboth
# 忽略这些命令
HISTIGNORE="reboot:shutdown *:ls:pwd:exit:mount:man *:history"
# 通过HISTSIZE和HISTFILESIZE设定命令历史的长度
export HISTSIZE=10000
export HISTFILESIZE=10000
# 为命令历史文件增加时间戳
export HISTTIMEFORMAT="%F %T "
# 附加到命令历史文件，而不是覆盖
shopt -s histappend
```

##5: 设定shell会话的时区

```shell
## 为我自己的shell会话设定IST（印度标准时间） ##
TZ=Asia/Kolkata
```

##6: 设定shell行编辑接口

```shell
## 使用vi风格的行编辑接口，替代bash默认的emacs模式 ##
set -o vi
```

##7: 设定自己喜好的别名

```shell
## 增加一些保护 ##
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
## Memcached ##
alias mcdstats='/usr/bin/memcached-tool 10.10.29.68:11211 stats'
alias mcdshow='/usr/bin/memcached-tool 10.10.29.68:11211 display'
alias mcdflush='echo "flush_all" | nc 10.10.29.68 11211'
## 默认命令参数 ##
alias vi='vim'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias bc='bc -l'
alias wget='wget -c'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias rm='rm -I --preserve-root'
alias ln='ln -i'
```

下面是一些额外的OS X Unix bash shell别名：

```shell
# 从bash打开桌面应用
alias preview="open -a '$PREVIEW'"
alias safari="open -a safari"
alias firefox="open -a firefox"
alias chrome="open -a google\ chrome"
alias f='open -a Finder '
# 清理那些.DS_Store文件
alias dsclean='find . -type f -name .DS_Store -delete'
```

##8: 寡人好色

```shell
# 彩色的grep输出 
alias grep='grep --color=auto'
export GREP_COLOR='1;33'
# 彩色的ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'
# Gnu/linux的ls
ls='ls --color=auto'
# BSD/os x的ls命令
# alias ls='ls -G'
```

##9: 设定自己喜好的bash函数

```shell
# 在屏幕上显示10个最近的历史命令
function ht {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
# host和ping命令的替代
# 接受http:// 或 https:// 或 ftps:// 名称用作域或主机名
_getdomainnameonly(){
    local h="$1"
    local f="${h,,}"
    # remove protocol part of hostname
        f="${f#http://}"
        f="${f#https://}"
    f="${f#ftp://}"
    f="${f#scp://}"
    f="${f#scp://}"
    f="${f#sftp://}"
    # remove username and/or username:password part of hostname
    f="${f#*:*@}"
    f="${f#*@}"
    # remove all /foo/xyz.html*  
    f=${f%%/*}
    # show domain name only
    echo "$f"
}
ping(){
    local array=( $@ )          # get all args in an array
    local len=${#array[@]}          # find the length of an array
    local host=${array[$len-1]}     # get the last arg
    local args=${array[@]:0:$len-1} # get all args before the last arg in $@ in an array 
    local _ping="/bin/ping"
    local c=$(_getdomainnameonly "$host")
    [ "$t" != "$c" ] && echo "Sending ICMP ECHO_REQUEST to \"$c\"..."
    # pass args and host
    $_ping $args $c
}
host(){
    local array=( $@ )
    local len=${#array[@]}
    local host=${array[$len-1]}
    local args=${array[@]:0:$len-1}
    local _host="/usr/bin/host"
    local c=$(_getdomainnameonly "$host")
    [ "$t" != "$c" ] && echo "Performing DNS lookups for \"$c\"..."
    $_host $args $c
}
```

##10: 通过shell shopt命令设定bash shell行为

最后，你可以使用set和shopt命令调整bash shell环境：

```shell
# 目录拼写纠正
shopt -q -s cdspell
# 保证每次终端窗口改变大小后会更新显示
shopt -q -s checkwinsize
# 打开高级模式匹配功能
shopt -q -s extglob
# 退出时附加命令历史而不是覆盖
shopt -s histappend
# 在命令历史使用多行
shopt -q -s cmdhist
# 在后台任务结束时立刻通知
set -o notify
# 禁用[CTRL-D]来结束shell
set -o ignoreeof
```
