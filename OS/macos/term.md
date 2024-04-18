# term

### tree

```bash
brew install tree
```

_然而在使用 tree 的时候,macOS 会显示中文为乱码_

在 macOS 终端中应添加参数`-N`

```bash
tree -N
```

来代替`tree`命令

### macOS 文件用 vim 打开

Automator -> 应用程序 -> 运行 AppleScript -> 保存为`vim.app`

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

- https://www.zhihu.com/question/21435176/answer/80670940
- https://superuser.com/questions/139352/mac-os-x-how-to-open-vim-in-terminal-when-double-click-on-a-file

### vim 使用系统剪贴板

```bash
vim .vimrc
# START `.vimrc`
set clipboard+=unnamed
# END `.vimrc`
sudo rm /usr/bin/vim
brew install vim
```

https://coderwall.com/p/fv7r0q/fix-vim-after-upgrading-to-yosemite
