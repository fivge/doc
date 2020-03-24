// 什么是防抖和节流？有什么区别？如何实现？
// 闭包 this指向
// TODO: try to add rxjs support

// 防抖
let inp = document.getElementById("inp");
inp.addEventListener("input", debounce(sayHi)); // 防抖

function debounce(fn) {
  let timer = null;
  return function() {
    clearTimeout(timer);
    timer = setTimeout(() => {
      fn.apply(this, arguments);
      //   fn(); //error 显式绑定 this 值(input对象)到 sayH 函数里面去
      // 普通函数还是箭头函数。如果是箭头函数，则这里的this最终指向的是input对象，如果为普通函数，this则指向window。
    }, 0.5 * 1000);
  };
}

function sayHi() {
  console.log("😀");
  this.style.color = "red";
}

// 节流
window.addEventListener("resize", throttle(sayHi));

function throttle(fn) {
  let canRun = true; // 通过闭包保存一个标记
  return function() {
    if (!canRun) return; // 在函数开头判断标记是否为true，不为true则return
    canRun = false; // 立即设置为false
    setTimeout(() => {
      // 将外部传入的函数的执行放在setTimeout中
      fn.apply(this, arguments);
      // 最后在setTimeout执行完毕后再把标记设置为true(关键)表示可以执行下一次循环了。当定时器没有执行的时候标记永远是false，在开头被return掉
      canRun = true;
    }, 0.5 * 1000);
  };
}

function sayHi(e) {
  console.log("😊", e.target.innerWidth, e.target.innerHeight);
}

// import * as Rx from "./rxjs@6.5.4.js";

// var myObservable = new Rx.Subject();
// myObservable.subscribe(value => console.log(value));
// myObservable.next("foo");
