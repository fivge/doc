# Github

## 密码

> 安装 git-credential-manager

> 缓存 GitHub 凭据

`GPG/pass`

https://docs.github.com/zh/get-started/getting-started-with-git/caching-your-github-credentials-in-git

https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/credstores.md

```bash
git config --global credential.credentialStore gpg

gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
```

```bash
[keyboxd]
---------
sec   ed25519/A385E0D624F3A47C 2024-01-31 [SC]
      2C81C40C67406D090136B687A385E0D624F3A47C
uid                 [ultimate] fivge (github_gpg_key) <luanxingtong@gmail.com>
ssb   cv25519/173D50748EC62680 2024-01-31 [E]

sec   ed25519/4D54A66AEE24F4BA 2024-01-31 [SC]
      C45D500A6471CE739FDDB4BC4D54A66AEE24F4BA
uid                 [ultimate] fivge (github_auth_key) <luanxingtong@gmail.com>
ssb   cv25519/FF6C6D8420362BE6 2024-01-31 [E]
```

```bash
pass init FF6C6D8420362BE6
```

> git push

提交代码时, 使用 `Device code`

```bash
git push
```

```
Select an authentication method for 'https://github.com/':
  1. Device code (default)
  2. Personal access token
option (enter for default): 1
To complete authentication please visit https://github.com/login/device and enter the following code:
85F5-F9E1
Everything up-to-date
```

### 提交签名验证 `GPG`

https://docs.github.com/zh/authentication/managing-commit-signature-verification

效果如下

![](https://img.0x64.in/2024/01/1506e29d815015d2e29092c02f8dcdae.png)

### `gpg` `pass`

> gpg 删除 key

```bash
gpg --list-secret-keys --keyid-format=long
```

```bash
[keyboxd]
---------
sec   ed25519/A385E0D624F3A47C 2024-01-31 [SC]
      2C81C40C67406D090136B687A385E0D624F3A47C
uid                 [ultimate] fivge (github_gpg_key) <luanxingtong@gmail.com>
ssb   cv25519/173D50748EC62680 2024-01-31 [E]

sec   ed25519/A992509F0FFDEFC7 2023-12-10 [SC] [expires: 2026-12-09]
      A5775E497808BEE313F9DE4EA992509F0FFDEFC7
uid                 [ultimate] github
ssb   cv25519/DDB664D40AE7DBBB 2023-12-10 [E] [expires: 2026-12-09]

sec   ed25519/4D54A66AEE24F4BA 2024-01-31 [SC]
      C45D500A6471CE739FDDB4BC4D54A66AEE24F4BA
uid                 [ultimate] fivge (github_auth_key) <luanxingtong@gmail.com>
ssb   cv25519/FF6C6D8420362BE6 2024-01-31 [E]
```

```bash
gpg --delete-secret-key A992509F0FFDEFC7
gpg --delete-key A992509F0FFDEFC7
```

> gpg 查看私钥

```bash
gpg --armor --export A385E0D624F3A47C
```

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
...
-----END PGP PUBLIC KEY BLOCK-----
```

> pass 删除 key

```bash
pass rm git/https/github.com/fivge
```

## Tips

- `WIP` work in process.

- #37
- Closes #37
