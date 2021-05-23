### net-tools

> > net-tools 已弃用

> > 推荐 `iproute2`

#### ifconfig

#### netstat

```shell
### UDP
netstat -nupl
### TCP
netstat -ntpl
###
lsof -i:80
```

```bash
➜  docker netstat

The program 'netstat' can be found in following packages:
  * net-tools-deprecated [ path: /bin/netstat, repository: zypp (repo-oss) ]
  * net-tools-deprecated [ path: /usr/bin/netstat, repository: zypp (repo-oss) ]

Try installing with:
    zypper install net-tools-deprecated
```
