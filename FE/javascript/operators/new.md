### new

<https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/new>

```js
// 0x01. new 及内存操作及引用
function Car(color) {
  this.color = color;
}
// 创建单个对象
car1 = new Car();
car2 = new Car("blue");
car3 = car1; // car3 变量是对“这个对象”的引用
console.log(car1.color, car2.color, car3.color);

car1.color = "black";
console.log(car1.color, car2.color, car3.color);
car3.color = "red";
console.log(car1.color, car2.color, car3.color);

car3 = car2;
car1 = car2;
console.log(car1.color, car2.color, car3.color);

// 0x02. 深浅拷贝

let foo = {
  name: "foo",
  item: {
    name: "bar",
  },
};
// 两个对象被创建，一个作为另一个的属性被引用，另一个被分配给变量

// 1. 拷贝
let bar = foo;
// 2. ...
let bar = { ...foo };
// 3. JSON
let bar = JSON.parse(JSON.stringify(foo));

bar.name = "new-foo";
bar.item.name = "new-bar";

console.log(bar, "\n", foo);
```

> 如果你没有使用 new 运算符， 构造函数会像其他的常规函数一样被调用， 并不会创建一个对象。在这种情况下， this 的指向也是不一样的。
