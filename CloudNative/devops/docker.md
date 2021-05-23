### docker

#### install

```bash
sudo zypper install docker
```

更改 docker hub 源

<https://mirrors.ustc.edu.cn/help/dockerhub.html>

docker 默认使用 `sudo`

```bash
docker --help

  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
```

```bash
### 查看信息
docker info
```

#### image

```bash
### 查找指定镜像
docker search ubuntu
### 拉取镜像
docker pull ubuntu
### 查看镜像列表
docker images
### 删除镜像
docker rmi 7aa3095f0856
```

> 删除镜像需要先删除使用镜像的容器

#### container

##### 启动镜像

```bash
### 以名称+标签形式启动
docker run -t -i ubuntu:latest /bin/bash
docker run hello-world /hello
### 以ID启动
docker run fce289e99eb9 /hello
```

-t：在该容器中启动一个新的终端
-i：通过容器中的标准输入流建立交互式连接

> 如果想要退回到宿主机的终端，并且不中断该容器的执行，可以按下 CTRL+P，再按下 CTRL+Q。现在，你就安全的返回到了你的宿主机系统中。需要注意的是，Docker 容器仍然在后台运行，我们并没有中断它。

##### 容器管理

```bash
### 查看启动的容器列表
docker ps
### 查看容器列表
docker ps -a
### 启动
docker start 90cb8a003744
### 重新进入启动的容器
docker attach 90cb8a003744
### 停止
docker stop 90cb8a003744
```

```bash
### 删除已停止的容器
docker rm 2ff3cd0cec61
### 删除所有的已经停止的容器
docker container prune
```

##### 构建

```bash
### 从一个正在运行的容器中创建 Docker 镜像
docker commit 90cb8a003744 luanxt/ubuntu-bak
```

#### Dockerfile

<https://docs.docker.com/engine/reference/builder/>

<https://www.jianshu.com/p/10ed530766af>

<https://www.cnblogs.com/boshen-hzb/p/6400272.html>

#### config

##### 扩容

```json
    "graph": "/data/docker"
```

```
挂载新目录到docker根目录
mount -o bind /var/lib/docker /opt/docker


永久修改在需要在 /etc/fatab 添加:

/opt/docker /var/lib/docker none bind 0 0
```

---

##### ref

- <https://linux.cn/article-10940-1.html>
