---
title: .zshrc
date: 2018-05-16 22:52:30
tags:
  - zsh
  - Term
categories:
  - Term
---

### .zshrc

```bash
## 从bash打开桌面应用
alias typora="open -a typora"
## 清理那些.DS_Store文件
alias dsclean='find . -type f -name .DS_Store -delete'
## 解决...已被占用
alias fuck='xattr -d com.apple.FinderInfo'
alias shadow='export http_proxy=http://127.0.0.1:1087;export https_proxy=$http_proxy'
```
