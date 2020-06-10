---
id: route
title: Angular Route
---

### Router

```ts

constructor(
  private route: ActivatedRoute,
  private router: Router
) {}

```

下面是一些**路由器**中的关键词汇及其含义：

| 路由器部件                         | 含义                                                                                                                               |
| :--------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------- |
| `Router`（路由器）                 | 为激活的 URL 显示应用组件。管理从一个组件到另一个组件的导航                                                                        |
| `RouterModule`                     | 一个独立的 NgModule，用于提供所需的服务提供商，以及用来在应用视图之间进行导航的指令。                                              |
| `Routes`（路由数组）               | 定义了一个路由数组，每一个都会把一个 URL 路径映射到一个组件。                                                                      |
| `Route`（路由）                    | 定义路由器该如何根据 URL 模式（pattern）来导航到组件。大多数路由都由路径和组件类构成。                                             |
| `RouterOutlet`（路由出口）         | 该指令（`<router-outlet>`）用来标记出路由器该在哪里显示视图。                                                                      |
| `RouterLink`（路由链接）           | 这个指令把可点击的 HTML 元素绑定到某个路由。点击带有 `routerLink` 指令（绑定到*字符串*或*链接参数数组*）的元素时就会触发一次导航。 |
| `RouterLinkActive`（活动路由链接） | 当 HTML 元素上或元素内的`routerLink`变为激活或非激活状态时，该指令为这个 HTML 元素添加或移除 CSS 类。                              |
| `ActivatedRoute`（激活的路由）     | 为每个路由组件提供的一个服务，它包含特定于路由的信息，比如路由参数、静态数据、解析数据、全局查询参数和全局碎片（fragment）。       |
| `RouterState`（路由器状态）        | 路由器的当前状态包含了一棵由程序中激活的路由构成的树。它包含一些用于遍历路由树的快捷方法。                                         |
| 链接参数数组                       | 这个数组会被路由器解释成一个路由操作指南。你可以把一个`RouterLink`绑定到该数组，或者把它作为参数传给`Router.navigate`方法。        |
| 路由组件                           | 一个带有`RouterOutlet`的 Angular 组件，它根据路由器的导航来显示相应的视图。                                                        |

- Router 路由器
- Route 路由
- routerLink 路由器链接
-

---

### Route

> 路由 `Routes`

```typescript
const appRoutes: Routes = [
  { path: "crisis-center", component: CrisisListComponent },
  { path: "hero/:id", component: HeroDetailComponent },
  {
    path: "heroes",
    component: HeroListComponent,
    data: { title: "Heroes List" }
  },
  { path: "", redirectTo: "/heroes", pathMatch: "full" },
  { path: "**", component: PageNotFoundComponent }
];
```

#### path

`path` 不能以*斜杠（`/`）*开头，这样在应用的多个视图之间导航时，可以任意使用相对路径和绝对路径。

`:id` 是一个路由参数的令牌(Token)。比如 /hero/42 这个 URL 中，“42”就是 id 参数的值。 它为*路由参数*在路径中创建一个“空位”。在这里，路由器把英雄的 `id` 插入到那个“空位”中。

空路径（`''`）表示应用的默认路径，当 URL 为空时就会访问那里，因此它通常会作为起点。

重定向路由需要一个 `pathMatch` 属性，来告诉路由器如何用 URL 去匹配路由的路径，否则路由器就会报错。

从技术角度说，`pathMatch = 'full'` 导致 URL 中*剩下的*、未匹配的部分必须等于 `''`。 在这个例子中，跳转路由在一个顶级路由中，因此*剩下的*URL 和*完整的*URL 是一样的。

`pathMatch` 的另一个可能的值是 `'prefix'`，它会告诉路由器：当*剩下的*URL 以这个跳转路由中的 `prefix` 值开头时，就会匹配上这个跳转路由。

> 默认路由应该只有在*整个*URL 等于 `''` 时才重定向到 `HeroListComponent`，别忘了把重定向路由设置为 `pathMatch = 'full'`。

*通配符*路由的 `path` 是两个星号（`**`），它会匹配*任何* URL。 当路由器匹配不上以前定义的那些路由时，它就会选择*这个*路由。

通配符路由是路由配置中最没有特定性的那个，因此务必确保它是配置中的*最后一个*路由。

`**` 路径是一个**通配符**。它能匹配上*每一个 URL*。当所请求的 URL 不匹配前面定义的路由表中的任何路径时，路由器就会选择此路由。 这个特性可用于显示“404 - Not Found”页，或自动重定向到其它路由。

路由器使用**先匹配者优先**的策略来匹配路由，所以，具体路由应该放在通用路由的前面。

#### data

data 属性用来存放于每个具体路由有关的任意信息。该数据可以被任何一个激活路由访问，并能用来保存诸如 页标题、面包屑以及其它静态只读数据。使用 resolve 守卫来获取动态数据。

### 链接参数数组

主要供 `Router` 及 `[RouterLink]`使用

https://angular.cn/guide/router#link-parameters-array

```html
/hero/heroes/12138 /hero/heroes;id=12138 /hero/heroes/12138;id=12139 --不推荐，解析不到必要参数
/hero/heroes?id=12138&foo=bar /hero/heroes/12138
<a [routerLink]="['/hero/heroes', { id:'12138' }]"></a>
<a [routerLink]="['/hero/heroes', { id:'12138' }]"></a>
<a [routerLink]="['/hero/heroes', { id:'12138' }]"></a>
<a [routerLink]="['/hero/heroes', { id:'12138' }]"></a>
```

#### 相对路径

路由器支持在*链接参数数组*中使用“目录式”语法来为查询路由名提供帮助：

`./` 或 `无前导斜线` 形式是相对于当前级别的。

`../` 会回到当前路由路径的上一级。

你可以把相对导航语法和一个祖先路径组合起来用。 如果不得不导航到一个兄弟路由，你可以用 `../` 来回到上一级，然后进入兄弟路由路径中。

### RouterLink

> 路由器链接 `routerLink` `routerLinkActive`

```html
<a routerLink="/hero/hero">Heroes</a>
<a routerLink="/hero" routerLinkActive="active fly" [routerLinkActiveOptions]="{ exact: true }">hero</a>
```

```css
.active {
  color: red;
}

.fly {
  background-color: greenyellow;
}
```

#### routerLink

1. 把一个字符串赋给 `routerLink`（“一次性”绑定）

`/hero/hero`

```html
<a routerLink="/hero/hero">hero</a>
```

2. 如果需要更加动态的导航路径，那就把它绑定到一个返回**链接参数数组**的模板表达式。 路由器会把这个数组解析成完整的 URL。

`/hero/hero/15`

```html
<a [routerLink]="['/hero/hero', id]">custom {{id}}</a>
```

#### routerLinkActive

> 路由链接的激活状态

```html
<a routerLink="/hero" routerLinkActive="active fly" [routerLinkActiveOptions]="{ exact: true }">hero</a>
```

`RouterLinkActive` 指令会基于当前的 `RouterState` 为活动的 `RouterLink` 切换所绑定的 css 类。等号右边的模板表达式包含一些用空格分隔的 CSS 类名，当这个链接激活时，路由器将会把它们加上去（并在处于非活动状态时移除）。还可以把 `RouterLinkActive` 设置为一个类组成的字符串，如 `[routerLinkActive]="'active fluffy'"`，或把它绑定到一个返回类似字符串的组件属性。

路由链接的激活状态会向下级联到路由树中的每个层级，所以，父子路由链接可能会同时激活。要覆盖这种行为，可以把 `[routerLinkActiveOptions]` 绑定为 `{ exact: true }` 表达式，这样 `RouterLink` 只有当 URL 与当前 URL 精确匹配时才会激活。

### Router

> 路由器 `router`

#### router.navigate

路由的 `navigate` 方法接受一个单条目的**链接参数数组**

```ts
// /hero/heroes;id=12138;foo=bar
this.router.navigate(["/hero/heroes", { id: this.id, foo: "bar" }]);
this.router.navigate([{ foo: "Bob" }]);
```

用 `Router.navigate` 方法导航到相对路径时，必须提供当前的 `ActivatedRoute`，来让路由器知道你现在位于路由树中的什么位置。

在链接参数数组后面，添加一个带有 `relativeTo` 属性的对象，并把它设置为当前的 `ActivatedRoute`。 这样路由器就会基于当前激活路由的位置来计算出目标 URL。

```typescript
// /hero/hero/52788 => /hero/heroes
this.router.navigate(["../../heroes"], { relativeTo: this.route });
```

> 如果用 `RouterLink` ，不再需要提供 `relativeTo` 属性。 `ActivatedRoute` 已经隐含在了 `RouterLink` 指令中

> 当调用路由器的 `navigateByUrl` 时，**总是**要指定完整的绝对路径

### RouterState

> 路由器状态

在导航时的每个生命周期成功完成时，路由器会构建出一个 `ActivatedRoute` 组成的树，它表示路由器的当前状态。 你可以在应用中的任何地方用 `Router` 服务及其 `routerState` 属性来访问当前的 `RouterState` 值。

`RouterState` 中的每个 `ActivatedRoute` 都提供了从任意激活路由开始向上或向下遍历路由树的一种方式，以获得关于父、子、兄弟路由的信息。

```typescript
  constructor(private router: Router) {}
  // Router 服务及其 routerState 属性来访问当前的 RouterState

  ngOnInit() {
    console.log(`Router`, this.router.routerState);
  }
```

### ActivatedRoute

> 激活的路由 `route`

该路由的路径和参数可以通过注入进来的一个名叫`ActivatedRoute`的路由服务来获取。 它有一大堆有用的信息，包括：

| 属性            | 说明                                                                                                                          |
| :-------------- | :---------------------------------------------------------------------------------------------------------------------------- |
| `url`           | 路由路径的 `Observable` 对象，是一个由路由路径中的各个部分组成的字符串数组                                                    |
| `data`          | 一个 `Observable`，其中包含提供给路由的 `data` 对象。也包含由解析守卫（resolve guard）解析而来的值                            |
| `paramMap`      | 一个 `Observable`，其中包含一个由当前路由的必要参数和可选参数组成的 map 对象。用这个 map 可以获取来自同名参数的单一值或多重值 |
| `queryParamMap` | 一个 `Observable`，其中包含一个对所有路由都有效的查询参数组成的 map 对象。 用这个 map 可以获取来自查询参数的单一值或多重值    |
| `fragment`      | 一个适用于所有路由的 URL 的 fragment（片段）的 `Observable`                                                                   |
| `outlet`        | 要把该路由渲染到的 `RouterOutlet` 的名字。对于无名路由，它的路由名是 `primary`，而不是空串                                    |
| `routeConfig`   | 用于该路由的路由配置信息，其中包含原始路径                                                                                    |
| `parent`        | 当该路由是一个子路由时，表示该路由的父级 `ActivatedRoute`                                                                     |
| `firstChild`    | 包含该路由的子路由列表中的第一个 `ActivatedRoute`                                                                             |
| `children`      | 包含当前路由下所有已激活的子路由                                                                                              |

有两个旧式属性仍然是有效的，但它们不如其替代品那样强力，建议不再用它们。

- `params` —— 一个 `Observable` 对象，其中包含当前路由的必要参数和可选参数。请改用 `paramMap`。

- `queryParams` —— 一个 `Observable` 对象，其中包含对所有路由都有效的查询参数。请改用 `queryParamMap`。

#### Observable

子组件可复用时，采用订阅的形式，动态获取参数

| `has(name)`    | 如果参数名位于参数列表中，就返回 `true`                                                                                        |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `get(name)`    | 如果这个 map 中有参数名对应的参数值（字符串），就返回它，否则返回 `null`。如果参数值实际上是一个数组，就返回它的*第一个*元素。 |
| `getAll(name)` | 如果这个 map 中有参数名对应的值，就返回一个字符串数组，否则返回空数组。当一个参数名可能对应多个值的时候，请使用 `getAll`。     |
| `keys`         | 返回这个 map 中的所有参数名组成的字符串数组。                                                                                  |

> 当在组件中订阅一个可观察对象时，你通常总是要在组件销毁时取消这个订阅。
>
> 但是也有少数例外情况不需要取消订阅。 `ActivateRoute` 中的各种可观察对象就是属于这种情况。

#### Snapshot

> Snapshot（快照）：当不需要 Observable 时的替代品

假如你很确定这个组件的实例永远、永远不会被复用，那就可以使用快照来简化这段代码。

父子组件、子路由都可复用组件

#### paramMap

> 一个 `Observable`，其中包含一个由当前路由的必要参数和可选参数组成的 map 对象。用这个 map 可以获取来自同名参数的单一值或多重值

`/hero/12138`

`/heroes;id=12138`

```typescript
// Observable
this.id$ = this.route.paramMap.pipe(map((params: ParamMap) => params.get("id")));
this.route.paramMap.subscribe((params: ParamMap) => (this.id = params.get("id")));
// Snapshot
this.route.snapshot.paramMap.get("id");
// this.route.snapshot.params["id"]; // --> 不建议
```

#### data

```typescript
// Snapshot
this.route.snapshot.data['code']this.route.snapshot.data['code'];
// Observable
```

### 路由事件

在每次导航中，`Router` 都会通过 `Router.events` 属性发布一些导航事件。这些事件的范围涵盖了从开始导航到结束导航之间的很多时间点。

### forRoot(routes)/forChild(routes)

> 根路由

定义一个路由数组 `appRoutes` 并把它传给 `RouterModule.forRoot()` 方法。 它会返回一个模块，其中包含配置好的 `Router` 服务提供商，以及路由库所需的其它提供商。

把 `RouterModule.forRoot()` 注册到 `AppModule` 的 `imports` 中，能让该 `Router` 服务在应用的任何地方都能使用。

> **🎯 注意：** `RouterModule.forRoot` 方法是用于注册全应用级提供商的编码模式。要详细了解全应用级提供商，参见[单例服务](https://angular.cn/guide/singleton-services#forRoot-router) 一章。

只在根模块 `AppRoutingModule` 中调用 `RouterModule.forRoot()`（如果在 `AppModule` 中注册应用的顶级路由，那就在 `AppModule` 中调用）。 在其它模块中，你就必须调用**`RouterModule.forChild`**方法来注册附属路由。

模块懒加载：在根路由中配置

```ts
// angular 8+
const routes: Routes = [
  {
    path: "admin",
    loadChildren: () => import("./admin/admin.module").then(mod => mod.AdminModule)
  }
];
```

```ts
// angular 2~7
const routes: Routes = [
  {
    path: "route",
    loadChildren: "./route/route.module#RouteModule"
  }
];
```

并导入路由模块为根路由/子路由

```ts
  imports: [BrowserModule, RouterModule.forRoot(routes)],
```

路由器出口

```html
<router-outlet></router-outlet>
```

### location

```ts
import { Location } from '@angular/common';

    private location: Location

  back() {
    this.location.back();
  }
```

### 路由参数

- 必要参数

- 可选参数 ——和必要参数一样，路由器也支持通过可选参数导航。 在你定义完必要参数之后，再通过一个**独立的对象**来定义可选参数

#### 必要参数 `/heroes/12138`

##### 定义 `Routes`

`-routing.module.ts`

```typescript
const routes: Routes = [
  {
    path: "hero/:id",
    component: HeroDetailComponent
  }
];
```

##### 导航 `RouterLink` `router.navigate`

`.component.ts`

```html
<a [routerLink]="['/hero/hero', id]">custom {{id}}</a>
```

```typescript
this.router.navigate(["/hero/hero", this.id]);
```

##### 接收 `ParamMap`

`.component.ts`

```typescript
// Observable
this.id$ = this.route.paramMap.pipe(map((params: ParamMap) => params.get("id")));
this.route.paramMap.subscribe((params: ParamMap) => (this.id = params.get("id")));
// Snapshot
this.route.snapshot.paramMap.get("id");
```

#### 可选参数 `/heroes;id=12138`

可选的路由参数没有使用`?`和`&`符号分隔，因为它们将用在 URL 查询字符串中。 它们是用`;`分隔的。 这是矩阵 URL 标记法

##### 定义&导航 `RouterLink` `router.navigate`

`.component.ts`

```typescript
this.router.navigate(["/hero/heroes", { id: "12138" }]);
```

```html
<a [routerLink]="['/hero/heroes', { id:'12138' }]">hero with id</a>
```

##### 接收 `ParamMap`

与必要参数一致

`.component.ts`

```typescript
// Observable
this.id$ = this.route.paramMap.pipe(map((params: ParamMap) => params.get("id")));
this.route.paramMap.subscribe((params: ParamMap) => (this.id = params.get("id")));
// Snapshot
this.route.snapshot.paramMap.get("id");
```

#### /heroes?id=12138

使用“？”和“&”符号分隔

```typescript
let navigationExtras: NavigationExtras = {
  queryParams: { session_id: sessionId },
  fragment: "anchor"
};
```

#### 隐式路由对象 `/heroes`

从 routes 中获取路由参数

##### 定义

`-routing.module.ts`

```ts
const routes: Routes = [
  {
    path: "list",
    component: ListComponent,
    data: { code: "CBH" }
  }
];
```

`.component.ts`

```ts
// Snapshot
this.route.snapshot.data['code']this.route.snapshot.data['code'];
// Observable
```

---

🎯<https://angular.cn/guide/router#milestone-4-crisis-center-feature>

### 子路由

对这些路由的处理中有一些*重要的不同*。

路由器会把这些路由对应的组件放在 `CrisisCenterComponent` 的 `RouterOutlet` 中，而不是 `AppComponent` 壳组件中的。

`CrisisListComponent` 包含危机列表和一个 `RouterOutlet`，用以显示 `Crisis Center Home` 和 `Crisis Detail` 这两个路由组件。

`Crisis Detail` 路由是 `Crisis List` 的子路由。由于路由器默认会[复用组件](https://angular.cn/guide/router#reuse)，因此当你选择了另一个危机时，`CrisisDetailComponent` 会被复用。
作为对比，回头看看 `Hero Detail` 路由，每当你从列表中选择了不同的英雄时，[都会重新创建该组件](https://angular.cn/guide/router#snapshot-the-no-observable-alternative)。

在顶级，以 `/` 开头的路径指向的总是应用的根。 但这里是子路由。 它们是在父路由路径的基础上做出的扩展。

`-routing.module.ts`

```typescript
const crisisCenterRoutes: Routes = [
  {
    path: "crisis-center",
    component: CrisisCenterComponent,
    children: [
      {
        path: "",
        component: CrisisListComponent,
        children: [
          {
            path: ":id",
            component: CrisisDetailComponent
          },
          {
            path: "",
            component: CrisisCenterHomeComponent
          }
        ]
      }
    ]
  }
];
```

`.component.ts`

```html
<h2>CRISIS CENTER</h2>
<router-outlet></router-outlet>
```

### 懒加载（惰性加载）、预加载

### base href
