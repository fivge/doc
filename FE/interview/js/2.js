// ['1', '2', '3'].map(parseInt) what & why ?
// array.map()

let arr = ["1", "2", "3", "4"];
let arr2 = arr.map(x => parseInt(x) + 1);
console.log(arr2);
arr.map((value, index) => {
  console.log(value, index);
});

arr.map(value => {
  console.log(value);
});

arr.map((value, index, array) => {
  console.log(value, index, array);
});
// console.log(arr);
let num = parseInt("1209");

num = parseInt("1209", 4);

num = arr.map(parseInt);
console.log(num);
console.log(arr.map(a => a));

let fn = val => val;
