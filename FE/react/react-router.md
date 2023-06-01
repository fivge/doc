https://reactrouter.com/en/main/start/tutorial

### 路由

路由模块 AppRoutingModule

```js
routing
const routes: Routes = [];

通配符路由
重定向
嵌套路由
? 路由参数

const routes: Routes = [
  { path: 'first-component', component: FirstComponent },
  { path: 'second-component', component: SecondComponent },
  {
    path: 'first-component',
    component: FirstComponent, // this is the component with the <router-outlet> in the template
    children: [
      {
        path: 'child-a', // child route path
        component: ChildAComponent, // child route component that the router renders
      },
      {
        path: 'child-b',
        component: ChildBComponent, // another child route component that the router renders
      },
    ],
  },
  { path: '',   redirectTo: '/first-component', pathMatch: 'full' }, // redirect to `first-component`
  { path: '**', component: PageNotFoundComponent },  // Wildcard route for a 404 page
];
```

```js
import { Router, ActivatedRoute, ParamMap } from '@angular/router';

constructor(
  private route: ActivatedRoute,
) {}

ngOnInit() {
  this.route.queryParams.subscribe(params => {
    this.name = params['name'];
  });
}
```

路由跳转

相对路径

```
<a routerLink="../second-component">Relative Route to second component</a>

goToItems() {
  this.router.navigate(['items'], { relativeTo: this.route });
}
```

访问查询参数和片段

'/:id'

```
/crisis-center/1
```

```js
// 跳转
const heroId = hero ? hero.id : null;
  // Pass along the hero id if available
  // so that the HeroList component can select that item.
  this.router.navigate(['/heroes', { id: heroId }]);


// 接收
ngOnInit() {
  this.heroes$ = this.route.paramMap.pipe(
    switchMap(params => {
      this.selectedId = Number(params.get('id'));
      return this.service.getHeroes();
    })
  );
}

  const heroId = this.route.snapshot.paramMap.get('id');
```

惰性加载

路由守卫

防止未经授权的访问

### rc-r

#### Router

create a [Browser Router](https://reactrouter.com/en/main/routers/create-browser-router)

```js
import { createBrowserRouter, RouterProvider } from "react-router-dom";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Home />,
  },
  {
    path: "contacts",
    element: <Root />,
    errorElement: <ErrorPage />,
    loader: rootLoader,
    action: rootAction,
    children: [
      {
        path: "contacts/:contactId",
        element: <Contact />,
        loader: contactLoader,
      },
      {
        path: "contacts/:contactId/edit",
        element: <EditContact />,
        loader: contactLoader,
        action: editAction,
      },
    ],
  },
]);

<RouterProvider router={router} />
```

路由出口

![](https://angular.cn/generated/images/guide/router/shell-and-outlet.gif)

```js
import { Outlet } from "react-router-dom";

<Outlet />;
```

error page component

```js
{
    errorElement: <ErrorPage />,
}
```

路由跳转

```js
import { Link, NavLink } from "react-router-dom";

<Link to="/contacts/foo">link</Link>

<NavLink to="/contacts/foo" className={({ isActive, isPending }) => (isActive ? "active" : isPending ? "pending" : "")}>
	navlink
</NavLink>
```

```
import {
  Outlet,
  Link,
  useLoaderData,
  Form,
  redirect,
} from "react-router-dom";

export async function action() {
  const contact = await createContact();
  return redirect(`/contacts/${contact.id}/edit`);
}
```



### reactrouter

#### router

##### router

##### children

index route

##### errorElement

##### loader

##### action ( the "old school web" programming model)

##### Form

1. The `<Form action="destroy">` matches the new route at `"contacts/:contactId/destroy"` and sends it the request

Add a form, add an action, React Router does the rest.

##### dynamic segment

URL Params / params

`:contactId`

##### redirect

##### **`NavLink`**

```
isActive
isPending
```

##### unresponsive navigation

```tsx
const navigate = useNavigate();
```

---

https://reactrouter.com/en/main/start/tutorial#deleting-records

https://github.com/ng-alain/ng-alain/tree/master/src/app/routes
