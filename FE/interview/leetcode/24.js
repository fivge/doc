// https://leetcode-cn.com/problems/swap-nodes-in-pairs/
// https://v2ex.com/t/646565
// 始终记住 ListNode 是一个函数而不是对象，next是对象，指向一个新的函数
// https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/new

/**
 * Definition for singly-linked list.
 */
function ListNode(val) {
  this.val = val;
  this.next = null;
}

let list = new ListNode(1);
list.next = new ListNode(2);
list.next.next = new ListNode(3);
list.next.next.next = new ListNode(4);

// 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

// 给定 1->2->3->4, 你应该返回 2->1->4->3.

// HEAD->1->2->3->4
// ~~~~
// ^
// current

// HEAD->1->2->3->4
//          ~
//          ^
//          current

// t->3
// 1->2->3->4

// 1->2->t->3->4

// 1->2->1->3->4
// 1->2->3->4->3->5->6

// 2->1->3->4
// 1->2->4->3->5(->6)

// next level

// 1->2->3->4->5

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
// let swapPairs1 = function (head) {
//   const HEAD = new ListNode();
//   HEAD.next = head;

//   let current = HEAD;
//   while (current.next) {
//     // console.log("debug", current, head);

//     let t = new ListNode();

//     t.next = current.next.next | null;
//     current.next.next = t;
//     t.val = current.val;
//     current = current.next;

//     current.next = swap;
//   }

//   head = JSON.parse(JSON.stringify(head));
//   let current = head;
//   let swap = JSON.parse(JSON.stringify(current));

//   while (swap && swap.next) {
//     console.log("debug", swap.val);
//     let t = new ListNode();

//     t.next = current.next.next | null;
//     current.next.next = t;
//     t.val = current.val;
//     current = current.next;
//     console.log("debug", current, head);

//     // if (current === head) {
//     //   // 1
//     // } else {
//     //   // 3
//     // }
//     // current = current.next;
//     if (current && current.next) {
//       swap = JSON.parse(JSON.stringify(current.next));
//     } else {
//       swap = null;
//     }
//   }

//   return head;
// };

let swapPairs = function (head) {
  let HEAD = new ListNode();
  // const HEAD = new ListNode();
  HEAD.next = head;

  // let current = HEAD; // TODO: 这两处的值与地址绑定的区别
  // while (current.next) {
  //   current.val = "fake" + current.val;
  //   current = current.next; // TODO:
  // }
  // current.val = "fake" + current.val;

  while (HEAD.next) {
    HEAD.val = "fake" + HEAD.val;
    HEAD = HEAD.next; // TODO: Assignment to constant variable
  }
  HEAD.val = "fake" + HEAD.val;

  return HEAD.next;
};
// run

let sList = swapPairs(list);

while (list.next) {
  console.log("source:", list.val);
  list = list.next;
}
console.log("source:", list.val);
console.log("--------------------------------");
if (sList) {
  while (sList.next) {
    console.log("swap:", sList.val);
    sList = sList.next;
  }
  console.log("swap:", sList.val);
}
console.log("swap:", sList);
