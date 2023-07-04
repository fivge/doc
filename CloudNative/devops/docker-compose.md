---
title: Docker Compose
---

### 0x01 安装

<https://github.com/docker/compose>

从 [github](https://github.com/docker/compose/releases) 下载安装

```bash
aria2c https://github.com/docker/compose/releases/xxxx
cp docker-compose-linux-x86_64 ~/.docker/cli-plugins/docker-compose
```

### 0x02 使用

```bash
# docker-compose up -d
# 新命令
docker compose up -d
```

#### 参数

- up down

  启动停止

- pull

  更新镜像

- -f

  配置文件，默认为 `docker-compose.yml`

  <https://docs.docker.com/compose/reference/#use--f-to-specify-name-and-path-of-one-or-more-compose-files>

- --env-file

  环境变量文件，默认为项目目录(与`docker-compose.yml`同级)中的 `.env`文件

  <https://docs.docker.com/compose/environment-variables/set-environment-variables/#substitute-with---env-file>

#### network

<https://docs.docker.com/compose/networking/>

##### quick start

在目录 `mysapp`下，通过 `docker compose up`启动服务，将默认创建一个名为 `myapp_default`的网络。

可以通过`docker network ls`查看

```bash
➜  ~ sudo docker network ls

NETWORK ID     NAME             DRIVER    SCOPE
e3ffe522bdaa   myapp_default·   bridge    local
```

##### 连接

在同一个 `docker compose`文件中，可以直接通过`service`下的服务名直接连接。

例如:

```yaml
services:
  db:
    image: postgres
    ports:
      - '8001:5432'
  web:
    build: .
    ports:
      - '8000:8000'
    environment:
      - POSTGRES_PORT=5432
      - POSTGRES_HOST=db
```

`web`服务可以直接通过`postgres://db:5432`连接到`db·服务

##### links

> 创建别名

```yaml
services:
  db:
    image: postgres
    ports:
      - '8001:5432'
  web:
    build: .
    ports:
      - '8000:8000'
    links:
      - 'db:database'
    environment:
      - POSTGRES_PORT=5432
      - POSTGRES_HOST=database
```

##### networks 指定自定义网络

```bash
services:
  # ...
networks:
  network1:
    name: my-pre-existing-network
    external: true
```

`external: true`不会创建网络，而会查找存在的网络

#### 示例

```bash
# 启动
sudo docker compose -f foo-docker-compose.yml --env-file .env.prod up -d
# 停止
sudo docker compose -f foo-docker-compose.yml down
```
