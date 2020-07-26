# schematics

```
@angular_devkit/schematics
@angular_devkit/schematics_cli

@schematics/angular🌙
@schematics/schematics
@schematics/update⏳
```

##### usage / config

`@schematics/angular`

```json
{
  "$schema": "./node_modules/@angular/cli/lib/config/schema.json",

  "schematics": {
    "@schematics/angular:class": {
      "skipTests": true
    },
    "@schematics/angular:component": {
      "skipTests": true,
      "flat": false,
      "spec": false,
      "inlineStyle": true,
      "styleext": "less",
      "inlineTemplate": false
    },
    "@schematics/angular:module": {
      "skipTests": true,
      "routing": true,
      "spec": false
    }
  }
}
```

##### new

@angular_devkit/schematics_cli

@schematics/schematics
