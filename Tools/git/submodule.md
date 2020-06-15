```bash
git submodule add git@github.com:jjz/pod-library.git pod-library

git submodule add git@git.inspur.com:typescript/doc/document.git docs
```

> #### 仅拉取

```bash
git pull && git submodule update
```

> #### 同步

```bash
git submodule foreach git pull

git add docs/ && git commit -m "update git submodule" && git push
```

```bash
git rm --cached pod-library
```

---

- [Git Submodule 管理项目子模块](https://www.cnblogs.com/nicksheng/p/6201711.html)
- [使用 Git Submodule 管理子模块](https://segmentfault.com/a/1190000003076028)
