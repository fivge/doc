---
id: date-fns
title: date-fns
---

```ts
import * as fns from "date-fns";
```

### format

```ts
// 年月日时分秒
fns.format(new Date(), "YYYY-MM-DD HH:mm:ss");

// 时间戳 Timestamp
fns.format(new Date(), "X");
fns.format(new Date(), "x"); // string
// <=>
fns.getTime(new Date()); // number
```

### day week month year

> #### day

```ts
// Add Days
fns.addDays(new Date(), -10);

// Get the number of calendar days between the given dates.
fns.differenceInCalendarDays(new Date(), date);
// Get the number of full days between the given dates.
fns.differenceInDays(new Date(), date);
```

> #### week

```ts
// Add Weeks
fns.addWeeks(new Date(), 10);
fns.addWeeks(new Date(), -2);
```

> #### month

```ts
let date;
date = fns.addMonths(new Date(2019, 0, 31), 1);
console.log(fns.format(new Date(2019, 0, 31), "YYYY-MM-DD HH:mm:ss")); // 2019-01-31 00:00:00
date = fns.format(date, "YYYY-MM-DD HH:mm:ss");
console.log(date); // 2019-02-28 00:00:00

// Add Months
fns.addMonths(new Date(2019, 0, 31), 1);
```

> #### year

```ts
fns.addYears(new Date(2019, 0, 31), 1);
```

### More

- https://date-fns.org/v1.30.1/docs
