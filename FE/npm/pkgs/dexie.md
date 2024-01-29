---
id: dexie
title: dexie
---

https://www.npmjs.com/package/dexie

[学习文档](https://dexie.org/)

#### 安装

```bash
npm install dexie --save
### 如要添加监测数据变动功能，需要安装dexie-observable
nom install dexie-observable --save
```

#### Import dexie

```javascript
import Dexie from "dexie";
```

#### 定义数据结构

```typescript
/** 数据库信息
 * @param { string } name 名称
 * @param { number } version 版本号
 * @param { string } tableName 表名称
 */
const dbInfo = {
  name: "bss-product",
  version: 1007,
  tableName: "calculator"
};

export class IndexedDB extends Dexie {
  constructor() {
    // 数据库名称
    super(dbInfo.name);
    this.version(dbInfo.version).stores({
      calculator: "id, createTime, updateTime, productLine"
    });
    this.calculator = this.table(dbInfo.tableName);
  }

  calculator: Dexie.Table<ProductInfo, string>; // number = type of the primkey
}
```

#### 创建数据库

```typescript
import { IndexedDB } from "./indexDB";

private db = new IndexedDB();
```

#### 数据操作服务

```typescript
## 获取所有数据
async getProducts() {
    // getAllData(): Observable<any> {
    await this.db.open().catch(error => {
      this.delDB();
      this.getProducts();
      return;
    });

    let table = [];
    await this.db.calculator
      .orderBy("updateTime")
      .reverse()
      .each(item => (table = [...table, item]));
    return table;
  }
## 插入数据
  insert(table: ProductInfo) {
    this.db.calculator.put(table);
  }
## 删除指定ID数据数据
  delete(id: string) {
    this.db.calculator
      .where("id")
      .equals(id)
      .delete();
  }
## 获取指定ID数据
  async getProduct(id) {
    return await this.db.calculator.get(id);
  }
## 编辑指定ID数据
  updateData(table) {
    this.db.calculator
      .update(table.id, {
        productLine: table.productLine,
        chargeType: table.chargeType,
        duration: table.duration,
        durationUnit: table.durationUnit,
        price: table.price,
        productPrice: table.productPrice
      })
      .catch(err => {
        console.error("update data failed: ", err);
      });
  }
```

#### 监测数据变化

```typescript
## 数据结构定义时，引入dexie-observable
import "dexie-observable";

## 创建服务
  catchChange = new Observable(observer => {
    this.db.on("changes", () => {
      observer.next();
    });
  });
## 调用服务
  private productsChange() {
    this.indexedDB.catchChange.subscribe(() => {
      this.setProducts();
    });
  }

```
