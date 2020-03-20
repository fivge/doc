ACL 全称叫访问控制列表（Access Control List），是一种非常简单的基于角色权限控制方式。一个完全独立 @delon/acl 模块（DEMO）。

---

https://ng-alain.com/acl/getting-started/zh

---

参考`*ngIf`实现权限控制

<https://github.com/angular/angular/blob/master/packages/common/src/directives/ng_if.ts>

aclAllow

aclDeny

---

picture

customPic

customPic=“logo” (length,width / size = “1920x768”)

get(“xxx/xxx/logo”){

pic: “”,



}

toSvg / base64 / xxx 

dom => pic

---

1 === 1

```
// authInfo
userInfo = {
    userId: "",
    userRoal: "a"
}
// roalInfo1
{
    "admin": ["a","b","c"],
    "user": ["m","n"],
    "null": ["x"],
    "all": ["z"]
}
```

// roalInfo2

```
"admin"

```

1 === n

m === n

style

```

[acl]="user"
[acl]="admin"
[acl]="admin,user"
[acl]="all"
[acl]="null"

```

DOM

```

*acl="user"
*acl="admin"
*acl="admin,user"
*acl="all"
*acl="null"

```

or

```
*acl="a"

get().then(
    res => a = "admin"
)

```
