---
title: sass
date: 2018-04-21 23:02:24
tags:
  - RubyGems
  - sass/scss
---

### sass

##### 0x01 安装

> 使用 RubyGems 安装

```bash
gem install sass
```

##### 0x02 使用

Sass 提供四个编译风格的选项：

- `nested`: 嵌套缩进的 css 代码，它是默认值；
- `expanded`: 没有缩进的、扩展的 css 代码；
- `compact`: 简洁格式的 css 代码；
- `compressed`：压缩后的 css 代码。

生产环境当中，一般使用最后一个选项。

```bash
sass --style compressed test.scss test.min.css
```

##### 参考链接

- <https://segmentfault.com/a/1190000003912703>
