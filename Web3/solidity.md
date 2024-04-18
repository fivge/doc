# Solidity

https://www.wtf.academy/docs/solidity-101/Function

`Solidity`是以太坊虚拟机（`EVM`）智能合约的语言

### 0x01

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract HelloWeb3 {
    string public _string = "Hello Web3!";
}
```

### Solidity 中的变量类型

1. **数值类型(Value Type)**：包括布尔型，整数型等等，这类变量赋值时候直接传递数值。
2. **引用类型(Reference Type)**：包括数组和结构体，这类变量占空间大，赋值时候直接传递地址（类似指针）。
3. **映射类型(Mapping Type)**: `Solidity`里的哈希表。
4. **函数类型(Function Type)**：`Solidity`文档里把函数归到数值类型，但我觉得他跟其他类型差别很大，所以单独分一类。

我们只介绍一些常用的类型，不常用的不讲。这篇介绍数值类型，第 3 讲介绍函数类型，第 4 讲介绍引用和映射。

布尔值的运算符，包括：

- `!` （逻辑非）
- `&&` （逻辑与， "and" ）
- `||` （逻辑或， "or" ）
- `==` （等于）
- `!=` （不等于）

### 2. 整型

整型是`solidity`中的整数，最常用的包括

```solidity
    // 整型
    int public _int = -1; // 整数，包括负数
    uint public _uint = 1; // 正整数
    uint256 public _number = 20220330; // 256位正整数
```

常用的整型运算符包括：

- 比较运算符（返回布尔值）： `<=`， `<`， `==`， `!=`， `>=`， `>`
- 算数运算符： `+`， `-`， 一元运算 `-`， `+`， `*`， `/`， `%`（取余），`**`（幂）
