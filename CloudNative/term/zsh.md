# zsh

### .zshrc

```bash
## 从bash打开桌面应用
alias typora="open -a typora"
## 清理那些.DS_Store文件
alias dsclean='find . -type f -name .DS_Store -delete'
## 解决...已被占用
alias fuck='xattr -d com.apple.FinderInfo'
## proxy
alias shadow='export http_proxy=http://127.0.0.1:1087;export https_proxy=$http_proxy'
```

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
