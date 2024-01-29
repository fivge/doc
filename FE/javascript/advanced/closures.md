### 闭包

函数和对其周围状态（lexical environment，词法环境）的引用捆绑在一起构成闭包（closure）。也就是说，闭包可以让你从内部函数访问外部函数作用域。在 JavaScript 中，每当函数被创建，就会在函数生成时生成闭包。

```js
function stream(x) {
  console.log(`fun1`);
  return function (y) {
    console.log(`fun2`);
    return x + y;
  };
}

stream(3)(6);
// fun1
// fun2
// 9

let add3 = stream(3);
add3(6);
// 9
```

https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Closures
