---
id: vscode-extensions
title: VSCode扩展
---

## 0x01 settings

##### use `code .` in terminal

https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line

## 0x02 extensions

### 1. 外观

##### background

https://github.com/shalldie/vscode-background

```json
  "background.useDefault": false,
"background.customImages": [
    ""
  ],
  "background.fullscreen": {
    "image": "",
    "opacity": 0.98,
    "size": "cover",
    "position": "center",
    "interval": 0
  },
```

##### HardHacker Theme

##### Dracula Theme Official

##### Material Icon Theme


### 2. 代码相关

#### 2.1 代码提示

##### Better Comments Next ~~Better Comments~~ 

##### TODO Highlight

```json
  "todohighlight.isCaseSensitive": false,
  "todohighlight.keywords": [
    {
      "text": "TODO",
      "color": "#ffbd2a"
      // "overviewRulerColor": "rgba(255,189,42,0.8)"
    },
    {
      "text": "FIXME",
      "color": "#f06292",
      "overviewRulerColor": "rgba(240,98,146,0.8)",
      "isWholeLine": true
      // "fontWeight": 800
    },
  ],
  "todohighlight.defaultStyle": {
    "backgroundColor": "rgba(255,255,255,0)"
  },
```

##### Color Highlight

##### GitLens

#### 2.2 代码编辑

##### IntelliCode

##### git-commit-lint-vscode

```json
  "gitCommitLintVscode.customFormat": "${type}: ",
```

##### Prettier

```json
  "editor.defaultFormatter": "esbenp.prettier-vscode",
```



`.prettierrc`

```json
{}
```


#### 2.3 特定语言插件

##### NGINX Configuration Language Support

##### Markdown All in One

##### vscode-styled-components

##### YAML

##### Svelte for VS Code

### 3. 工具



##### REST Client

##### WSL

