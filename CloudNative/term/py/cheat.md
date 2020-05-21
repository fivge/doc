---
title: cheat
date: 2018-01-06 22:56:36
tags:
  - cheat
  - Term
categories:
  - Term
---

### cheat

```bash
➜ cheat cheat
# To see example usage of a program:
cheat <command>

# To edit a cheatsheet
cheat -e <command>

# To list available cheatsheets
cheat -l

# To search available cheatsheets
cheat -s <command>

# To get the current `cheat' version
cheat -v
```

<!-- more -->

### 安装

```shell
sudo pip install cheat
```

### example

```shell
➜ cheat ls
# Displays everything in the target directory
ls path/to/the/target/directory

# Displays everything including hidden files
ls -a

# Displays all files, along with the size (with unit suffixes) and timestamp
ls -lh

# Display files, sorted by size
ls -S

# Display directories only
ls -d */

# Display directories only, include hidden
ls -d .*/ */
```
