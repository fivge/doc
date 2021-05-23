---
title: Linux1.1 基本概念及操作
tags:
- Linux
date: 2016-10-25 15:14:32
---

#快捷键

+ `Ctrl+c`	强行终止当前程序
  + `Ctrl+d`键盘输入结束或退出终端
  + `Ctrl+s`暂定当前程序，暂停后按下任意键恢复运行
  + `Ctrl+z`将当前程序放到后台运行
    + `命令 &` 后台运行
    + `jobs`查看后台进程
    + `fg`恢复到前台
    + `bg`继续运行
    + `sleep 5000`命令停止5000（s）
  + `Ctrl+a`将光标移至输入行头，相当于Home键
  + `Ctrl+e`将光标移至输入行末，相当于End键
  + `Ctrl+k`删除从光标所在位置到行末
  + `Alt+Backspace`向前删除一个单词
  + `Shift+PgUp`将终端显示向上滚动
  + `Shift+PgDn`将终端显示向下滚动
+ `Tab` 自动补全（命令、文件）,按两下，查找相关；
+ `上下箭头`查看已经输入命令
+ `Esc`上一个参数

<!-- more -->

#通配符

+ `*`	匹配 0 或多个字符
  + `?`匹配任意一个字符
  + `[list]`匹配 list 中的任意单一字符
  + `[!list]`匹配 除list 中的任意单一字符以外的字符
  + `[c1-c2]`匹配 c1-c2 中的任意单一字符 如：[0-9] [a-z]
  + `{string1,string2,...}`匹配 sring1 或 string2 (或更多)其一字符串
  + `{c2..c2}`匹配 c1-c2 中全部字符 如{1..10}

#基本操作
+ `date` 查看时间
    + `-s` 20:52:02 设置时间（sudo）
+ `cal 日历
+ `uptime 运行时间等
+ `shutdown` + 时间
    + `-h` 关机
    + `-r`重启
    + 时间 : now +10 25:52
+ `poweroff` 关机
+ `reboot `   立即重启
    六、查找
+ `locate` 关键字  快速查找（从数据库）
    + `updatedb` 更新数据库
+ `find` 查找位置 查找参数

```shell
find . -name *keyword*   #在当前目录查找文件名中包含"keyword"的文件
find / -name *.conf     #在根目录中查找文件名以".conf"结尾的文件
find / -perm 777   #在根目录中查找权限为"777"的文件
find / -type d   #在根目录中查找类型为"d"(目录)的文件
find . -name "a*" -exec ls -l {}  \;  
```

+ `id`显示当前用户信息
+ `passwd`修改密码