class ListNode
  attr_accessor :val, :next

  def initialize(val)
      @val = val
      @next = nil
  end
end

def rotate_right(head, k)
  return nil unless head
  current = head
  len = 1
  while current.next
    len += 1
    current = current.next
  end
  current.next = head
  (len - k % len).times do
    current = current.next
  end
  temp = current.next
  current.next = nil
  temp
end

a = ListNode.new(1)
a.next = ListNode.new(2)

p rotate_right(a, 1)
