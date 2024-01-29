---
title: Yarn 2
---

### yarn 2 > yarn 1

- 熟悉 yarn，yarn 1 存在的优点及不足

- yarn 2 的改进

### yarn > npm

yarn 2 相较于 npm 的优点

### 安装&使用

- 安装
  - 全新安装 yarn 2
  - yarn 1 升级到 yarn 2
  - npm 过渡到 yarn 2

目前不推荐全局安装 yarn 2，项目内安装：

cd 到项目根目录，然后设置 yarn 版本为 berry

```bash
### 安装
yarn policies set-version berry # below v1.22
yarn set version berry          # on v1.22+
```

```bash
### 更新
yarn set version from sources
```

- 使用
  - 基本用法
  - 新特性
  - 高级用法、可扩展性

### 建议

- 推荐配置(镜像、本地开发、服务器开发)
- 常用指令(安装、打包、发布等)
- 使用风格(Git 提交文件、文件命名、配置文件&包管理)
- 优秀插件

### 插件开发、贡献改进

---

- https://yarnpkg.com/getting-started/install

- [还在为 monorepo 掉头发吗？Yarn 2.0 了解一下](https://juejin.im/post/5e49e3026fb9a07cd614ca91)
