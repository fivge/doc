# sudo

## 安装

`sudo`

## 配置

#### 查看当前设置

命令 `sudo -ll` 可以显示当前的 sudo 配置; 命令 `sudo -lU *user*` 可以查看某个特定用户的设置。

### 使用 visudo

使用 visudo 编辑/etc/sudoers

```bash
visudo
```

```
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL
# 密码过期时间 10分钟
Defaults:lux timestamp_timeout=10
Defaults:%sudo timestamp_timeout=10
```

```bash
gpasswd -a lux sudo
```

重新登录以生效

---

https://wiki.archlinuxcn.org/wiki/Sudo
