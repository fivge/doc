---
id: single-spa
title: Single-SPA
---

#### Single-SPA

#### https://single-spa.surge.sh/

#### Demo

https://alili.tech/archive/22975f44/

#### 创建 angular 项目

```bash
### 创建angular项目，注意配置--prefix，否则要更改一系列文件
ng new my-app --routing --prefix my-app
### 添加single-spa-angular
cd my-app
ng add single-spa-angular
### 安装single-spa-angular
npm install --save single-spa-angular
```

#### 在 angular 项目中配置相关文件

1. 在`app-routing.module.ts`中添加`providers: [{ provide: APP_BASE_HREF, useValue: '/' }]`

2. 在`app-routing.module.ts`中添加`{ path: '**', component: EmptyRouteComponent }`

3. 在`app.module.ts`中声明`EmptyRouteComponent`

4. 修改`package.json`:

```bash
"start": "npm run serve:single-spa",
"build": "npm run build:single-spa",
"build:single-spa": "ng build --prod --deploy-url /dist/navbar --output-hashing none",
"serve:single-spa": "ng serve --disable-host-check --port 4300 --deploy-url http://localhost:4300/ --live-reload false"
```

#### 配置路由

创建`index.html`，利用 sytemjs 和 single-spa-config 配置路由

```html
<!DOCTYPE html>
<html>
  <head>
    <meta
      http-equiv="Content-Security-Policy"
      content="default-src *  data: blob: 'unsafe-inline' 'unsafe-eval'; script-src * 'unsafe-inline' 'unsafe-eval'; connect-src * 'unsafe-inline'; img-src * data: blob: 'unsafe-inline'; frame-src *; style-src * data: blob: 'unsafe-inline'; font-src * data: blob: 'unsafe-inline';"
    />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Your application</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="importmap-type" content="systemjs-importmap" />
    <script type="systemjs-importmap">
      {
        "imports": {
          "app1": "http://localhost:4201/main.js",
          "app2": "http://localhost:4202/main.js",
          "navbar": "http://localhost:4300/main.js",
          "single-spa": "https://cdnjs.cloudflare.com/ajax/libs/single-spa/4.3.5/system/single-spa.min.js"
        }
      }
    </script>
    <link
      rel="preload"
      href="https://cdnjs.cloudflare.com/ajax/libs/single-spa/4.3.5/system/single-spa.min.js"
      as="script"
      crossorigin="anonymous"
    />
    <script src="https://unpkg.com/core-js-bundle@3.1.4/minified.js"></script>
    <script src="https://unpkg.com/zone.js"></script>
    <script src="https://unpkg.com/import-map-overrides@1.6.0/dist/import-map-overrides.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/systemjs/4.0.0/system.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/systemjs/4.0.0/extras/amd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/systemjs/4.0.0/extras/named-exports.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/systemjs/4.0.0/extras/named-register.min.js"></script>
  </head>

  <body>
    <script>
      System.import("single-spa").then(function(singleSpa) {
        singleSpa.registerApplication(
          "navbar",
          function() {
            return System.import("navbar");
          },
          function(location) {
            return true;
          }
        );

        singleSpa.registerApplication(
          "app1",
          function() {
            return System.import("app1");
          },
          function(location) {
            return location.pathname.startsWith("/app1");
          }
        );

        singleSpa.registerApplication(
          "app2",
          function() {
            return System.import("app2");
          },
          function(location) {
            return location.pathname.startsWith("/app2");
          }
        );

        singleSpa.start();
      });
    </script>
    <import-map-overrides-full></import-map-overrides-full>
  </body>
</html>
```

#### 启动项目

```bash
创建index.html,利用systemjs和single-spa-config配置路由
### 创建packet.json文件
npm init
### 安装serve文件
npm install serve
### 设置端口
在packet.json/scripts下写入start：serve -s -l 8080(端口号)
### 安装并启动
npm install && npm start
### 在当前配置下需要分别启动各个angular子项目
```
