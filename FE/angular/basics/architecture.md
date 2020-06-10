### 架构

![overview](https://angular.cn/generated/images/guide/architecture/overview2.png)

- 模块 NgModule
- 组件 Component
  - 模板、指令和数据绑定
- 服务与依赖注入 Service&DI
- 路由 Route

#### 模块

```typescript
@NgModule({
  imports: [BrowserModule],
  providers: [Logger],
  declarations: [AppComponent],
  exports: [AppComponent],
  bootstrap: [AppComponent],
})
export class AppModule {}
```

#### 组件

##### 组件的元数据 Metadata

```typescript
@Component({
  selector: "app-hero-list",
  templateUrl: "./hero-list.component.html",
  providers: [HeroService],
})
export class HeroListComponent implements OnInit {
  /* . . . */
}
```

##### 模板与视图

![Component tree](https://angular.cn/generated/images/guide/architecture/component-tree.png)

##### 模板语法

- 数据绑定

![Data Binding](https://angular.cn/generated/images/guide/architecture/databinding.png)

```html
<li>{{hero.name}}</li>
<app-hero-detail [hero]="selectedHero"></app-hero-detail>
<li (click)="selectHero(hero)"></li>
<input [(ngModel)]="hero.name" />
```

双向绑定

![Data Binding](https://angular.cn/generated/images/guide/architecture/component-databinding.png)

父子组件通信

![Parent/Child binding](https://angular.cn/generated/images/guide/architecture/parent-child-binding.png)

- 管道
- 指令

#### 服务和依赖注入

##### 服务范例

```typescript
export class HeroService {
  /* . . . */
}
```

##### 依赖注入

![Service](https://angular.cn/generated/images/guide/architecture/dependency-injection.png)

```typescript
@Injectable()

constructor(private service: HeroService) { }
```

![Service](https://angular.cn/generated/images/guide/architecture/injector-injects.png)

提供服务

+ ```typescript
  @Injectable({
    providedIn: 'root',
  })
  export class HeroService {}
  ```

+ ```typescript
  @NgModule({
    providers: [
     HeroService
   ],
   ...
  })
  ```

+ ```typescript
  @Component({
    selector:    'app-hero-list',
    templateUrl: './hero-list.component.html',
    providers:  [ HeroService ]
  })
  ```

#### [路由](./router.md)