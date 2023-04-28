---
id: vscode-extensions
title: VSCode扩展
---

### settings

### extensions

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

##### Better Comments

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

##### IntelliCode

##### GitLens

##### git-commit-lint-vscode

```json
  "gitCommitLintVscode.customFormat": "${type}: ",
```

##### Markdown All in One

##### NGINX Configuration Language Support

##### REST Client

##### WSL

##### Prettier

`.prettierrc`

```json
{
  "printWidth": 80,
  "singleQuote": true,
  "tabWidth": 2,
  "useTabs": false,
  "semi": true,
  "trailingCommas": "none",
  "bracketSpacing": true,
  "arrowParens": "avoid"
}
```
