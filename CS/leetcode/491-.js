/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var findSubsequences = function (nums) {
  for (let i = 0, len = nums.length; i < len; i++) {
    for (j = 0; j < i; j++) {
      if (nums[i] < nums[j]) {
        let t = nums[i];
        nums[i] = nums[j];
        nums[j] = t;
      }
    }
  }
  console.log(nums);

  for (let i = 0, len = nums.length; i < len - 1; i++) {
    for (j = i + 1; j < len; j++) {
      if (nums[i] < nums[j]) {
        let t = nums[i];
        nums[i] = nums[j];
        nums[j] = t;
      }
    }
  }

  return nums;
};

// 4 5 6 7 8
let inputs = [7, 7, 6, 4, 5];
console.log(nums);

// 4.6.7.7
let outputs = [
  [4, 6],
  [4, 7],
  [4, 6, 7],
  [4, 6, 7, 7],
  [6, 7],
  [6, 7, 7],
  [7, 7],
  [4, 7, 7],
];
