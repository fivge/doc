---
title: Linux字处理 grep
date: 2017-07-05 23:23:25
tags:
  - grep
categories:
  - Term
---

### Linux 字处理 grep

```bash
➜ cheat grep
# Search a file for a pattern
grep pattern file

# Case insensitive search (with line numbers)
grep -in pattern file

# Recursively grep for string <pattern> in folder:
grep -R pattern folder

# Read search patterns from a file (one per line)
grep -f pattern_file file

# Find lines NOT containing pattern
grep -v pattern file

# You can grep with regular expressions
grep "^00" file  #Match lines starting with 00
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" file  #Find IP add

# Find all files which match {pattern} in {directory}
# This will show: "file:line my research"
grep -rnw 'directory' -e "pattern"

# Exclude grep from your grepped output of ps.
# Add [] to the first letter. Ex: sshd -> [s]shd
ps aux | grep '[h]ttpd'

# Colour in red {bash} and keep all other lines
ps aux | grep -E --color 'bash|$'
```

<!-- more -->

- `-l` 列出包含指定模式的文件的文件名

* `-n` 在文件中查找指定模式并显示匹配行的行号

- `-v` 输出不包含指定模式的行

* `^` 输出所有以某指定模式开头的行

```bash
grep ^#     ## 输出以`#`开头的行
grep -v ^#  ## 输出不以`#`开头的行
```

- `$` 输出所有以指定模式结尾的行

```bash
grep sh$    ## 输出以sh结尾的行
```

- `-r` 递归地查找特定模式

```bash
grep ^$    ## 查找空行
```

- `-i` 在查找时忽略字符的大小写

* `-e` 查找多个模式

- `-f` 用文件指定待查找的模式

```bash
# cat grep_pattern
^linuxtechi
# grep -f grep_pattern /etc/passwd
```

- `-c` 计算模式匹配到的数量

```bash
 # 输出匹配指定模式行的前或者后面N行
 grep -B 4 "games" /etc/passwd      ## 参数输出匹配行的前4行
 grep -A 4 "games" /etc/passwd      ## 输出匹配行的后4行
 grep -C 4 "games" /etc/passwd      ## 输出匹配行的前后各4行
```
