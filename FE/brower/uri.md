> 辅助功能

<https://www.haorooms.com/post/js_escape_encodeURIComponent>

传输过程中 需要转义 / 关键字等原因，需要对传输的内容——通常为字符串进行编码

> escape()不能直接用于 URL 编码，它的真正作用是返回一个字符的 Unicode 编码值。比如"春节"的返回结果是%u6625%u8282，，escape()不对"+"编码 主要用于汉字编码，现在已经不提倡使用。

> encodeURI()是 Javascript 中真正用来对 URL 编码的函数。 编码整个 url 地址，但对特殊含义的符号"; / ? : @ & = + \$ , #"，也不进行编码。对应的解码函数是：decodeURI()。

> encodeURIComponent() 能编码"; / ? : @ & = + \$ , #"这些特殊字符。对应的解码函数是 decodeURIComponent()。

##### 常见的编码对象：

- uri

  ```js
    encodeURI() decodeURI()

  location.href
  "https://www.w3school.com.cn/jsref/jsref_encodeuri.asp"

  encodeURIComponent(location.href)
  "https%3A%2F%2Fwww.w3school.com.cn%2Fjsref%2Fjsref_encodeuri.asp"

  encodeURI(location.href)
  "https://www.w3school.com.cn/jsref/jsref_encodeuri.asp"
  ```

- http params (url params)

encodeURIComponent

HttpParams

```

```

- ?formData

- html

- img

---

### URLSearchParams

<https://developer.mozilla.org/zh-CN/docs/Web/API/URLSearchParams>

---

其他编码/加密方式

- base64

- md5
