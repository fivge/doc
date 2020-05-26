### javascript 模块加载

> 模块化主要是用来抽离公共代码，隔离作用域，避免变量冲突等。

https://www.processon.com/view/link/5c8409bbe4b02b2ce492286a#map

https://www.jianshu.com/p/b86ad3e4e5c5

https://dev.to/iggredible/what-the-heck-are-cjs-amd-umd-and-esm-ikm

---

#### IIFE

使用自执行函数来编写模块化，特点：在一个单独的函数作用域中执行代码，避免变量冲突

```js
(function () {
  return {
    data: [],
  };
})();
```

#### commonjs cjs

服务端使用，浏览器不可用

```
node foo.js
```

> 🤔 webpack 是 commonjs 的浏览器端实现

#### amd

浏览器使用，使用 `require.js`加载。服务器不可用

#### umd

统一 commonjs & umd，可在服务器及客户端使用

#### esm

es6 的模块加载方式，**生产环境不可直接使用**，大部分软件包（react、rxjs 等）都不支持！！！

可在个人项目，只加载少量 js，不依赖第三方库的情况下使用
