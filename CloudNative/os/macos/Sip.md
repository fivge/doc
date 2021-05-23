 如何确定已经当前SIP的开关状态？可在终端中使用官方的csrutil命令行工具进行查询：
csrutil status

从10.11 DB5/PB3版开始，rootless=0以及kext-dev-mode=1启动参数已经被废除，请不要再使用。第三方kext推荐安装至/Library/Extensions/，尽量避免对SLE下的原版kext进行直接修改