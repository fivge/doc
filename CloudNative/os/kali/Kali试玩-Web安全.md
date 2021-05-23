---
title: Kali试玩-Web安全
date: 2017-03-18 23:45:13
tags:
- Web安全
- Kali
---

> OWASP Mantra

<http://www.getmantra.com/owasp-mantra.html>

apt install owasp-mantra-ff

<!-- more -->

> Firefox插件

- `Tamper Data`
  这个插件能够在请求由浏览器发送之后,捕获任何到达服务器的请求。这提供给我们了在将数据引入应用表单之后,在它到达服务器之前修改它的机会。
- `Cookies Manager+`
  这个插件允许我们查看,并有时候修改浏览器从应用受到的 Cookie
  的值。
- `Firebug`
  这是任何 Web 开发者的必需品。它的主要功能是网页的内嵌调试器。它也在
  你对页面执行一些客户端修改时非常有用。
- `Hackbar`
  这是一个非常简单的插件,帮助我们尝试不同的输入值,而不需要修改或重
  写完整的 URL。在手动检查跨站脚本工具和执行注入的时候,我们会很频繁地使用它。
- `Http Requester`
  使用这个工具,我们就能构造 HTTP 链接,包括 GET、POST 和 PUT
  方法,并观察来自服务器的原始响应。
- `Passive Recon`
  它允许我们获得关于网站被访问的公共信息,通过查询 DNS 记录、
  WHOIS、以及搜索信息,例如邮件地址、链接和 Google 中的合作者。
- XSS Me
- SQL Inject Me
- FoxyProxy
- iMacros
- FirePHP
- RESTClient
- Wappalyzer

> 漏洞虚拟机

- OWASP BWA( Broken Web Apps)的虚拟机

  <https://sourceforge.net/projects/owaspbwa/files/1.2/>

- VulnHub

  <https://www.vulnhub.com/>

- bWapp Bee-box

  <https://www.vulnhub.com/entry/bwapp-beebox-v16,53/>

  <http://www.freebuf.com/sectool/76885.html>

> 客户端虚拟机

  <http://dev.modern.ie/tools/vms/#downloads>

   1.8 P22