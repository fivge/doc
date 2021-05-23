---
title: macOS 文件 用vim打开
date: 2017-04-09 11:30:02
tags: 
- macOSTerm
- vim
categories:
- macOS
---

### macOS文件用vim打开

Automator -> 应用程序 -> 运行AppleScript -> 保存为`vim.app`

`vim.app`

```typescript
on run {input}
   set the_path to POSIX path of input
   set cmd to "vim " & quoted form of the_path
   tell application "System Events" to set terminalIsRunning to exists application process "Terminal"
   tell application "Terminal"
      activate
      if terminalIsRunning is true then
         do script with command cmd
      else
         do script with command cmd in window 1
      end if
   end tell
end run
```

### 参考链接

+ <https://www.zhihu.com/question/21435176/answer/80670940>


+ <https://superuser.com/questions/139352/mac-os-x-how-to-open-vim-in-terminal-when-double-click-on-a-file>