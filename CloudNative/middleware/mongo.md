### mongo

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
