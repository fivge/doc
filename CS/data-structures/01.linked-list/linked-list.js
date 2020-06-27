function LinkedListNode(value) {
  this.value = value;
  this.next = null;
}

/** show list node */
let _show = (params) => {
  let head = JSON.parse(JSON.stringify(params));
  let value = [];
  while (head.next) {
    value = [...value, head.value];
    head = head.next;
  }
  value = [...value, head.value];
  return value;
};

function add(head, value) {
  let node = new LinkedListNode(value);
  let finish = head;
  if (finish.next) {
    finish = finish.next;
  }
  finish.next = node;
  return head;
}

let n = new LinkedListNode(1);

n = add(n, 2);
n = add(n, 3);
n = add(n, 4);

console.log(_show(n));
