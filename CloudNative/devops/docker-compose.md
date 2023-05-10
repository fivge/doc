---
title: Docker Compose
---

### 0x01 安装

https://github.com/docker/compose

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

- -f

  配置文件，默认为 `docker-compose.yml`

  https://docs.docker.com/compose/reference/#use--f-to-specify-name-and-path-of-one-or-more-compose-files

- --env-file

  环境变量文件，默认为项目目录(与`docker-compose.yml`同级)中的 `.env`文件

  https://docs.docker.com/compose/environment-variables/set-environment-variables/#substitute-with---env-file

#### 示例

```bash
# 启动
sudo docker compose -f foo-docker-compose.yml --env-file .env.prod up -d
# 停止
sudo docker compose -f foo-docker-compose.yml down
```
