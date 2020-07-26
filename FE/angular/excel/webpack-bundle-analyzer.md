#### webpack-bundle-analyzer

```bash
yarn add webpack-bundle-analyzer -D

ng build --stats-json

webpack-bundle-analyzer dist/{project}/stats.json
```

#### source-map-explorer

```bash
npm install source-map-explorer --save-dev
ng build --prod --source-map
ls dist/*.bundle.js
node_modules/.bin/source-map-explorer dist/main.*.bundle.js
```
