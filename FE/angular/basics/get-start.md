## angular/cli

### ng

```bash
### 全局安装 angular
yarn global add @angular/cli

### 安装特定版本
yarn init
yarn add @angular/cli@6.1.8

###
ng help

ng new --help

### with ivy
ng new ng-ivy --enable-ivy=true --inline-style=true --minimal=true --routing=true --skip-install=true --skip-tests=true

### without ivy
ng new ng-demo --inline-style=true --minimal=true --routing=true --skip-install=true --skip-tests=true
```

### module

```bash
ng g m core

ng g m shared

ng g m routes --routing

### 使用 RoutesModule 替换默认生成的 AppRoutingModule

### 创建业务模块
ng g m routes/user-info --routing
```

### component

```bash
ng g c routes/user-info/user-name
```

### service

```bash
ng g s routes/user-info/user-info
```

### pipe

[see more...](../excel/pipe.md)

## angular.json

---

## tslint

```bash
yarn add codelyzer -D
```

## tsconfig

### 使用绝对路径的路径映射表

> 项目的 `tsconfig.json` 中必须配置好 `baseUrl` 和 `paths` 属性。

#### angular6,7

`tsconfig.json`

```json
compilerOptions: {
    "baseUrl": "src/",
    "paths": {
      "@shared": ["app/shared"],
      "@shared/*": ["app/shared/*"],
      "@env": ["environments"],
      "@env/*": ["environments/*"],
      "@core": ["app/core"],
      "@core/*": ["app/core/*"]
    }
}
```

`tsconfig.app.json`

```json
compilerOptions: {
    "paths": {
      "@shared": ["app/shared"],
      "@shared/*": ["app/shared/*"],
      "@env": ["environments"],
      "@env/*": ["environments/*"],
      "@core": ["app/core"],
      "@core/*": ["app/core/*"]
    }
}
```

#### angular8+

`tsconfig.app.json` 和 `tsconfig.spec.json` 无须再单独设定 `paths` 属性

`tsconfig.app.json`

```json
{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "outDir": "./out-tsc/app",
    "types": []
  },
  "include": ["src/**/*.ts"],
  "exclude": ["src/test.ts", "src/**/*.spec.ts"]
}
```

## package.json

```json
  "scripts": {
    "ng": "ng",
    "start": "ng serve --port 8071",
    "build": "ng build --prod --build-optimizer"
  },
```

---

## Component

### AntDesign

```bash
ng add ng-zorro-antd
```

### material

https://material.angular.cn/

### BootStrap

https://github.com/valor-software/ngx-bootstrap

https://valor-software.com/ngx-bootstrap/#/documentation#getting-started

#### 安装

```bash
yarn add ngx-bootstrap
yarn add bootstrap
```

#### 引用

angular.json 中添加 css

`angular.json`

```json
            "styles": [
              "node_modules/bootstrap/dist/css/bootstrap.min.css",
              "src/styles.css"
            ],
```

#### 使用

按需引用，使用哪个组件，在 module 中引入相应的模块并注册为根组件

`.module.ts`

```ts
import { TooltipModule } from "ngx-bootstrap";
import { ButtonsModule } from "ngx-bootstrap";

  imports: [
    TooltipModule.forRoot(),
    ButtonsModule.forRoot()
  ],
```

`.component.html`

```html
<button type="button" class="btn btn-primary" tooltip="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
  Simple demo
</button>
```

---

## http

[see more...](./http.md)
