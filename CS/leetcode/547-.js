// <https://leetcode-cn.com/problems/friend-circles/>
// 图

/**
 * @param {number[][]} M
 * @return {number}
 */

let friends = [];

let firendsCircle = [];

let getCircle = (friends) => {
  let circle = 0;

  friends.forEach((friend, i) => {
    friend.forEach((value, j) => {
      if (i < j && value === 1) {
        circle++;
      }
    });
  });

  return circle;

  // 总数  (n)(n-1)/2
};

friends = [
  [1, 1, 0],
  [1, 1, 0],
  [0, 0, 1],
];

friends = [
  [1, 1, 0],
  [1, 1, 1],
  [0, 1, 1],
];

friends = [
  [, "0", "1", "2"],
  ["0", 1, 1, 0],
  ["1", 1, 1, 1],
  ["2", 0, 1, 1],
];

console.log(friends, getCircle(friends));

var findCircleNum = function (M) {};
