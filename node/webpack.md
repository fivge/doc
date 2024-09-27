## webpack

### 工作流程

```
入口(entry)
输出(output)
loader
插件(plugin)
模式(mode)
浏览器兼容性(browser compatibility)

入口起点(entry point)指示 webpack 应该使用哪个模块，来作为构建其内部 依赖图(dependency graph) 的开始。进入入口起点后，webpack 会找出有哪些模块和库是入口起点（直接和间接）依赖的。

output 属性告诉 webpack 在哪里输出它所创建的 bundle，以及如何命名这些文件。

webpack 只能理解 JavaScript 和 JSON 文件，这是 webpack 开箱可用的自带能力。loader 让 webpack 能够去处理其他类型的文件，并将它们转换为有效 模块，以供应用程序使用，以及被添加到依赖图中。

loader 用于转换某些类型的模块，而插件则可以用于执行范围更广的任务。包括：打包优化，资源管理，注入环境变量。

通过选择 development, production 或 none 之中的一个，来设置 mode 参数，你可以启用 webpack 内置在相应环境下的优化。其默认值为 production。

webpack 支持所有符合 ES5 标准 的浏览器（不支持 IE8 及以下版本）。webpack 的 import() 和 require.ensure() 需要 Promise。如果你想要支持旧版本浏览器，在使用这些表达式之前，还需要 提前加载 polyfill。
```

### 步骤

### 各个流程

### 常用配置

### 插件

### 底层原理

### babel 配置

### babel AST

---

## webpack

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

https://webpack.docschina.org/guides/output-management/

https://github.com/FormidableLabs/webpack-dashboard
