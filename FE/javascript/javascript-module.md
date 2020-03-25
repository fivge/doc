https://www.jianshu.com/p/b86ad3e4e5c5



https://dev.to/iggredible/what-the-heck-are-cjs-amd-umd-and-esm-ikm



---

### javascript模块加载

---

#### commonjs cjs

服务端使用，浏览器不可用

```
node foo.js
```

#### amd

浏览器使用，使用 `require.js`加载。服务器不可用

not used

#### umd

统一 commonjs  & umd，可在服务器及客户端使用

#### esm

es6的模块加载方式，**生产环境不可直接使用**，大部分软件包（react、rxjs等）都不支持！！！

可在个人项目，只加载少量js，不依赖第三方库的情况下使用

---

### webpack

---

#### 摇树优化

#### 代码混淆

#### run-time 运行时

#### => JIT AOT 