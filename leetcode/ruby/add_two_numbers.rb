def add_two_numbers(l1, l2)
  num1 = ""
  num2 = ""
  current = l1
  while current
    num1 += current.val.to_s
    current = current.next
  end
  current = l2
  while current
    num2 += current.val.to_s
    current = current.next
  end
  sum = (num1.reverse.to_i + num2.reverse.to_i).to_s.to_i
  head = ListNode.new(sum % 10)
  current = head
  sum /= 10
  while sum > 0
    current.next = ListNode.new(sum % 10)
    sum /= 10
    current = current.next
  end
  head

end
