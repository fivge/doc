// var a = 10;
// (function() {
//   console.log(a);
//   a = 5;
//   console.log(window.a);
//   //   var a = 20;
//   console.log(a);
// })();

var b = 10;
var that = this;

(function b() {
  var b = 20;
  console.log(this.b);
  console.log(window.b);
  console.log(that.b);
  console.log(b);
})();

// function b() {
//   b = 20;
//   //   console.log(b);
// }
// console.log(b);
