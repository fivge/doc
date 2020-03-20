---
id: json-clone
title: 数组、对象拷贝
---

> #### 0x01 `...`

浅拷贝，只能拷贝最外面一层

`example`

<table>
<thead><tr><th>good</th><th>bad</th></tr></thead>
<tbody>
<tr><td>

```js
let orgin = [1, null, 3, undefined, 5];
let clone = [...orgin];
clone[2] = "changed";
```

</td><td>

```js
const orgin = [
  1,
  {
    code: "source",
    value: 1
  },
  {
    code: "source",
    value: 2
  },
  {
    code: "source",
    value: 3
  },
  {
    code: "source",
    value: 4
  }
];
let clone = [...orgin];
clone[2].value = "changed";

console.log(orgin[2].value); // "changed"
```

</td></tr>
</tbody></table>

> #### 0x02 `JSON.parse(JSON.stringify)`

json 转为字符串再格式化为 json

<table>
<thead><tr><th>good</th><th>bad</th></tr></thead>
<tbody>
<tr><td>

```js
const orgin = [
  1,
  {
    code: "source",
    value: 1
  },
  {
    code: "source",
    value: 2
  },
  {
    code: "source",
    value: 3
  },
  {
    code: "source",
    value: 4
  }
];
let clone = JSON.parse(JSON.stringify(orgin));
```

</td><td>

```js
const orgin = [
  1,
  {
    code: "source",
    value: 1
  },
  {
    code: "source",
    value: 2
  },
  {
    code: "source",
    value: undefined
  },
  {
    code: "source",
    value: 4
  }
];
let clone = JSON.parse(JSON.stringify(orgin));
console.log(clone[3]); // {code:"source"}
```

</td></tr>
</tbody>
</table>

> #### 0x03 `Notification()`

只在浏览器中适用

<https://developer.mozilla.org/zh-CN/docs/Web/API/notification>

```js
function structuralClone(obj) {
  return new Notification("", { data: obj, silent: true }).data;
}

let clone = structuralClone(orgin);
```

### Ref

<https://justjavac.com/javascript/2018/02/02/deep-copy.html>

<https://dassur.ma/things/deep-copy/>
