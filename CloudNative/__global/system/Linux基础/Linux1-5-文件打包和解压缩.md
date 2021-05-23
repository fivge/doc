---
title: Linux1.5 文件打包和解压缩
tags:
- Linux
date: 2016-10-25 15:28:08
---

文件后缀名 	说明    
*.zip 	        zip程序打包压缩的文件    
*.rar 	        rar程序压缩的文件    
*.7z 	        bzip2程序压缩的文件    
*.tar 	        tar程序打包，未压缩的文件    
*.gz 	        gzip程序(GNU zip)压缩的文件    
*.xz 	        xz程序压缩的文件    
*.bz2 	        bzip2程序压缩的文件    
*.tar.gz 	tar打包，gzip程序压缩的文件    
*.tar.xz 	tar打包，xz程序压缩的文件    
*tar.bz2 	tar打包，bzip2程序压缩的文件    
*.tar.7z 	tar打包，7z程序压缩的文件    

<!-- more -->

#1. Zip
##① 压缩文件
`-r`	递归打包包含子目录的全部内容;    
`-q`	安静模式，即不向屏幕输出信息;    
`-o`	输出文件，需在其后紧跟打包输出文件名;    
`-[1-9]`	设置压缩级别,1表示最快压缩但体积大，9表示体积最小但耗时最久；    
`-e`	创建加密压缩包    
`-x`	排除指定文件    
`-l`	        将LF转换为CR+LF以解决Win上兼容性问题    

`du`	查看打包后文件的大小     
`-h`,--human-readble（顾名思义）    
`-d`,--max-depth	所查看文件的深度    

```shell
du -h archive.zip
```
du命令分别查看默认压缩级别、最低、最高压缩级别及未压缩的文件的大小

```shell
du -h -d 0 *.zip ~ | sort
```
##② 查看压缩包内容
```shell
unzip -l archive.zip
```
##③  解压
```shell
unzip archive.zip
```
`-d`	解压到指定目录
​    
```shell
unzip archive.zip -d ziptest    
```
中文编码问题    
`-O`	指定编码类型    

```shell
unzip -O GBK 中文压缩文件.zip
```

```shell
unzip -qdO GBK 中文压缩文件.zip 解压目录
```
#2. Rar
##① 压缩文件
```shell
rar a archive.rar file1 file2 file3
```
**注意：rar的命令参数没有`-`**

##② 删除文件
```shell
rar d archive.rar file3
```
##③ 查看文件
```shell
rar l archive.rar
```
##④ 解压文件
###1)全路径解压
```shell
unrar x archive.rar
```
###2)去掉路径解压              
```shell
mkdir tmp
unrar e archive.rar tmp/
```
#3. Tar

不进行压缩只是进行打包（创建归档文件）和解包的操作

`-v`/--verbose	以可视的方式输出文件    
`-f`/--file	后面紧跟文件名(*.tar)    
`-c`/--create	创建文档    
`-t`/--list	列出归档文件的内容    
`-x`/--ectract	提取文档    
`-u`/--update	对文档进行更新，向文档中加入内容    
`--delete`	从文档中删除文件    

##① 创建文档 
```shell
tar -cvf archive.tar file1 file2 file3
```
##② 列出归档文件内容
```shell
tar -tvf archive.tar 
```
##③ 提取归档
```shell
tar -xvf archive.tar 
```
`--wildcards`	提取指定文件    

```shell
tar -xvf archive.tar --wildcards '*.c'
```
`-C`	提取到制定目录    

```shell
tar -xvf archive.tar -C /home/tar
```
##④ 对归档文件进行更新
```shell
tar -uvf archive.tar newfile
```
##⑤ 从文档中删除文件
```shell
tar --delete -f archive.tar file3
```
##⑥ 保留文件属性和跟随链接（符号链接或软链接）
`-p`	保留文件的属性    
`-h`	保留链接指向的源文件而不是链接本身    
`-P`	保留绝对路径符    

##⑦ 压缩/解压文件
*.tar.gz        `-z`    
*.tar.xz        `-J`    
*.tar.bz2        `-j`    

```shell
tar -zcvf archive.tar.gz file1 file2 file3        
tar -zxvf archive.tar.gz    
```
#4. Gzip

##① 压缩文件
```shell
gzip file1 file2 file3
```
每个文件将被单独压缩

通常在压缩完成后，它会将原来的文件删除。    
我们可以使用` -c` 选项来保留原来的文件。    

```shell
gzip -c file > file.gz    
```
将一组文件压缩到一个单独的文件中    

```shell
cat file1 file2 file3 | gzip > archieve.gz
```

② 检查压缩比

```shell
gzip -l archieve.gz
```
③ 解压文件

```shell
gunzip  archieve.gz
gzip -d archieve.gz
```
**原有的（压缩）文件在被解压后同样会被删除**。    
使用 `-c`选项来保留原始文件。    

```shell
gunzip -c archieve.gz
gzip -cd archieve.gz > archieve
```
#5. Bzip2

① 压缩文件

```shell
bzip2 file1 file2 file3
```
每个文件将被**单独压缩**    
使用 `-k` 选项可以使得在压缩或解压缩之后保留原有的文件。

② 解压

```shell
bunzip2 archieve.bz2
bzip2 -d archieve.bz2

bunzip2 -c archieve.bz2 > archieve
bzip2 -cd archieve.bz2 > archieve
```
bunzip2 可以解压后缀名为 bz2, bz, tbz2 和 tbz 的文件。带有 tbz2 和 tbz 的文件在解压后，后缀名将变为'.tar' 。

#6. 7-zip
在 Linux 下，可以通过 p7zip 软件包得到，
该软件包里包含 3 个二进制文件： 7z, 7za 和 7zr。

##① 创建归档
```shell
7zr a archive.7z file-name(s) / directory-name(s)
7zr a -t7z archive.7z file1 file2 file3
```
##② 列出归档包含文件
```shell
7zr l archive.7z
```
##③ 提取归档文件
```shell
7zr e archive.7z
```
##④ 更新归档文件
```shell
7zr u archive.7z newfile
```
##⑤ 从归档文件中删除文件
```shell
7zr d archive.7z file3
```