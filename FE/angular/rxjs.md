### map/switchMap

```typescript
ngOnInit() {
  this.hero$ = this.route.paramMap.pipe(
    switchMap((params: ParamMap) =>
      this.service.getHero(params.get('id')))
  );
}

this.hero$.subscribe(res => console.log(res)); // {id:'1',name:'superman'}

this.id$ = this.route.paramMap.pipe(map(params => params.get('id')));
```



你可能想使用 RxJS 的 `map` 操作符。 但 `HeroService` 返回的是一个 `Observable`。 所以你要改用 `switchMap` 操作符来打平这个 `Observable`



### Observable

#### unsubscribe

当在组件中订阅一个可观察对象时，你通常总是要在组件销毁时取消这个订阅。

但是也有少数例外情况不需要取消订阅。 `ActivateRoute` 中的各种可观察对象就是属于这种情况。