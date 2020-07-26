#### ngcc

```bash
$ yarn ngcc --help

Options:
  --version                          显示版本号                           [布尔]
  -s, --source                       A path (relative to the working directory)
                                     of the `node_modules` folder to process.
                                                      [默认值: "./node_modules"]
  -p, --properties                   An array of names of properties in
                                     package.json to compile (e.g. `module` or
                                     `es2015`)
                                     Each of these properties should hold the
                                     path to a bundle-format.
                                     If provided, only the specified properties
                                     are considered for processing.
                                     If not provided, all the supported format
                                     properties (e.g. fesm2015, fesm5, es2015,
                                     esm2015, esm5, main, module) in the
                                     package.json are considered.         [数组]
  -t, --target                       A relative path (from the `source` path) to
                                     a single entry-point to process (plus its
                                     dependencies).
                                     If this property is provided then
                                     `error-on-failed-entry-point` is forced to
                                     true
  --first-only                       If specified then only the first matching
                                     package.json property will be compiled.
                                                                          [布尔]
  --create-ivy-entry-points          If specified then new `*_ivy_ngcc`
                                     entry-points will be added to package.json
                                     rather than modifying the ones in-place.
                                     For this to work you need to have custom
                                     resolution set up (e.g. in webpack) to look
                                     for these new entry-points.
                                     The Angular CLI does this already, so it is
                                     safe to use this option if the project is
                                     being built via the CLI.             [布尔]
  --legacy-message-ids               Render `$localize` messages with legacy
                                     format ids.
                                     The default value is `true`. Only set this
                                     to `false` if you do not want legacy
                                     message ids to
                                     be rendered. For example, if you are not
                                     using legacy message ids in your
                                     translation files
                                     AND are not doing compile-time inlining of
                                     translations, in which case the extra
                                     message ids
                                     would add unwanted size to the final source
                                     bundle.
                                     It is safe to leave this set to true if you
                                     are doing compile-time inlining because the
                                     extra
                                     legacy message ids will all be stripped
                                     during translation.   [布尔] [默认值: true]
  --async                            Whether to compile asynchronously. This is
                                     enabled by default as it allows
                                     compilations to be parallelized.
                                     Disabling asynchronous compilation may be
                                     useful for debugging. [布尔] [默认值: true]
  -l, --loglevel                     The lowest severity logging message that
                                     should be output.
                                      [可选值: "debug", "info", "warn", "error"]
  --invalidate-entry-point-manifest  If this is set then ngcc will not read an
                                     entry-point manifest file from disk.
                                     Instead it will walk the directory tree as
                                     normal looking for entry-points, and then
                                     write a new manifest file.
                                                          [布尔] [默认值: false]
  --error-on-failed-entry-point      Set this option in order to terminate
                                     immediately with an error code if an
                                     entry-point fails to be processed.
                                     If `-t`/`--target` is provided then this
                                     property is always true and cannot be
                                     changed. Otherwise the default is false.
                                     When set to false, ngcc will continue to
                                     process entry-points after a failure. In
                                     which case it will log an error and resume
                                     processing other entry-points.
                                                          [布尔] [默认值: false]
  --tsconfig                         A path to a tsconfig.json file that will be
                                     used to configure the Angular compiler and
                                     module resolution used by ngcc.
                                     If not provided, ngcc will attempt to read
                                     a `tsconfig.json` file from the folder
                                     above that given by the `-s` option.
                                     Set to false (via `--no-tsconfig`) if you
                                     do not want ngcc to use any `tsconfig.json`
                                     file.                              [字符串]
  --help                             显示帮助信息                         [布尔]
Done in 7.44s.
```

```
ngcc --properties es2015 browser module main --first-only
```

#### 元编程
