// 给定两个数组，编写一个函数来计算它们的交集。

// 说明：

// 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
// 我们可以不考虑输出结果的顺序。
// 进阶:

// 如果给定的数组已经排好序呢？你将如何优化你的算法？
// 如果 nums1 的大小比 nums2 小很多，哪种方法更优？
// 如果 nums2 的元素存储在磁盘上，磁盘内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？

/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */
var intersect = function(nums1, nums2) {
  let result = [],
    start2 = 0;

  result.filter;

  for (let i = 0; i < nums1.length; i++) {
    for (let j = start2; j < nums2.length; j++) {
      if (nums1[i] === nums2[j]) {
        result = [...result, nums2[j]];
        nums2.splice(j, 1);
        break;
      }
    }
  }
  return [...result];
};

// var nums1 = [1, 2, 2, 1],
//   nums2 = [2, 2];

// var nums1 = [7, 2, 5, 8, 2],
//   nums2 = [1, 2, 3, 4, 5, 6, 7, 2];

// var nums1 = [1, 2, 7, 2, 1],
//   nums2 = [7, 2, 3];

var nums1 = [8, 0, 3],
  nums2 = [0, 0];

var result = intersect(nums1, nums2);
console.log(result);
// 输入: nums1 = [1,2,2,1], nums2 = [2,2]
// 输出: [2,2]
// 示例 2:

// 输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
// 输出: [4,9]

// [7,2,5,8,2]
// [1,2,3,4,5,6,7,2]

// [1,2,2,1]
// [2]
