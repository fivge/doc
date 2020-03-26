class 引入，只实例化一次，在构造函数处做特殊处理

`js`

```js
// bad
let heroService = new HeroService();
// good
// ? HOW
```

`dart`

```dart
// good
HeroService _heroService;
construct(this._heroService);
```

`typescript`

```typescript
// good
constructor(private heroService: HeroService) {}
```
