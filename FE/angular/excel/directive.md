## 指令

在 Angular 中有三种类型的指令：

1. 组件 — 拥有模板的指令
2. 结构型指令 — 通过添加和移除 DOM 元素改变 DOM 布局的指令
3. 属性型指令 — 改变元素、组件或其它指令的外观和行为的指令。

**组件**是这三种指令中最常用的。组件可以在原生 HTML 元素中管理一小片区域的 HTML。从技术角度说，它就是一个带模板的指令。
**结构型**指令修改视图的结构。例如，`NgFor` 和 `NgIf` 。
**属性型**指令改变一个元素的外观或行为。例如，内置的 `NgStyle` 指令可以同时修改元素的多个样式。

### 属性型指令

> `appHighlight` / `[appHighlight]="color"`
>
> `@Directive({ selector: "[appHighlight]" })`
>
> 改变一个元素的外观或行为

#### 0x01 构建一个属性型指令，它用于修改一个元素的行为

```bash
ng generate directive highlight
```

属性型指令至少需要一个带有 `@Directive` 装饰器的控制器类。该装饰器指定了一个用于标识属性的选择器。 控制器类实现了指令需要的指令行为。

> 和组件一样，指令也必须在 Angular 模块中进行声明。

`.directive.ts`

```typescript
import { Directive, ElementRef, HostListener, Input } from "@angular/core";

@Directive({
  selector: "[appHighlight]"
})
export class HighlightDirective {
  constructor(private el: ElementRef) {
    el.nativeElement.style.backgroundColor = "yellow";
  }

  @Input("appHighlight") highlightColor: string;
  @Input() defaultColor: string;

  @HostListener("mouseenter") onMouseEnter() {
    this.highlight(this.highlightColor || this.defaultColor || "red");
  }

  @HostListener("mouseleave") onMouseLeave() {
    this.highlight(null);
  }

  private highlight(color: string) {
    this.el.nativeElement.style.backgroundColor = color;
  }
}
```

`.component.ts`

```html
<p appHighlight>Highlight me!</p>

<p [appHighlight]="color" defaultColor="violet">Highlight me!</p>
```

`.module.ts`

```typescript
@NgModule({
  declarations: [HighlightComponent, HighlightDirective]
})
export class DocumentModule {}
```

#### 0x02 把一个指令应用到模板中的某个元素上

`@Directive` 装饰器的配置属性中指定了该指令的[CSS 属性型选择器](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Attribute_selectors) `[appHighlight]`

这里的方括号`[]`表示它的属性型选择器。 Angular 会在模板中定位每个拥有名叫 `appHighlight` 属性的元素，并且为这些元素加上本指令的逻辑。正因如此，这类指令被称为 **属性选择器** 。

`.component.ts`

```html
<p appHighlight>Highlight me!</p>

<p [appHighlight]="color" defaultColor="violet">Highlight me!</p>
```

> #### ElementRef

在指令的构造函数中使用 `ElementRef` 来`注入`宿主 DOM 元素的引用，也就是放置 `appHighlight` 的那个元素。

`ElementRef` 通过其 `nativeElement` 属性给予直接访问宿主 DOM 元素的能力。

```typescript
  constructor(private el: ElementRef) {
    el.nativeElement.style.backgroundColor = "yellow";
  }
```

> 🎯 完善 ElementRef ElementRef .nativeElement 常用用法
>
> style style.backgroundColor
>
> a 标签 href target

#### 0x03 生效周期

- 构造函数中使用
- 响应用户引发的事件
- 指令生命周期

##### 1.构造函数中使用

```typescript
  constructor(el: ElementRef) {
    el.nativeElement.style.backgroundColor = "yellow";
  }
```

##### 2.响应事件以改变指令的行为

`@HostListener` 装饰器订阅某个属性型指令所在的宿主 DOM 元素的事件

> #### @HostListener

> `@HostListener` 装饰器订阅某个属性型指令所在的宿主 DOM 元素的事件。

```typescript
  @HostListener("mouseenter") onMouseEnter() {
    this.highlight(this.highlightColor || this.defaultColor || "red");
  }

  @HostListener("mouseleave") onMouseLeave() {
    this.highlight(null);
  }
```

> 当然，你可以通过标准的 JavaScript 方式手动给宿主 DOM 元素附加一个事件监听器。 但这种方法至少有三个问题：
>
> 1. 必须正确的书写事件监听器。
> 2. 当指令被销毁的时候，必须*拆卸*事件监听器，否则会导致内存泄露。
> 3. 必须直接和 DOM API 打交道，应该避免这样做。

> 🎯 完善 HostListener 使用
>
> 表格高度自适应？

##### 3.指令生命周期

```typescript
  constructor(private el: ElementRef) {}

  ngAfterViewInit() {
    this.el.nativeElement.style.backgroundColor = "yellow";
  }
```

#### 0x04 把值绑定到指令中

使用 `@Input` 数据绑定向指令传递值

```typescript
// 在 @Input 的参数中把该选择器指定为别名，这是清爽、简约的语法。
@Input("appHighlight") highlightColor: string;
@Input() defaultColor: string;
```

```html
<p appHighlight [highlightColor]="color">Highlight me!</p>
<!-- 清爽、简约 -->
<p [appHighlight]="color">Highlight me!</p>
```

### 结构型指令

> `*ngIf`
> xx
>
> 结构型指令的职责是 HTML 布局。 它们塑造或重塑 DOM 的结构，比如添加、移除或维护这些元素

🎯https://angular.cn/guide/structural-directives

> 在一个宿主元素上可以应用多个属性型指令，但只能应用一个结构型指令。

参考 `ngIf` 实现https://github.com/angular/angular/blob/master/packages/common/src/directives/ng_if.ts

---

### 扩展

- https://github.com/arkon/ng-inline-svg
