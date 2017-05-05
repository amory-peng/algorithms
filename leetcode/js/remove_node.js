const removeNthFromEnd = function(head, n) {
  let runner = head;
  for (let i = 0; i < n; i++) {
    runner = runner.next;
  }
  if (!runner) return head.next;
  let remove = head;
  while(runner.next) {
    runner = runner.next;
    remove = remove.next;
  }
  remove.next = remove.next.next;
  return head;
};
