## Pipe

### 自带管道

数字

```
| number:'1.4-4'
```

### 自定义管道

#### 简单管道

#### http 缓存

### AsyncPipe

The AsyncPipe subscribes to an observable or promise and returns the latest value it has emitted

---

> the difference between pure and impure pipe

A pure pipe is only called when Angular detects a change in the value or the parameters passed to a pipe. For example, any changes to a primitive input value (String, Number, Boolean, Symbol) or a changed object reference (Date, Array, Function, Object). An impure pipe is called for every change detection cycle no matter whether the value or parameters changes. i.e, An impure pipe is called often, as often as every keystroke or mouse-move.

TODO: for example
