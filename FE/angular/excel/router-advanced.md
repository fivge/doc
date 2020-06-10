### 第二路由

### 路由守卫

路由器可以支持多种守卫接口：

- 用[`CanActivate`](https://angular.cn/api/router/CanActivate)来处理导航*到*某路由的情况。
- 用[`CanActivateChild`](https://angular.cn/api/router/CanActivateChild)来处理导航*到*某子路由的情况。
- 用[`CanDeactivate`](https://angular.cn/api/router/CanDeactivate)来处理从当前路由*离开*的情况.
- 用[`Resolve`](https://angular.cn/api/router/Resolve)在路由激活*之前*获取路由数据。
- 用[`CanLoad`](https://angular.cn/api/router/CanLoad)来处理*异步*导航到某特性模块的情况。

#### CanActivate

#### CanActivateChild

#### CanDeactivate

#### Resolve

#### CanLoad

<https://router.vuejs.org/zh/guide/advanced/navigation-guards.html>
