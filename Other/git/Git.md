##### Git global setup

```bash
git config --global user.name "fivge"
git config --global user.email "luanxingtong@gmail.com"
```

##### 登录认证

###### (1) http

###### (2) ssh

##### 多人协作

##### commit

```bash
git commit -m "feat(jsajk.ss asj.*): jasdjsak"

feat：新功能（feature）
fix：修补bug
docs：文档（documentation）
style： 格式（不影响代码运行的变动）
refactor：重构（即不是新增功能，也不是修改bug的代码变动）
test：增加测试
chore：构建过程或辅助工具的变动
```

##### Q&A

> ```bash
> fatal: refusing to merge unrelated histories
>
> --allow-unrelated-histories
> ```

> 同步远程分支
>
> ```bash
> git remote update origin -p
> ```

> 强制推送
>
> ```bash
> git push -f
> ```
