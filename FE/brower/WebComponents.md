---
id: web-components
title: Web Components
---

> 原生底层的实现方式

#### DOM

#### ShadowDOM

#### Web Components

https://developer.mozilla.org/zh-CN/docs/Web/Web_Components

https://github.com/mdn/web-components-examples

https://github.com/material-components/material-components-web

https://juejin.im/post/5b780a98e51d4538980bf5cf

#### @angular/Elements

> 在 Angular v6 中添加了一个特性，Angular Elements 又称 angular 元素

`@angular/Elements`是 Angular 中的一个新包，它帮助我们将 Angular 组件发布自定义元素。**它通过将 Angular 组件转化成`web Components`来实现这一点，它基于浏览器的 `Custom Elements API` 实现**。让我们来看看如何合理利用这一特性

---

##### 作用&好处

使用 Angular 元素，我们可以使我们的组件真正地可重用。也就是说，您可以在其他架和库中使用 Angular 组件，比如 React、Vue 和 Ember!
可以把 Angular 添加到项目后端

##### 项目创建

确保 Angular CLI 版本 大于 v6，因为 v6 才开始支持`@angular/Elements`的。

创建一个 angular 的基础项目

```Shell
ng new angular-app
cd angular-app
ng serve --open
```

接着创建一个 angular 组件

```Shell
ng g c HelloWorld
```

安装@angular/elements

```Shell
ng add @angular/elements
ng add @webcomponents/webcomponentsjs
```

安装好之后，转到`app.module`。，并对`@NgModule`进行以下更改:

```TypeScript
import { BrowserModule } from '@angular/platform-browser';
import { NgModule, Injector } from '@angular/core';
import { createCustomElement } from '@angular/elements';

import { HelloWorldComponent } from './hello-world/hello-world.component';

@NgModule({
  declarations: [HelloWorldComponent],
  imports: [BrowserModule],
  entryComponents: [HelloWorldComponent],
  providers: [],
})
export class AppModule {
  constructor(injector: Injector) {
    const custom = createCustomElement(HelloWorldComponent, { injector });
    customElements.define('app-hello-world', custom);
  }

  ngDoBootstrap() { }
}

```

##### 创建一个独立的元素

> 如果一个项目有 N 个组件，要从中抽取一个转换成`WebComponents`，打包的时候救需要把这个组件单独打包，否则文件会比单个组件包大。这里建议创建一个独立的元素（或者该项目全是`webComponents`）

在 Angular 项目的根目录中创建一个名为 preview 的新文件夹。在这个文件夹中，创建一个名为 index.html 的新文件，并在其中编写以下代码:

```HTML
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <script src="./angularapp.js"></script>
</head>

<body>
  <app-hello-world></app-hello-world>
</body>

</html>
```

现在我们不再需要 AppComponent 了，可以删除没有用的文件:
`app.component.css`、
`app.component.html`、
`app.component.spec.ts`、
`app.component.ts`、
`app.routing.module.ts`，之需保留`app.module`

##### 打包&运行

在项目根目录添加一个 custombuild.sh 的`Shell`的脚本文件

```Shell
#!/bin/sh
ng build angular-app --prod --output-hashing=none && cat dist/angular-app/{runtime,polyfills,scripts,main}****.js > preview/angularapp.js
```

shell 脚本不支持 Bash，所以加了 `#!/bin/sh`,用 git-bash 运行。

> 这里打包有很多方式，可以用 gzip 压缩体积，其他脚本库，还有 Angular v7 更新的 Ivy，Angular v9 都出了 🚀

这里的打包比较简陋，实质就是把`ng build`的生成文件合并到了 angularapp.js。运行这个脚本，preview 会多出一个 angularapp.js 文件

最后一步,在根目录运行

```Shell
npx live-server preview
```

页面显示 hello-world works!如果可以那个恭喜创建成功了 🎉
此外你可以去其他尝试引用 angularapp.js,并用`<app-hello-world></app-hello-world>`元素。

例子: (Angualr Elements)[http://git.inspur.com/WX0qizhen/angualr-elements]

参考:
(Building Custom Elements / Web Components with Angular 6)[https://medium.com/@tomsu/building-web-components-with-angular-elements-746cd2a38d5b]
