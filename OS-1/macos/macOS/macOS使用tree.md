---
title: macOS使用tree
date: 2018-04-11 00:04:46
tags:
- macOSTerm
- tree
categories:
- macOS
---

### 安装tree

```bash
brew install tree
```

*然而在使用tree的时候,macOS会显示中文为乱码*

在macOS终端中应添加参数`-N`

```bash
tree -N
```

来代替`tree`命令