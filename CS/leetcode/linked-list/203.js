// 删除链表中等于给定值 val 的所有节点。

// 示例:

// 输入: 1->2->6->3->4->5->6, val = 6
// 输出: 1->2->3->4->5

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
 * @param {number} val
 * @return {ListNode}
 */
var removeElements = function (head, val) {
  let first = new ListNode(null);
  first.next = head;

  let t = first;

  while (t && t.next) {
    if (t.next.val === val) {
      t.next = t.next.next ? t.next.next : null;
    } else {
      t = t.next;
    }
  }
  return first.next ? first.next : null;
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
// list.next = new ListNode(1);

// TEST 5
// let list = new ListNode(6);
// list.next = new ListNode(6);

console.log(_show(list));
let sList = removeElements(list, 6);
console.log('--------------------------------');
console.log(_show(sList));
