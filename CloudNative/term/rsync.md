https://linux.cn/article-12575-1.html

```bash
rsync -rv -e "ssh -p 5230"  foo@example.com:/usr/local/memos ./

rsync -rv -e "ssh -p 5230"  foo@example.com::sync ./
```
