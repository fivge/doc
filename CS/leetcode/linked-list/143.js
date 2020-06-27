// 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
// 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…

// 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

// 示例 1:

// 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
// 示例 2:

// 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.

// 1 2 3 4 5 6 7 8
// 1 8 2 7 3 6 4 5

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

// 空间优先
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {void} Do not return anything, modify head in-place instead.
 */
var reorderList1 = function (head) {
  let p = head;

  while (p && p.next && p.next.next) {
    let q = p;

    while (q && q.next && q.next.next) {
      q = q.next;
    }

    q.next.next = p.next;
    p.next = q.next;
    q.next = null;

    p = p.next.next;
  }
};
// 时间优先
/**
 * @param {ListNode} head
 * @return {void} Do not return anything, modify head in-place instead.
 */
var reorderList = function (head) {
  let p = head;
  let q = head;
  // p 为中间节点
  while (q && q.next) {
    p = p.next;
    q = q.next.next ? q.next.next : null;
  }
  // m 为后半段反转链表
  let m = null;
  while (p) {
    let t = p.next;
    p.next = m;
    m = p;
    p = t;
  }

  p = head;
  q = m;

  while (q && q.next) {
    let t = q.next;
    q.next = p.next;
    p.next = q;
    q = t;
    p = p.next.next;
  }
};

/**********************************************************************************************/

// TEST 1
let list = new ListNode(1);
list.next = new ListNode(2);
// list.next.next = new ListNode(3);
// list.next.next.next = new ListNode(4);
// list.next.next.next.next = new ListNode(5);
// list.next.next.next.next.next = new ListNode(6);
// list.next.next.next.next.next.next = new ListNode(7);
// list.next.next.next.next.next.next.next = new ListNode(8);

// TEST 2
// let list = new ListNode(6);

// TEST 3
// let list = new ListNode(1);
// list.next = new ListNode(6);

console.log(_show(list));
console.log('--------------------------------');
reorderList(list);
console.log(_show(list));
