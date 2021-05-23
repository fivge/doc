#### 创建 submodule

```bash
git submodule add git@github.com:jjz/pod-library.git pod-library

git submodule add https://github.com/fivge/doc.git docs
```

_其实就是创建了个 `.gitmodules` 及对应的目录 文件_

`.gitmodules`

```
[submodule "docs"]
	path = docs
	url = https://github.com/fivge/doc.git
```

`docs`

```
diff --git a/docs b/docs
new file mode 160000
index 0000000..ac54805
--- /dev/null
+++ b/docs
@@ -0,0 +1 @@
+Subproject commit ac54805c60f48bb4d727c31e08d671a5a449c4b5
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
