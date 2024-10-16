---
description: Create a doc page with rich content.
tags:
  - docker
  - macOS Term
---

# docker on macOS

### 0x01 install

nerdctl + colima + containerd

- https://github.com/containerd/nerdctl

- https://github.com/containerd/containerd

- https://github.com/lima-vm/lima

- https://github.com/abiosoft/colima

### 0x02 completion & alias

```bash
nerdctl completion zsh > $ZSH/custom/nerdctl.zsh
```

`.zshrc`

```bash
alias docker='nerdctl'
# complete -o default -F __start_nerdctl docker ### 貌似不需要
```

> not working

https://github.com/containerd/nerdctl/blob/main/docs/command-reference.md#nerd_face-nerdctl-completion-zsh

```bash
nerdctl completion zsh > $(brew --prefix)/share/zsh/site-functions/_nerdctl
```

![](https://img.0x64.in/2024/10/829b83b4c22ce650999d550f6c5f065b.png)

### 0x03 proxy

https://github.com/abiosoft/colima/issues/294#issuecomment-1131440640

**Note:** this assumes Colima v0.4.0 or newer.

1. SSH into the VM `colima ssh`

2. Edit docker init script `sudo vi /etc/init.d/docker`. You can install other editors e.g. `sudo apk install vim nano`.

3. Append with the following

```bash
set -o allexport
if [ -f /etc/environment ]; then source /etc/environment; fi
set +o allexport
```

Stop Colima `colima stop`

Set the environment variable in the Colima config. `colima start --edit` or edit `$HOME/.colima/default/colima.yaml`

```yaml
env:
  HTTP_PROXY: http://proxy.example.com:80
  HTTPS_PROXY: http://proxy.example.com:443
  NO_PROXY: localhost,127.0.0.1,docker-registry.example.com,.corp
```

Start Colima `colima start`
