#### init

```bash
yarn webpack
```

```
Hash: b1f0becdf0cd9299e4d1
Version: webpack 4.42.1
Time: 1668ms
Built at: 2020-03-30 21:45:30
  Asset      Size  Chunks             Chunk Names
main.js  72.1 KiB       0  [emitted]  main
Entrypoint main = main.js
[1] ./src/index.js 226 bytes {0} [built]
[2] (webpack)/buildin/global.js 472 bytes {0} [built]
[3] (webpack)/buildin/module.js 497 bytes {0} [built]
    + 1 hidden module

WARNING in configuration
The 'mode' option has not been set, webpack will fallback to 'production' for this value. Set 'mode' option to 'development' or 'production'
to enable defaults for each environment.
You can also set it to 'none' to disable any default behavior. Learn more: https://webpack.js.org/configuration/mode/
Done in 2.87s.
```

#### asset-management

```json
  module: {
    rules: [
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"]
      }
    ]
  }
```

_webpack 根据正则表达式，来确定应该查找哪些文件，并将其提供给指定的 loader。在这个示例中，所有以_ `.css` _结尾的文件，都将被提供给_ `style-loader` _和_ `css-loader`_。_

---

<https://webpack.docschina.org/guides/output-management/>

<https://github.com/FormidableLabs/webpack-dashboard>
