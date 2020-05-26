### 原理

- Secure

  标记为 Secure 的 Cookie 只应通过被 HTTPS 协议加密过的请求发送给服务端。但即便设置了 Secure 标记，敏感信息也不应该通过 Cookie 传输，因为 Cookie 有其固有的不安全性，Secure 标记也无法提供确实的安全保障。从 Chrome 52 和 Firefox 52 开始，**不安全的站点（http:）无法使用 Cookie 的 Secure 标记**。

* HttpOnly

  为避免跨域脚本 (XSS) 攻击，通过 JavaScript 的 Document.cookie API 无法访问带有 HttpOnly 标记的 Cookie，它们只应该发送给服务端。如果包含服务端 Session 信息的 Cookie 不想被客户端 JavaScript 脚本调用，那么就应该为其设置 HttpOnly 标记。

* Expires/Max-Age

  > expires 参数是当年网景公司推出 Cookies 原有的一部分。在 HTTP1.1 中，expires 被弃用并且被更加易用的 max-age 所替代。你只需说明这个 Cookie 能够存活多久就可以了，而不用像之前那样指定一个日期。设置二者中的一个，Cookie 会在它过期前一直保存，如果你一个都没有设置，这个 Cookie 将会一直存在直到你关闭浏览器，这种称之为 Session Cookie。

  [Http Cookies 中 Max-age 和 Expires 有什么区别？](https://jpanj.com/2017/cookies-max-age-vs-expires)

* SameSite

  > 由于 Cookie 的“sameSite”属性设置为“none”，但缺少“secure”属性，此 Cookie 未来将被拒绝

  SameSite Cookie 允许服务器要求某个 cookie 在跨站请求时不会被发送，从而可以阻止跨站请求伪造攻击（CSRF）。

SameSite cookies 是相对较新的一个字段，所有主流浏览器都已经得到支持。

下面是例子：

Set-Cookie: key=value; SameSite=Strict
SameSite 可以有下面三种值：

None

浏览器会在同站请求、跨站请求下继续发送 cookies，不区分大小写。

Strict

浏览器将只在访问相同站点时发送 cookie。（在原有 Cookies 的限制条件上的加强，如上文“Cookie 的作用域” 所述）

Lax

在新版本浏览器中，为默认选项，Same-site cookies 将会为一些跨站子请求保留，如图片加载或者 frames 的调用，但只有当用户从外部站点导航到 URL 时才会发送。如 link 链接

> 以前，如果 SameSite 属性没有设置，或者没有得到运行浏览器的支持，那么它的行为等同于 None，Cookies 会被包含在任何请求中——包括跨站请求。

但是，在新版本的浏览器中，SameSite 的默认属性是 SameSite=Lax。换句话说，当 Cookie 没有设置 SameSite 属性时，将会视作 SameSite 属性被设置为 Lax——这意味着 Cookies 将会在当前用户使用时被自动发送。如果想要指定 Cookies 在同站、跨站请求都被发送，那么需要明确指定 SameSite 为 None

<https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers/Set-Cookie/SameSite>

### 应用

#### npm 包

[CookieService](https://www.npmjs.com/package/ngx-cookie-service)

Secure false
HttpOnly -
SameSite Strict
