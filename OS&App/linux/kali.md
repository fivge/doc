> lynis

测试及搜集信息的审计工具

> Metasploit

```
    msfconsole
```

[配置](http://www.freebuf.com/articles/system/8381.html)

> Windows 靶机

https://technet.microsoft.com/en-US/ms376608

> Linux 靶机

http://www.distrowatch.com

> WordPress

- http://www.turnkeylinux.org

  https://www.turnkeylinux.org/wordpress

- Wordpress 测试

  wpscan

> DNS 资源记录

收集 DNS 信息

- `DS` Name Server
- `SQ` Start of Authority 起始授权记录
- `CNAME` Canonical Name 　别名记录
- `MX` Mail Exchanger 　邮件交换记录
- `A` 主机记录
- `SRV记录`

> OWASP Mantra

http://www.getmantra.com/owasp-mantra.html

apt install owasp-mantra-ff

> Firefox 插件

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

  https://sourceforge.net/projects/owaspbwa/files/1.2/

- VulnHub

  https://www.vulnhub.com/

- bWapp Bee-box

  https://www.vulnhub.com/entry/bwapp-beebox-v16,53/

  http://www.freebuf.com/sectool/76885.html

> 客户端虚拟机

http://dev.modern.ie/tools/vms/#downloads

1.8 P22

> maltego

---

### KALI

```
nmap -sn luanju.me

nmap luanju.me

nmap -sV -o luanju.me

nmap -sV -O  luanju.me

nmap -sV -O  luanju.me

nmap-p80,443--script=http-waf-detect luanju.me

nmap -p80,443--script=http-waf-detect luanju.me

nmap -p80,443 --script=http-waf-detect luanju.me

msfconsole

beef-xss

metaflac

metasploit

dnsenum --enmu luanju.me

snmpwalk -c public luanju.me -v 2c

dmitry -wnspb luanju.me -o Kali/Results/dmitry-result

netmask -s luanju.me
```

EmPyre

> # Kali

### 虚拟机

http://www.evil0x.com/posts/838.html

http://www.freebuf.com/sectool/130526.html

http://www.freebuf.com/articles/system/130288.html

http://www.freebuf.com/sectool/118715.html

http://www.91ri.org/16398.html

http://blog.163.com/gou_ya/blog/static/1020805802011020554036/

http://www.91ri.org/4408.html

http://ettercap.github.io/ettercap/get-involved.html
