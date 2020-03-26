console.log(
  [3, 15, 8, 29, 102, 22].sort((a, b) => {
    console.log(a, b, a > b);
    return a - b;
  })
  //   [1, 2, 3, 4, 5, 6, 7, 8].sort((a, b) => {
  //     console.log(a, b);
  //     return -8;
  //   })
);
// 153 15 31
// 153 31 => 153 31 15
// 2 1
// 3 8 15
// +
[].sort((a, b) => a - b);
// -
[].sort((a, b) => b - a);
