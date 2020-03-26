// https://muyiy.cn/question/async/10.html

async function async1() {
  console.log("async1 start");
  await async2();
  console.log("async1 end");
}

async function async2() {
  console.log("async2");
}

console.log("script start");

setTimeout(function() {
  console.log("setTimeout");
}, 0);

async1();

new Promise(function(resolve) {
  console.log("promise1");
  resolve();
}).then(function() {
  console.log("promise2");
});

console.log("script end");

//
// console.log("script start");
// console.log("promise2");
// console.log("promise1");
// console.log("setTimeout");
//
console.log("script start");
console.log("async1 start");
console.log("async2");
console.log("async1 end");
console.log("promise2");
console.log("promise1");
console.log("script end");

console.log("setTimeout");

// script start
// 10.js:2 async1 start
// 10.js:8 async2
// 10.js:20 promise1
// 10.js:26 script end
// 10.js:4 async1 end
// 10.js:23 promise2
// 10.js:14 setTimeout
