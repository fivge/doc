### 装饰器

装饰器（Decorators）为我们在类的声明及成员上通过元编程语法添加标注提供了一种方式。

> 若要启用实验性的装饰器特性，必须启用 experimentalDecorators 编译器选项

装饰器是一种特殊类型的声明，它能够被附加到类声明，方法， 访问符，属性或参数上。 装饰器使用 @expression 这种形式，expression 求值后必须为一个函数，它会在运行时被调用，被装饰的声明信息做为参数传入。

```typescript
function sealed(target) {
  // do something with "target" ...
}
```

#### 装饰器工厂

如果我们要定制一个修饰器如何应用到一个声明上，我们得写一个装饰器工厂函数。 装饰器工厂就是一个简单的函数，它返回一个表达式，以供装饰器在运行时调用。

我们可以通过下面的方式来写一个装饰器工厂函数：

```typescript
function color(value: string) {
  // 这是一个装饰器工厂
  return function (target) {
    //  这是装饰器
    // do something with "target" and "value"...
  };
}
```

#### 装饰器组合

多个装饰器可以同时应用到一个声明上，就像下面的示例：

- 书写在同一行上：

```typescript
@f @g x
```

- 书写在多行上：

```typescript
@f
@g
x
```

当多个装饰器应用于一个声明上，它们求值方式与复合函数相似。在这个模型下，当复合*f*和*g*时，复合的结果(_f_ ∘ _g_)(_x_)等同于*f*(_g_(_x_))。

同样的，在 TypeScript 里，当多个装饰器应用在一个声明上时会进行如下步骤的操作：

1. 由上至下依次对装饰器表达式求值。
2. 求值的结果会被当作函数，由下至上依次调用。

```ts
function f() {
  console.log("f(): evaluated");
  return function (
    target,
    propertyKey: string,
    descriptor: PropertyDescriptor
  ) {
    console.log("f(): called");
  };
}

function g() {
  console.log("g(): evaluated");
  return function (
    target,
    propertyKey: string,
    descriptor: PropertyDescriptor
  ) {
    console.log("g(): called");
  };
}

class C {
  @f()
  @g()
  method() {}
}
```

在控制台里会打印出如下结果：

```shell
f(): evaluated
g(): evaluated
g(): called
f(): called
```

#### 装饰器求值

类中不同声明上的装饰器将按以下规定的顺序应用：

1. _参数装饰器_，然后依次是*方法装饰器*，_访问符装饰器_，或*属性装饰器*应用到每个实例成员。
2. _参数装饰器_，然后依次是*方法装饰器*，_访问符装饰器_，或*属性装饰器*应用到每个静态成员。
3. *参数装饰器*应用到构造函数。
4. *类装饰器*应用到类。

#### 类装饰器

*类装饰器*在类声明之前被声明（紧靠着类声明）。 类装饰器应用于类构造函数，可以用来监视，修改或替换类定义。

类装饰器表达式会在运行时当作函数被调用，**类的构造函数作为其唯一的参数**。

如果类装饰器返回一个值，它会使用提供的构造函数来替换类的声明。

> 如果你要返回一个新的构造函数，你必须注意处理好原来的原型链。 在运行时的装饰器调用逻辑中不会为你做这些。

下面是一个重载构造函数的例子。

```ts
function classDecorator<T extends { new (...args: any[]): {} }>(
  constructor: T
) {
  return class extends constructor {
    newProperty = "new property";
    hello = "override";
  };
}

@classDecorator
class Greeter {
  property = "property";
  hello: string;
  constructor(m: string) {
    this.hello = m;
  }
}

console.log(new Greeter("world"));
```

#### 方法装饰器

*方法装饰器*声明在一个方法的声明之前（紧靠着方法声明）。 它会被应用到方法的属性描述符上，可以用来监视，修改或者替换方法定义。

方法装饰器表达式会在运行时当作函数被调用，传入下列 3 个参数：

1. 对于静态成员来说是类的构造函数，对于实例成员是类的原型对象。
2. 成员的名字。
3. 成员的*属性描述符*。

如果方法装饰器返回一个值，它会被用作方法的*属性描述符*。

#### 访问器装饰器

*访问器装饰器*声明在一个访问器的声明之前（紧靠着访问器声明）。 访问器装饰器应用于访问器的属性描述符并且可以用来监视，修改或替换一个访问器的定义

> 注意   TypeScript 不允许同时装饰一个成员的`get`和`set`访问器。取而代之的是，一个成员的所有装饰的必须应用在文档顺序的第一个访问器上。这是因为，在装饰器应用于一个*属性描述符*时，它联合了`get`和`set`访问器，而不是分开声明的。

访问器装饰器表达式会在运行时当作函数被调用，传入下列 3 个参数：

1. 对于静态成员来说是类的构造函数，对于实例成员是类的原型对象。
2. 成员的名字。
3. 成员的属性描述符

如果访问器装饰器返回一个值，它会被用作方法的属性描述符

#### 属性装饰器

*属性装饰器*声明在一个属性声明之前（紧靠着属性声明）

属性装饰器表达式会在运行时当作函数被调用，传入下列 2 个参数：

1. 对于静态成员来说是类的构造函数，对于实例成员是类的原型对象。
2. 成员的名字。

> 注意   *属性描述符*不会做为参数传入属性装饰器，这与 TypeScript 是如何初始化属性装饰器的有关。 因为目前没有办法在定义一个原型对象的成员时描述一个实例属性，并且没办法监视或修改一个属性的初始化方法。返回值也会被忽略。因此，属性描述符只能用来监视类中是否声明了某个名字的属性。

我们可以用它来记录这个属性的元数据，如下例所示：

```ts
class Greeter {
  @format("Hello, %s")
  greeting: string;

  constructor(message: string) {
    this.greeting = message;
  }
  greet() {
    let formatString = getFormat(this, "greeting");
    return formatString.replace("%s", this.greeting);
  }
}
```

然后定义`@format`装饰器和`getFormat`函数：

```ts
import "reflect-metadata";

const formatMetadataKey = Symbol("format");

function format(formatString: string) {
  return Reflect.metadata(formatMetadataKey, formatString);
}

function getFormat(target: any, propertyKey: string) {
  return Reflect.getMetadata(formatMetadataKey, target, propertyKey);
}
```

这个`@format("Hello, %s")`装饰器是个装饰器工厂。 当 `@format("Hello, %s")`被调用时，它添加一条这个属性的元数据，通过`reflect-metadata`库里的`Reflect.metadata`函数。 当 `getFormat`被调用时，它读取格式的元数据。

#### 参数装饰器

*参数装饰器*声明在一个参数声明之前（紧靠着参数声明）。 参数装饰器应用于类构造函数或方法声明

参数装饰器表达式会在运行时当作函数被调用，传入下列 3 个参数：

1. 对于静态成员来说是类的构造函数，对于实例成员是类的原型对象。
2. 成员的名字。
3. 参数在函数参数列表中的索引。

> 注意   参数装饰器只能用来监视一个方法的参数是否被传入。

参数装饰器的返回值会被忽略。

#### 元数据

一些例子使用了`reflect-metadata`库来支持[实验性的 metadata API](https://github.com/rbuckton/ReflectDecorators)。 这个库还不是 ECMAScript (JavaScript)标准的一部分。 然而，当装饰器被 ECMAScript 官方标准采纳后，这些扩展也将被推荐给 ECMAScript 以采纳

```shell
yarn add reflect-metadata
```

> TypeScript 支持为带有装饰器的声明生成元数据。 需要启用`emitDecoratorMetadata`编译器选项

当启用后，只要`reflect-metadata`库被引入了，设计阶段添加的类型信息可以在运行时使用

#### ref

- <https://www.tslang.cn/docs/handbook/decorators.html>
- <https://www.typescriptlang.org/docs/handbook/decorators.html>
- <https://www.mls-tech.info/web/angular/angular-typescript-decorator/>
- <https://zhuanlan.zhihu.com/p/22277764>
- <https://www.cnblogs.com/dashnowords/p/10158537.html>
- <https://www.jianshu.com/p/e280d916495b>
- <https://www.zhihu.com/question/68257128>
- <https://juejin.im/post/5b41f76be51d4518f140f9e4>
