## Operators (操作符)

### 什么是操作符？delete

> 操作符是允许复杂的异步代码以声明式的方式进行轻松组合的基础代码单元。

操作符是 Observable 类型上的**方法**，比如 `.map(...)`、`.filter(...)`、`.merge(...)`，等等。当操作符被调用时，它们不会**改变**已经存在的 Observable 实例。相反，它们返回一个**新的** Observable ，它的 subscription 逻辑基于第一个 Observable 。

> 操作符是函数，它基于当前的 Observable 创建一个新的 Observable。这是一个无副作用的操作：前面的 Observable 保持不变。

操作符本质上是一个纯函数 (pure function)，它接收一个 Observable 作为输入，并生成一个新的 Observable 作为输出。订阅输出 Observable 同样会订阅输入 Observable。称之为“操作符订阅链”。

### 操作符分类

操作符有着不同的用途，它们可作如下分类：创建、转换、过滤、组合、错误处理、工具，等等。在下面的列表中，你可以按分类组织好的所有操作符。

- 创建操作符
  - of🌟
  - from🌟
  - interval
  - timer
  - ~~fromPromise~~
- 转换操作符
  - map🌟
  - mapTo
  - switchMap🌟
- 过滤操作符
- 组合操作符
  - concat🌟
  - forkJoin⭐
- 多播操作符
- 错误处理操作符
- 工具操作符

#### 创建操作符

##### `of()`🌟

按顺序发出任意数量的值

```js
const source = of(1, 2, 3, 4, 5, { name: 'Brian' }, [1, 2, 3], function hello() {
  return 'Hello';
});
// 输出：1, 2, 3, 4, 5, { name: 'Brian' }, [1, 2, 3], function hello() {return 'Hello';}
source.subscribe(console.log);
```

##### `from()`🌟

从一个数组、类数组对象、Promise、迭代器对象或者类 Observable 对象创建一个 Observable

> 几乎可以把任何东西都能转化为 Observable

```js
const source = from([1, 2, 3, 4, 5, { name: 'Brian' }, 'foooooo']);
// 输出：1, 2, 3, 4, 5, { name: 'Brian' }, 'foooooo'
source.subscribe(console.log);
// 输出：f, o, o, o, o, o
from('fooooo').subscribe(console.log);
```

##### `interval()`

创建一个 Observable ，该 Observable 使用指定的 IScheduler ，并以指定时间间隔发出连续的数字。

interval 返回一个发出无限自增的序列整数, 你可以选择固定的时间间隔进行发送。 第一次并 没有立马去发送, 而是第一个时间段过后才发出。

```js
// 每1秒发出数字序列中的值
const source = interval(1000);
// 输出: 25s, 0 26s, 1 27s, 2 28s, 3 29s, 4 30s, 5 31s, 6 32s, 7 33s, 8 34s...
console.log(new Date().getSeconds());
source.subscribe(val => console.log(val, new Date().getSeconds()));
```

##### `timer()`

创建一个 Observable，该 Observable 在初始延时（initialDelay）之后开始发送并且在每个时间周期（ period）后发出自增的数字。如果时间周期没有被指定, 输出 Observable 只发出 0。

> 就像是 interval, 但是你可以指定什么时候开始发送。

```js
// 1秒后发出0，然后结束，因为没有提供第二个参数
const source0 = timer(1000);
// 输出: 25s, 0 26s
console.log(new Date().getSeconds());
source0.subscribe(val => console.log(val, new Date().getSeconds()));

// timer 接收第二个参数，它决定了发出序列值的频率，在本例中我们在1秒发出第一个值，然后每2秒发出序列值
const source = timer(1000, 2000);
// 输出: 54s, 0 55s, 1 57s, 2 59s, 3 1s, 4 3s, 5 5s, 6 7s, 7 9s, 8 11s, 9 13s, 10 15s, 11 17s, 12 19s......
console.log(new Date().getSeconds());
source.subscribe(val => console.log(val, new Date().getSeconds()));
```

#### 转换操作符

##### `map()`🌟

对源 observable 的每个值应用投射函数

> 类似于 Array.prototype.map()，它把每个源值传递给转化函数以获得相应的输出值

```js
const source = from([1, 2, 3, 4, 5]);
const example = source.pipe(map(val => val + 10));
// 输出: 1, 2, 3, 4, 5
// 不会改变已经存在的 Observable 实例
source.subscribe(res => console.log('from', res));
// 输出: 11,12,13,14,15
example.subscribe(res => console.log('from map', res));
```

##### `mapTo()`

将每个发出值映射成常量

> 类似于 `map`，但它每一次都把源值映射成同一个输出值

```js
const source = interval(2000);
const example = source.pipe(mapTo(`cowsay`));
// 输出: 'cowsay', 'cowsay', 'cowsay', 'cowsay', 'cowsay'...
example.subscribe(console.log);
```

##### `switchMap()`🌟

将每个源值投射成 Observable，该 Observable 会合并到输出 Observable 中， 并且只发出最新投射的 Observable 中的值。

> 将每个值映射成 Observable ，然后使用 switch 打平所有的内部 Observables

> 偷梁换柱

返回的 Observable 基于应用一个函数来发送项，该函数提供给源 Observable 发出的每个项， 并返回一个(所谓的“内部”) Observable 。每次观察到这些内部 Observables 的其中一个时， 输出 Observable 将开始发出该内部 Observable 所发出的项。当发出一个新的内部 Observable 时，switchMap 会**停止发出先前发出的内部 Observable** 并开始发出新的内部 Observable 的值。后续的内部 Observables 也是如此。

该 Observable 发出由源 Observable 发出的每项应用投射函数 (和可选的 `resultSelector`)后的结果，并只接收最新投射的内部 Observable 的值。

```js
// 立即发出值， 然后每5秒发出值
const source = timer(0, 5000);

// 当 source 发出值时切换到新的内部 observable，发出新的内部 observable 所发出的值
const example = source.pipe(switchMap(() => timer(0, 500)));
// 输出: 0,1,2,3,4,5,6,7,8,9...0,1,2,3,4,5,6,7,8,9
console.log(new Date().getSeconds());
example.subscribe(res => console.log(res, new Date().getSeconds()));
```

```js
// 发出每次点击
const source = fromEvent(document, 'click');
// 如果3秒内发生了另一次点击，则消息不会被发出
const example = source.pipe(switchMap(() => interval(1000).pipe(mapTo('Hello, I made it!'))));
// (点击)...3s...'Hello I made it!'...(点击)...2s(点击)...
example.subscribe(val => console.log(val));
```

##### switch?

https://cn.rx.js.org/class/es6/Observable.js~Observable.html#instance-method-switch

打平操作符

interval

#### 组合操作符

##### `concat()`🌟

按顺序订阅 Observables，但是只有当一个完成并让我知道，然后才会开始下一个

> 当顺序很重要时，使用此操作符，例如当你需要按顺序的发送 HTTP 请求时

```js
// 模拟 HTTP 请求
const getPostOne$ = timer(3000).pipe(mapTo({ id: 1 }));
const getPostTwo$ = timer(1000).pipe(mapTo({ id: 2 }));

// 输出：49, { id: 1 } 52, { id: 2 } 53
console.log(new Date().getSeconds());
concat(getPostOne$, getPostTwo$).subscribe(res => console.log(res, new Date().getSeconds()));
```

##### `forkJoin()`⭐

forkJoin 是 Rx 版的 Promise.all()

直到所有的 Observables 都完成了才通知我，然后一次性地给我所有的值(以数组的形式)

> 当需要并行地运行 Observables 时使用此操作符

```js
// 模拟 HTTP 请求
const getPostOne$ = timer(3000).pipe(mapTo({ id: 1 }));
const getPostTwo$ = timer(2000).pipe(mapTo({ id: 2 }));

// 输出：
// 46,
// [ { id: 1 }, { id: 2 } ] 49
console.log(new Date().getSeconds());
forkJoin(getPostOne$, getPostTwo$).subscribe(res => console.log(res, new Date().getSeconds()));
```
