---
title: 更改Apache根目录
date: 2016-11-17 14:58:49
tags:
- Server
- Apache
---

### 更改Apache根目录

```bash
cd  /etc/apache2/sites-available/
cp 000-default.conf wp-blog.conf
vim wp-blog.conf
```

文件配置如下

```bash
<VirtualHost *:80>  
        ServerAdmin webmaster@localhost  
  
          
  
        DocumentRoot /var/www/XXXX 
        <Directory /var/www/XXXX>  
                Options Indexes FollowSymLinks MultiViews  
                AllowOverride None  
                Order allow,deny  
                allow from all  
        </Directory>  
  
        ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/  
        <Directory "/usr/lib/cgi-bin">  
                AllowOverride None  
                Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch  
                Order allow,deny  
                Allow from all  
        </Directory>  
  
        ErrorLog ${APACHE_LOG_DIR}/error.log  
  
        # Possible values include: debug, info, notice, warn, error, crit,  
        # alert, emerg.  
        LogLevel warn
```

```bash
ln -s /etc/apache2/sites-available/wp-blog.conf /etc/apache2/sites-enabled/wp-blog.conf  ### 建立链接
rm -rf 000-default.conf ../sites-enabled/000-default.conf
/etc/init.d/apache2 restart ### 重启Apache服务器 
```

