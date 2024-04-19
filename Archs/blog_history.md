# 博客系统变迁

## wordpress

## ghost blog

### 购买域名

`GoDaday`上购买的一年的域名

### 购买 VPS

### 设置 DNS 解析

<https://www.dnspod.cn/>

A 为 VPS 的 ip 地址，NS 设置为 DNSPod 的解析

`f1g1ns1.dnspod.net` `f1g1ns2.dnspod.net `

### 配置&&运行 Ghost

> 安装 Node

#### 安装 nvm

<https://github.com/creationix/nvm>

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
```

Or

```
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
```

```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
```

- 用法

> 安装 Ghost

- 下载 ghost 到`/var/www/`目录

```
cd /var/www/
curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip
unzip -uo ghost.zip -d ghost
```

- 安装并启动 ghost

```
cp config.example.js config.js
npm install --production ### 以产品模式安装
npm start  ### 以开发模式启动
```

> 让 Ghost 一直运行

- 安装 pm2

```
cd /var/www/ghost
sudo npm install pm2 -g
NODE_ENV=production pm2 start index.js --name "Ghost"
```

- PM2 开机自动运行 Ghost 博客

```
pm2 startup centos
pm2 save
```

- pm2 常见用法

```
pm2 l ###  查看状态
pm2 show <id|name> ### 查看状态
pm2 start/stop/restart <id|name> ### 开启/停止/重启进程
```

> 安装 MariaDB

- 安装 MariaDB

```
sudo yum install mariadb-server -y
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation
```

- 登录 MariaDB

```
mysql -u root -p
```

- 编辑配置文件以支持中文编码

```
vim /etc/my.cnf
```

```
[client]
default-character-set=utf8
[mysql]
default-character-set=utf8
[mysqld]
character-set-server=utf8
collation-server=utf8_general_ci
```

- 重启 MariaDB

```
systemctl restart mariadb
```

- 新建一个数据库，用来存放 Ghost 博客的数据

```
mysql -u root -p ### 登录数据库
create database ghost;   ### 创建ghost数据库
grant all privileges on ghost.* to 'ghost'@'%' identified by '123456';   ### 新建一个用户ghost，密码为123456
flush privileges;   ### 让权限生效
```

> 安装 Nginx 进行反向代理

- 安装 Nginx

```
vim /etc/yum.repos.d/nginx.repo
```

写入以下内容

```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=0
enabled=1
```

```
yum install nginx -y
```

- 运行 Nginx

```
systemctl start nginx
```

- 配置文件

```
vim /etc/nginx/conf.d/ghost.conf
```

写入以下内容

```
server {
listen 80;
server_name luanju.me; #将 luanju.me 改为自己的域名

location / {
  proxy_set_header   X-Real-IP $remote_addr;
  proxy_set_header   Host      $http_host;
  proxy_pass         http://127.0.0.1:2368;
}
}
```

- 重启 Nginx

```
systemctl restart nginx
```

- 设置为开机启动

```
systemctl enable nginx
```

> 运行 Ghost

- 配置 ghost

```
vim /var/www/ghost.js
```

编辑其中的`prduction`

```
    production: {
        url: 'http://luanju.me',
        mail: {},
/*
        database: {
            client: 'sqlite3',
            connection: {
                filename: path.join(__dirname, '/content/data/ghost.db')
            },
            debug: false
        },
*/
        database: {
            client:'mysql',
            connection: {
                host: '127.0.0.1',
                user: 'ghost',
                password: 'luan1407',
                database: 'ghost',
                charset: 'utf8'
                },
            debug: false
        },

        server: {
            host: '127.0.0.1',
            port: '2368'
        }
    },
```

- 重启 ghost

```shell
pm2 resatrt ghost
```

- 结束

外网访问<http://luanju.me>即可看到效果

参考文章：

1. <http://docs.ghost.org/zh/installation/>
2. <https://segmentfault.com/a/1190000006245224>
3. <http://www.nolanzong.com/2015/07/06/bo-ke-xian-shang/>

## Hexo

### 0x01 本地环境配置

> #### 安装 node

在本地环境下,需要先安装 node,具体参见[这篇文章](link,待补)

{% note info  %}

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

nvm ls-remote

nvm install v8.1.2(安装最新版 node 即可)

{% endnote %}

<!-- more -->

> #### 安装 hexo

具体参见[官方文档](https://hexo.io/zh-cn/)

```sh
npm install hexo-cli -g
hexo init blog
cd blog
npm install
hexo server
```

### 0x02 博客迁移

以前使用的是 ghost,由于 vps 内存较小,更新 ghost 老是失败,故迁移到 hexo.

```shell
npm install hexo-migrator-ghost --save
hexo migrate ghost ghost.json
```

### 0x03 开始使用

主要参考[Hexo 官方文档]()

> #### new

```shell
hexo new [layout] <title>
```

新建一篇文章。如果没有设置 `layout` 的话，默认使用 [\_config.yml](https://hexo.io/zh-cn/docs/configuration.html) 中的 `default_layout` 参数代替。如果标题包含空格的话，请使用引号括起来。

> #### generate

```shell
hexo generate
```

生成静态文件。

| 选项             | 描述                   |
| ---------------- | ---------------------- |
| `-d`, `--deploy` | 文件生成后立即部署网站 |
| `-w`, `--watch`  | 监视文件变动           |

该命令可以简写为

```shell
hexo g
```

> #### server

```shell
hexo server
```

启动服务器。默认情况下，访问网址为： `http://localhost:4000/`。

| 选项             | 描述                           |
| ---------------- | ------------------------------ |
| `-p`, `--port`   | 重设端口                       |
| `-s`, `--static` | 只使用静态文件                 |
| `-l`, `--log`    | 启动日记记录，使用覆盖记录格式 |

该命令可以简写为：

```shell
hexo s
```

> #### deploy

```shell
$ hexo deploy
```

部署网站。

| 参数               | 描述                     |
| ------------------ | ------------------------ |
| `-g`, `--generate` | 部署之前预先生成静态文件 |

该命令可以简写为：

```shell
hexo d
```

> #### clean

```shell
$ hexo clean
```

清除缓存文件 (`db.json`) 和已生成的静态文件 (`public`)。

在某些情况（尤其是更换主题后），如果发现您对站点的更改无论如何也不生效，您可能需要运行该命令。

### 0x04 配置主题

1. [大道至简](https://github.com/tufu9441/maupassant-hexo)
2. [Material 原质](https://github.com/viosey/hexo-theme-material)_推荐_
3. [light](https://hexo.io/hexo-theme-light/)
4. [Jacman](https://github.com/wuchong/jacman)
5. [next](https://github.com/iissnan/hexo-theme-next)_推荐_

### 0x05 美化

> #### 设置「阅读全文」？

在文章中使用 `<!-- more -->` 手动进行截断

> #### 设置 Favicon

###### Favicon 就是网站的小 logo

![](https://ws3.sinaimg.cn/large/006tKfTcly1fh1855pnwwj304q011q2s.jpg)

![](https://ws4.sinaimg.cn/large/006tKfTcly1fh23v5pipfj30pb0dn79g.jpg)

将 自定义的`favicon` 放置到 **站点** 的 `source` 目录下,在**主题配置文件**中设置

```yaml
favicon: /favicon.png
```

> #### 设置页面文章的篇数

在 Hexo 里可以为首页和归档页面设置不同的文章篇数，但可能需要安装 Hexo 插件。

1. 使用 `npm install --save` 命令来安装需要的 Hexo 插件。

   ```shell
   npm install --save hexo-generator-index
   npm install --save hexo-generator-archive
   npm install --save hexo-generator-tag
   ```

2. 等待扩展全部安装完成后，在 **站点配置文章** 中，设定如下选项：

   ```yaml
   index_generator:
     per_page: 8

   archive_generator:
     per_page: 0
     yearly: true
     monthly: true

   tag_generator:
     per_page: 0
   ```

   `per_page`即文章的数量。

> #### 引用文本居中(NExT 主题)

```
<!-- 标签 方式，要求版本在0.4.5或以上 -->

{% centerquote %}文本居中{% endcenterquote %}

<!-- 标签别名 -->

{% cq %}文本居中<br>两行{% endcq %}

{% cq %}
文本居中
两行
{% endcq %}
```

![](https://ws3.sinaimg.cn/large/006tKfTcly1fh18hn826zj30qa09cweq.jpg)

详见[Next 主题文档](http://theme-next.iissnan.com/tag-plugins.html)

> #### Bootstrap Callout

食用方式

```
{% note class_name %} Content (md partial supported) {% endnote %}
```

其中，`class_name` 可为空或以下列表中的一个值：

- `default`
- `primary`
- `success`
- `info`
- `warning`
- `danger`

![](https://ws2.sinaimg.cn/large/006tKfTcly1fh18h95mo6j30r80i1t94.jpg)

### 0x06 同步到远程服务器

#### 环境搭建

> hexo 环境

_同本地环境搭建_,需安装 node,hexo.

> nginx

….

#### 开始同步

<https://blog.yizhilee.com/post/deploy-hexo-to-vps/>

#### 自启动

#### 常见错误

> ```shell
> FATAL fatal: 'hexo.git' does not appear to be a git repository
> fatal: Could not read from remote repository.
> ```

![](http://ww3.sinaimg.cn/large/006tNc79ly1ff2xgn4123j30jx02idh3.jpg)

**方案: 服务器端重启 nginx**

> ```shell
> ERROR Deployer not found: git
> ```

![](http://ww4.sinaimg.cn/large/006tNc79ly1ff2xhz3vwij30ol03o76y.jpg)

**方案: 本地环境安装`hexo-deployer-git`**

```shell
npm install hexo-deployer-git --save
```

## docusaurus
