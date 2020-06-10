---
id: update
title: Angular Update
---

### Angular 版本升级

> 版本号

@angular typescript 版本固定 版本号写死 大版本统一升级

第三方组件 采用 ~ 如需升级、添加新特性，手动更改 package.json

自己开发的组件 版本号写死 防止有测试版本影响功能

> 更新到 8.0

<https://update.angular.io/#7.2:8.0>

<https://ng-alain.com/docs/upgrade-v8/zh>

Angular now uses TypeScript 3.4

先在 `package.josn` 中暂时移除 `@bss/keycloak-auth` `@bss/layout`

再升级 typescript 和 angular

```bash
yarn upgrade typescript@~3.4.5
ng update @angular/cli @angular/core
```

> AntDesign

```bash
ng update ng-zorro-antd
### 若多次尝试后仍失败，则直接执行
yarn update ng-zorro-antd
```

> HttpModule

If you use the legacy `HttpModule` and the `Http` service, switch to `HttpClientModule` and the `HttpClient` service.

> 路由懒加载

(1) `tsconfig.json`

```json
   "module": "es2015",
替换为
   "module": "esnext",
```

<https://stackoverflow.com/questions/56375703/angular-8-lazy-loading-modules-error-ts1323-dynamic-import-is-only-supporte>

(2)`routes-routing.module.ts`

由

```ts
      {
        path: 'general',
        loadChildren: './general-quota/general-quota.module#GeneralQuotaModule',
      },
```

替换为

```ts
{
  path: 'admin',
  loadChildren: () => import('./admin/admin.module').then(mod => mod.AdminModule),
},
```

> 差异化加载

<https://angular.cn/guide/deployment#differential-loading>

新建 browserslist 文件

`browserslist`

```
> 0.5%
last 2 versions
Firefox ESR
not dead
not IE 9-11 # For IE 9-11 support, remove 'not'.
```

`tsconfig.json`

```json
    "target": "es5",
替换为
    "target": "es2015",
```

移除 `package.json` 中的 `core-js`

移除 `src\polyfills.ts` 中对 `core-js` 的引用

> `tsconfig.json`

原 src/tsconfig.app.json、src/tsconfig.spec.json、karma.conf.js 转移至根目录，需要同步修改 `angular.json` 相对应路径

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

> ~~Ivy~~

<https://angular.cn/guide/ivy>

[https://tc9011.com/2018/11/30/ivy-angular%E4%B8%8B%E4%B8%80%E4%BB%A3%E6%B8%B2%E6%9F%93%E5%BC%95%E6%93%8E/](https://tc9011.com/2018/11/30/ivy-angular下一代渲染引擎/)

`tsconfig.app.json`

```json
  "angularCompilerOptions": {
    "enableIvy": true
  },
```

ng-zorro-antd 暂不支持 ivy `2019.7.18`

<https://github.com/NG-ZORRO/ng-zorro-antd/issues/3667>

```bash
ERROR in Cannot combine @Input decorators with query decorators
```

<https://stackoverflow.com/questions/56457566/cannot-combine-input-decorators-with-query-decorators-using-ivy>

###### before

```bash
$ ls -lh dist/ng-admin/
total 1.5M
-rw-r--r-- 1 luanxingtong 1049089 103K 7月  17 18:20 3-es5.f5ffa042a03f73da649e.js
-rw-r--r-- 1 luanxingtong 1049089  26K 7月  17 18:20 3rdpartylicenses.txt
-rw-r--r-- 1 luanxingtong 1049089 102K 7月  17 18:18 4-es2015.9de6d911fbf9dd41b0d7.js
-rw-r--r-- 1 luanxingtong 1049089 111K 7月  17 18:20 4-es5.358c2402a8d83d9a63ad.js
-rw-r--r-- 1 luanxingtong 1049089 110K 7月  17 18:18 5-es2015.429a778af1180bc17ae5.js
drwxr-xr-x 1 luanxingtong 1049089    0 7月  17 18:18 assets
-rw-r--r-- 1 luanxingtong 1049089 4.2K 7月  17 18:18 favicon.ico
-rw-r--r-- 1 luanxingtong 1049089  816 7月  17 18:20 index.html
-rw-r--r-- 1 luanxingtong 1049089 1.1M 7月  17 18:18 main-es2015.22cbc73e30c8958a4388.js
-rw-r--r-- 1 luanxingtong 1049089 1.2M 7月  17 18:20 main-es5.2623547881b677385254.js
-rw-r--r-- 1 luanxingtong 1049089  37K 7月  17 18:18 polyfills-es2015.41107f92564c13835b7f.js
-rw-r--r-- 1 luanxingtong 1049089 113K 7月  17 18:20 polyfills-es5.8a5e301684c48940b412.js
-rw-r--r-- 1 luanxingtong 1049089 2.3K 7月  17 18:18 runtime-es2015.2184947d7e0de912c4b6.js
-rw-r--r-- 1 luanxingtong 1049089 2.3K 7月  17 18:20 runtime-es5.32f8465ceff8d22a2bdc.js
-rw-r--r-- 1 luanxingtong 1049089 414K 7月  17 18:18 styles.90a54e8b9f3d5563f19c.css
```

###### after

```bash
-
```

> 元编程

[https://github.com/AngularInDepth/angularindepth/blob/master/articles/nrwl-1.%5B%E7%BF%BB%E8%AF%91%5D-Angular-Ivy-%E4%B8%8E%E5%85%83%E7%BC%96%E7%A8%8B%2C%E9%AB%98%E9%98%B6%E7%BB%84%E4%BB%B6%E5%92%8C%E6%B7%B7%E5%85%A5.md](https://github.com/AngularInDepth/angularindepth/blob/master/articles/nrwl-1.[翻译]-Angular-Ivy-与元编程%2C高阶组件和混入.md)

---

### Update to Angular 9
