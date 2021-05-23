---
title: Windows下端口占用
date: 2018-08-22 17:34:41
tags:
categories:
---

```powershell
λ  netstat -aon|findstr "1097"
      TCP    0.0.0.0:1097           0.0.0.0:0              LISTENING       15568
      TCP    [::]:1097              [::]:0                 LISTENING       15568

λ  tasklist|findstr "15568"
    java.exe                     15568 Console                    1    960,816 K

λ  kill 15568
```

```powershell
λ  netstat -ano|findstr 1080
  TCP    0.0.0.0:1080           0.0.0.0:0              LISTENING       22136
  TCP    127.0.0.1:1080         127.0.0.1:56247        TIME_WAIT       0
  TCP    127.0.0.1:1080         127.0.0.1:56345        TIME_WAIT       0
  TCP    127.0.0.1:1080         127.0.0.1:56351        TIME_WAIT       0
  TCP    127.0.0.1:1080         127.0.0.1:56353        TIME_WAIT       0
  TCP    127.0.0.1:1080         127.0.0.1:56354        TIME_WAIT       0
  TCP    127.0.0.1:1080         127.0.0.1:56355        TIME_WAIT       0
  TCP    127.0.0.1:1080         127.0.0.1:56362        TIME_WAIT       0
  TCP    [::]:1080              [::]:0                 LISTENING       22136

λ  taskkill /pid 11928 -t -f
成功: 已终止 PID 13868 (属于 PID 11928 子进程)的进程。
成功: 已终止 PID 11928 (属于 PID 7276 子进程)的进程。
```
