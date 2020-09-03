> 框架

<img src="https://angular.cn/generated/images/guide/architecture/overview2.png" alt="image" style="zoom:80%;" />

- 组件和模板共同定义了 Angular 的视图。

* 基于组件：基于 module component

* 数据绑定：component 与模板双向绑定 事件绑定和参数绑定

  [] () [()] {} #name

* 依赖注入：服务注入到组件中

* 装饰器：原理、如何实现、与注解的区别、自己实现装饰器（在 angular、pure typescript 中）

  装饰器为其添加了元数据 matedata

* meta-data annotation

> 类型

- 组件与模板 组件生命周期、指令
- 指令
- 服务
- 模块
-

> > key components
>
> Angular components are a subset of directives, always associated with a template. Unlike other directives, only one component can be instantiated per an element in a template. A component must belong to an NgModule in order for it to be available to another component or application.

- component control HTML views
- templates represent the views
- module
- services
- matedata This can be used to add more data to an Angular class.

1. 1. **Metadata:**

> 生命周期钩子

todo

> 依赖注入 Dependency injection

Dependency injection (DI), is an important application design pattern in which a class asks for dependencies from external sources rather than creating them itself. Angular comes with its own dependency injection framework for resolving dependencies( services or objects that a class needs to perform its function).So you can have your services depend on other services throughout your application.

> ts

- 类型系统
- 构造函数 construct
- private public static …
- 声明与继承 implement

---

> What are template expressions?

he below javascript expressions are prohibited in template expression

1. assignments (=, +=, -=, ...)
2. new
3. chaining expressions with ; or ,
4. increment and decrement operators (++ and --)

> What is the difference between pure and impure pipe?

A pure pipe is only called when Angular detects a change in the value or the parameters passed to a pipe. For example, any changes to a primitive input value (String, Number, Boolean, Symbol) or a changed object reference (Date, Array, Function, Object). An impure pipe is called for every change detection cycle no matter whether the value or parameters changes. i.e, An impure pipe is called often, as often as every keystroke or mouse-move.

> rxjs

todo

[40…50](https://github.com/sudheerj/angular-interview-questions#what-is-rxjs)

> elements

[51…58]()

> What is Angular Universal?

Angular Universal is a server-side rendering module for Angular applications in various scenarios. This is a community driven project and available under @angular/platform-server package. Recently Angular Universal is integrated with Angular CLI.

> What is the purpose of any type cast function?

You can disable binding expression type checking using \$any() type cast function(by surrounding the expression). In the following example, the error Property contacts does not exist is suppressed by casting user to the any type.

```
  template: '{{$any(user).contacts.email}}'
```

The \$any() cast function also works with this to allow access to undeclared members of the component.

```
   template: '{{$any(this).contacts.email}}'
```

> How do you describe various dependencies in angular application?

The dependencies section of package.json with in an angular application can be divided as follow,

1. **Angular packages:** Angular core and optional modules; their package names begin @angular/.
2. **Support packages:** Third-party libraries that must be present for Angular apps to run.
3. **Polyfill packages:** Polyfills plug gaps in a browser's JavaScript implementation.
