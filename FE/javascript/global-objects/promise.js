let hero$ = isOk =>
  new Promise((resolve, reject) => {
    console.log('fun in promise');
    if (isOk === true) {
      resolve('ok');
    } else {
      reject('not ok');
    }
  });

console.log('start');

hero$(true)
  .then(res => console.log(res))
  .catch(error => console.log(error));

hero$(false)
  .then(res => console.log(res))
  .catch(error => console.log(error));

// resolve
Promise.resolve(hero$(true))
  .then(res => console.log(res))
  .catch(error => console.log(error));

// all
Promise.all([hero$(true), hero$(true)])
  .then(res => console.log(res))
  .catch(error => console.log(error));

console.log('end');

const wait = ms => new Promise(resolve => setTimeout(resolve, ms));

wait().then(() => console.log(4));
Promise.resolve()
  .then(() => console.log(2))
  .then(() => console.log(3));
console.log(1); // 1, 2, 3, 4
