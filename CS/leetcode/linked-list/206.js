// 反转一个单链表。

// 示例:

// 输入: 1->2->3->4->5->NULL
// 输出: 5->4->3->2->1->NULL
// 进阶:
// 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

/**
 * Definition for singly-linked list.
 */
function ListNode(val) {
  this.val = val;
  this.next = null;
}

/** show list node */
let _show = params => {
  let head = JSON.parse(JSON.stringify(params));
  let val = [];
  while (head && head.next) {
    val = [...val, head.val];
    head = head.next;
  }
  val = [...val, head && head.val ? head.val : null];
  return val;
};

/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var reverseList = function (head) {
  let last = null;

  let first = head;

  while (first) {
    let t = first.next;
    first.next = last;
    last = first;
    first = t;
  }

  return last;
};

/**********************************************************************************************/

// TEST 1
let list = new ListNode(6);
list.next = new ListNode(2);
list.next.next = new ListNode(6);
list.next.next.next = new ListNode(6);
list.next.next.next.next = new ListNode(4);
list.next.next.next.next.next = new ListNode(5);
list.next.next.next.next.next.next = new ListNode(6);

// TEST 2
// let list = new ListNode(6);

// TEST 3
// let list = new ListNode(1);
// list.next = new ListNode(6);

// TEST 4
// let list = new ListNode(6);
// list.next = new ListNode(6);

// TEST 5
// let list = new ListNode(null);

console.log(_show(list));
let sList = reverseList(list);
console.log('--------------------------------');
console.log(_show(sList));
