---
title: macOS中vim使用系统剪贴板
date: 2017-04-09
tags: 
- macOSTerm
- vim
categories:
- macOS
---

### vim使用系统剪贴板

```bash
vim .vimrc
# START `.vimrc`
set clipboard+=unnamed
# END `.vimrc`
sudo rm /usr/bin/vim
brew install vim
```

### 参考链接

<https://coderwall.com/p/fv7r0q/fix-vim-after-upgrading-to-yosemite>