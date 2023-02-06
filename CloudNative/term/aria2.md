- Aria2
- wget
- curl
- axel

### aria2

> Just download a file

```bash
### To prevent downloading the .torrent file
aria2c --follow-torrent=mem <url>

aria2c -j 1 -c -d ~/Downloads -i /path/to/file
```

- Download 1 file at a time (-j)
- continuing (-c) any partially downloaded ones
- to the directory specified (-d)
- reading urls from the file (-i)

```bash
aria2c <url>
# The url can be a http(s), ftp, .torrent file or even a magnet link
aria2c http://foo.tar
aria2c -o bar.tar http://foo.tar
aria2c --max-download-limit=500k http://foo.tar
```

#### online

##### 参考链接

<https://aria2.github.io>

<https://linux.cn/article-7982-1.html>
