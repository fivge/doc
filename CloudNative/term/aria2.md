- Aria2
- wget
- curl
- axel

### aria2

> Just download a file

# To prevent downloading the .torrent file

aria2c --follow-torrent=mem <url>

# Download 1 file at a time (-j)

# continuing (-c) any partially downloaded ones

# to the directory specified (-d)

# reading urls from the file (-i)

aria2c -j 1 -c -d ~/Downloads -i /path/to/file

<https://aria2.github.io>

```bash
aria2c <url>
# The url can be a http(s), ftp, .torrent file or even a magnet link
# aria2c http://foo.tar
aria2c -o bar.tar http://foo.tar
aria2c --max-download-limit=500k http://foo.tar
```

##### 参考链接

<https://linux.cn/article-7982-1.html>
