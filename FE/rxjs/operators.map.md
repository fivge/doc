```
⭐
🌟
❄
🆑
```

### 操作符分类

操作符有着不同的用途，它们可作如下分类：创建、转换、过滤、组合、错误处理、工具，等等。在下面的列表中，你可以按分类组织好的所有操作符。

- 创建操作符

  - [create]
  - [empty]
  - [fromEvent]
  - [fromPromise][:star:]
  - [range]
  - [throw]

- 转换操作符

  - [buffer]
  - [bufferCount]
  - [bufferTime]![:star:]
  - [bufferToggle]
  - [bufferWhen]
  - [concatMap]![:star:]
  - [concatMapTo]
  - [exhaustMap]
  - [expand]
  - [groupBy]
  - [mapTo]
  - [mergeMap / flatMap][:star:]
  - [partition]
  - [pluck]
  - [reduce]
  - [scan]![:star:]
  - [window]
  - [windowCount]
  - [windowTime]
  - [windowToggle]
  - [windowWhen]

- 过滤操作符

- 组合操作符
  - [combineAll]
  - [combineLatest]![:star:]
  - [concatAll]
  - [merge]![:star:]
  - [mergeAll]
  - [pairwise]
  - [race]
  - [startWith]![:star:]
  - [withLatestFrom]![:star:]
  - [zip]

* 多播操作符
* 错误处理操作符
* 工具操作符

#### 组合操作符

#### mergeMap

首先，我们得理解 Observables 世界中的两个术语:

1. 源 (或外部) Observable - 在本例中就是 `post$` Observable 。
2. 内部 Observable - 在本例中就是 `getPostInfo$` Observable 。

仅当内部 Obervable 发出值时，通过合并值到外部 Observable 来让我知道

```js

```

#### pairwise

**\*当 Observable 发出值时让我知道，但还得给我前一个值。(以数组的形式)\***

页面滚动…

从输入 Observable 的第二个值开始触发。

##

```js

```

#### x

```js

```

https://github.com/RxJS-CN/rxjs-articles-translation/blob/master/articles/Six-Operators-That-You-Must-Know.md
