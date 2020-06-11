#### 防抖&节流

3.js

#### 节流

#### 重试

```ts
 /** 重试
   *  .pipe(this.backoff(3, 250));
   */
  backoff(maxTries, ms) {
    return pipe(
      retryWhen(attempts =>
        zip(range(1, maxTries), attempts).pipe(
          map(([i]) => i * i),
          mergeMap(i => timer(i * ms))
        )
      )
    );
  }
```

#### rxjs 高级缓存
