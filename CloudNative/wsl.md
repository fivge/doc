#### CA

```bash
sudo /usr/sbin/update-ca-certificates
```

#### service

rcAAA start = service AAA start

#### proxy

```bash
### 设置代理
export http_proxy=http://127.0.0.1:1080
export HTTPS_PROXY=http://127.0.0.1:1080
### 取消代理
unset http_proxy
unset https_proxy
### socks5
export HTTP_PROXY=socks5://127.0.0.1:10808
export HTTPS_PROXY=socks5://127.0.0.1:10808

export HTTP_PROXY=socks5h://127.0.0.1:10808
export HTTPS_PROXY=socks5h://127.0.0.1:10808
export ALL_PROXY=socks5://127.0.0.1:1080
```

#### mongo

```bash
### 启动
sudo mongod -f /etc/mongod.conf
### 停止
sudo mongod -f /etc/mongod.conf --shutdown
### 导入数据
sudo mongoimport -d db -c collections -f filePath
### 导入 bson 格式数据
sudo mongorestore -d db -c collections wiki.bson
```

**Q:**

```bash
➜  ~ sudo mongod -f /etc/mongod.conf
about to fork child process, waiting until server is ready for connections.
forked process: 86
ERROR: child process failed, exited with error number 1
To see additional information in this output, start without the "--fork" option.
```

**A:**

没有 pid 目录，无法创建 pid

```bash
sudo mkdir /var/run/mongodb
```

### ss

```bash
➜  ~ sudo ss -t
State      Recv-Q Send-Q             Local Address:Port                              Peer Address:Port
Cannot open netlink socket: Protocol not supported
```

[ss (a substitute for netstat) does not work](https://github.com/Microsoft/WSL/issues/2249)
