---
title: Docker Compose
---

docker-compose.yml

```bash
# docker-compose up -d
# 新命令
sudo docker compose up -d
```

```bash
# 启动
sudo docker compose -f foo-docker-compose.yml up -d
# 停止
sudo docker compose -f foo-docker-compose.yml down
```

`-f` 默认文件为 `docker-compose.yml`

---

- https://github.com/docker/compose
