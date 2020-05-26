### 可选链

<https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/%E5%8F%AF%E9%80%89%E9%93%BE>

可选链操作符?.能够去读取一个被连接对象的深层次的属性的值而无需明确校验链条上每一个引用的有效性。?.运算符功能类似于.运算符，不同之处在于如果链条上的一个引用是 nullish (null 或 undefined)，.操作符会引起一个错误，?.操作符取而代之的是会按照短路计算的方式返回一个 undefined。当?.操作符用于函数调用时，如果该函数不存在也将会返回 undefined。

#### 对象属性

通过使用?.操作符取代.操作符。JavaScript 知道在尝试访问 obj.first.second 之前先明确的校验并确定 obj.firstt 是非 null 且非 undefined。如果 obj.first 是 null 或 undefined，表达式将会短路计算直接返回 undefined。

#### 函数

```js
let result = someInterface.customMethod?.();
```

#### 数组元素

```js
let arrayItem = arr?.[42];
```

```js
let obj =
  Math.random() < 0.5
    ? null
    : {
        first: {
          second: "value",
        },
        arr: [
          {
            times: "10",
          },
        ],
        customMethod() {
          return "custom function";
        },
      };

let name, times, arr4, fun;

// before

// if (obj && obj.first && obj.first.second) {
//   name = obj.first.second;
// }

// if (obj && obj.arr && obj.arr.length > 0 && obj.arr[0].times) {
//   times = obj.arr[0].times;
// }

// if (obj && obj.customMethod()) {
//   fun = obj.customMethod();
// }

// after

name = obj?.first?.second;

times = obj?.arr[0]?.times;

arr4 = obj?.arr?.[3];

fun = obj?.customMethod?.();

console.log(name, times, arr4, fun);
```
