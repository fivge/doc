### node

### brower

### 混合

---

#### es6 module

不能引入 node_modules 中的包

es6 的模块加载方式，**生产环境不可直接使用**，大部分软件包（react、rxjs 等）都不支持！！！

可在个人项目，只加载少量 js，不依赖第三方库的情况下使用

#### es6 module with rollup

---

### Webpack

### SystemJS

### Rollup

---

#### 摇树优化

#### 代码混淆

#### run-time 运行时

#### => JIT AOT

---

web: es6 module => js | Rollup

---

- [-] tsc
- [-] ts-node
- [-] nodemon

The main difference is that tsc transpile all the file according to your tsconfig. Instead, ts-node will start from the entry file and transpile the file step by step through the tree based on the import/export

[ nodemon 实现 Typescript 项目热更新](https://juejin.im/post/5dd2acdf51882529731ca82c)
