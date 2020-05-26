Sec-Fetch-Mode: cors

```
http请求中如果有这样的设置Content-Type:application/json;charset=UTF-8，那么该请求就是费简单请求，跨域时会发送两次请求，一次option预请求、一次get或post正式请求。如果option预请求发现后端不支持跨域，就会直接报错，不发送正式请求了。
```

CORS

https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS

https://www.ruanyifeng.com/blog/2016/04/cors.html