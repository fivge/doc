### 变量声明提升

> 由于变量声明（以及其他声明）总是在任意代码执行之前处理的，所以在代码中的任意位置声明变量总是等效于在代码开头声明。这意味着变量可以在声明之前使用，这个行为叫做“hoisting”。“hoisting”就像是把所有的变量声明移动到函数或者全局代码的开头位置。

```js
console.log(a);
var a = 2;
// 可以理解为 =>
var a;
console.log(a);
a = 2;

// undefined
```

与通过 var 声明的有初始化值 undefined 的变量不同，通过 let 声明的变量直到它们的定义被执行时才初始化。在变量初始化前访问该变量会导致 ReferenceError。该变量处在一个自块顶部到初始化处理的“暂存死区”中。

```js
console.log(a);
let a = 2;

// Uncaught ReferenceError: can't access lexical declaration 'a' before initialization
```
