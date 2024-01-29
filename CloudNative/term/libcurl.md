---
title: C++ with Libcurl
date: 2018-04-17 18:21:36
tags:
  - curl
categories:
  - SDN
---

> ### 开源 C++库
>
> http://zh.cppreference.com/w/cpp/links/libs

https://github.com/mrtazz/restclient-cpp

https://github.com/Microsoft/cpprestsdk

https://github.com/jpbarrette/curlpp

libcurl

---

`001.cpp`

```c++
#include <iostream>

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
```

```bash
g++ 001.cpp -o 001
```

---

```http
http://192.168.56.101:8080/wm/core/controller/switches/json
```

### cpprestsdk

#### 0x01 Install

```bash
brew install cpprestsdk
```

### libcurl

https://blog.csdn.net/cjf_wei/article/details/79118415

https://blog.csdn.net/cjf_wei/article/details/79185310

> 在新版中把 curl/types.h 合并到了 curl/curl.h 中
