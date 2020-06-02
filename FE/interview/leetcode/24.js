/**
 * 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表
 *
 * 给定 1->2->3->4, 你应该返回 2->1->4->3.
 *
 * <https://leetcode-cn.com/problems/swap-nodes-in-pairs/>
 */

/**
 * Definition for singly-linked list.
 */
function ListNode(val) {
  this.val = val;
  this.next = null;
}

/** show list node */
let _show = (params) => {
  let head = JSON.parse(JSON.stringify(params));
  let val = [];
  while (head.next) {
    val = [...val, head.val];
    head = head.next;
  }
  val = [...val, head.val];
  return val;
};

// 给定 1->2->3->4, 你应该返回 2->1->4->3.
// 思想
// HEAD->1->2->3->4
// ~~~~
// ^
// current

// HEAD->2->1->3->4
//          ~
//          ^
//          current

// while

// t->3
// 1->2->3->4
// ^
// head

// t(1)->3
// 1->2->3->4
// ^
// head

// HEAD->1->2->1->3->4
// ^     ^
// current
//       head

// HEAD->2->1->3->4
// ^
// current

// HEAD->2->1->3->4
//          ^
//          current

// next level

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
let swapPairs = function (head) {
  const HEAD = new ListNode();
  HEAD.next = head;

  let current = HEAD;
  while (current && current.next && current.next.next) {
    let head = current.next;
    let t = new ListNode();

    t.next = head.next.next;
    t.val = head.val;
    head.next.next = t;
    current.next = head.next;
    head = null;

    current = current.next.next;
  }

  return HEAD.next;
};

// run
// let list = new ListNode();
let list = new ListNode(1);
list.next = new ListNode(2);
list.next.next = new ListNode(3);
list.next.next.next = new ListNode(4);
// list.next.next.next.next = new ListNode(5);

console.log("source:", _show(list));
let sList = swapPairs(list);
console.log("--------------------------------");
console.log("swap:", _show(sList));
