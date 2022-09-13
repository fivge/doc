---
title: macOS安装pip
date: 2018-01-06 22:43:43
tags:
- macOSTerm
- pip
categories:
- macOS
---

### 安装pip

```shell
wget https://bootstrap.pypa.io/get-pip.py 
sudo python get-pip.py   ### sudo!!!
```

**必须要加上`sudo`!!!**

否则

```shell
Exception:
Traceback (most recent call last):
  File "/var/folders/42/2tm5fmvn5jb1lzqgch18j9m80000gn/T/tmp5PFp91/pip.zip/pip/basecommand.py", line 215, in main
    status = self.run(options, args)
  File "/var/folders/42/2tm5fmvn5jb1lzqgch18j9m80000gn/T/tmp5PFp91/pip.zip/pip/commands/install.py", line 342, in run
    prefix=options.prefix_path,
  File "/var/folders/42/2tm5fmvn5jb1lzqgch18j9m80000gn/T/tmp5PFp91/pip.zip/pip/req/req_set.py", line 784, in install
    **kwargs
  File "/var/folders/42/2tm5fmvn5jb1lzqgch18j9m80000gn/T/tmp5PFp91/pip.zip/pip/req/req_install.py", line 851, in install
    self.move_wheel_files(self.source_dir, root=root, prefix=prefix)
  File "/var/folders/42/2tm5fmvn5jb1lzqgch18j9m80000gn/T/tmp5PFp91/pip.zip/pip/req/req_install.py", line 1064, in move_wheel_files
    isolated=self.isolated,
  File "/var/folders/42/2tm5fmvn5jb1lzqgch18j9m80000gn/T/tmp5PFp91/pip.zip/pip/wheel.py", line 345, in move_wheel_files
    clobber(source, lib_dir, True)
  File "/var/folders/42/2tm5fmvn5jb1lzqgch18j9m80000gn/T/tmp5PFp91/pip.zip/pip/wheel.py", line 316, in clobber
    ensure_dir(destdir)
  File "/var/folders/42/2tm5fmvn5jb1lzqgch18j9m80000gn/T/tmp5PFp91/pip.zip/pip/utils/__init__.py", line 83, in ensure_dir
    os.makedirs(path)
  File "/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/os.py", line 157, in makedirs
    mkdir(name, mode)
OSError: [Errno 13] Permission denied: '/Library/Python/2.7/site-packages/pip'
```

![](https://ws2.sinaimg.cn/large/006tNc79ly1fn79y91xrpj31610l379k.jpg)



> 参考链接

<https://pip.pypa.io/en/stable/installing/>

