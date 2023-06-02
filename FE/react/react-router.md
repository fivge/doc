# react router

> 路由配置

create a [Browser Router](https://reactrouter.com/en/main/routers/create-browser-router)

```js
import { createBrowserRouter, RouterProvider } from "react-router-dom";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Home />,
  },
  {
    path: "contact",
    element: <ContactRoot />,
    errorElement: <ErrorPage />,
    children: [
      { index: true, element: <ContactHome /> },
      {
        path: ":contactId",
        element: <Contact />,
      },
      {
        path: ":contactId/edit",
        element: <EditContact />,
        action: editAction,
      },
    ],
  },
]);

<RouterProvider router={router} />;
```

**error page component**

```js
{
    errorElement: <ErrorPage />,
}
```

**index route**

```js
{ index: true, element: <ContactHome /> }
```

Note the`{ index:true }` instead of`{ path: "" }`

**pathless routes**

```js
createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    loader: rootLoader,
    action: rootAction,
    errorElement: <ErrorPage />,
    children: [
      {
        errorElement: <ErrorPage />,
        children: [
          { index: true, element: <Index /> },
          {
            path: "contacts/:contactId",
            element: <Contact />,
            loader: contactLoader,
            action: contactAction,
          },
          /* the rest of the routes */
        ],
      },
    ],
  },
]);
```

> lazy

https://reactrouter.com/en/main/route/lazy

> 路由出口

![](https://angular.cn/generated/images/guide/router/shell-and-outlet.gif)

```js
import { Outlet } from "react-router-dom";

<Outlet />;
```

> 路由跳转

**useNavigate**

```js
import { Link, NavLink } from "react-router-dom";

<Link to="/contacts/foo">link</Link>

<NavLink to="/contacts/foo" className={({ isActive, isPending }) => (isActive ? "active" : isPending ? "pending" : "")}>
	navlink
</NavLink>
```

```js
import { useNavigate } from "react-router-dom";

const navigate = useNavigate();

navigate("/foo");
navigate(-1);
```

_action_

```js
import { redirect } from "react-router-dom";

export async function action() {
  return redirect("/foo");
}
```

> 路由状态

```js
import { useNavigation } from "react-router-dom";

const navigation = useNavigation();

navigation.state === "loading" ? "loading" : "";
navigation.location;
```

navigation: `"idle" | "submitting" | "loading"`

> 路由参数

**params(URL Params)**

`/contracts/1234`

`:contactId`

```js
      {
        path: "contacts/:contactId",
        element: <Contact />,
      },
```

```js
import { useParams } from "react-router-dom";

const { contactId } = useParams();
```

_loader_

```js
import { useLoaderData } from "react-router-dom";

const contact = useLoaderData();

export async function loader({ params }) {
  return getContact(params.contactId);
}
```

**URLSearchParams**

`/contracts?name=foo`

```js
import { useSearchParams } from "react-router-dom";

let [searchParams, setSearchParams] = useSearchParams();
```

> 路由守卫

---

https://reactrouter.com/en/main/start/tutorial
