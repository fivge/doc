#### Forms

If you use ngForm element selector to create Angular Forms, you should instead use ng-form.

#### AppModule 抽屉

不再需要 `entryComponents` 和 `ANALYZE_FOR_ENTRY_COMPONENTS`

If you have specified any entryComponents in your NgModules or had any uses of ANALYZE_FOR_ENTRY_COMPONENTS, you can remove them. They are no longer required with the Ivy compiler and runtime.

以前，`NgModule` 定义中的 `entryComponents` 数组用于告诉编译器将动态创建和插入哪些组件。改用 Ivy 后，将不再需要它们，并且可以从现有模块声明中删除 `entryComponents` 数组。`ANALYZE_FOR_ENTRY_COMPONENTS` 注入令牌也是如此。

### 第三方库

#### dfs-data
