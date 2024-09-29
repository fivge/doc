https://www.rollupjs.com/guide/introduction/#%E5%85%BC%E5%AE%B9%E6%80%A7compatibility

https://rollupjs.org/guide/zh/

### rollup

#### run

```bash
yarn build
cd dist
node
> var myBundle = require('./bundle.js');
> myBundle();
'hello world!'
```

### build

- cjs
- es
- systemjs

### Code Splitting

#### cjs

#### es6 module

#### SystemJs

https://github.com/rollup/rollup-starter-code-splitting

### plugins

#### @rollup/plugin-json

> 从 JSON 文件中读取数据

#### rollup-plugin-terser

> provide a minified build together with the non-minified one

#### @rollup/plugin-node-resolve

> teaches Rollup how to find external modules

**es6 module only**

#### @rollup/plugin-commonjs

> 🍣 A Rollup plugin to convert CommonJS modules to ES6, so they can be included in a Rollup bundle

#### @rollup/plugin-typescript

> 🍣 A Rollup plugin for seamless integration between Rollup and Typescript.

https://github.com/rollup/plugins/tree/master/packages/typescript

---

https://rollupjs.org/guide/en/

https://rollupjs.org/guide/zh/#%E5%88%9B%E5%BB%BA%E7%AC%AC%E4%B8%80%E4%B8%AAbundlecreating-your-first-bundle

https://rollupjs.org/guide/en/#plugins

https://github.com/rollup/awesome
