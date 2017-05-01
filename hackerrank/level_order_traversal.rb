def level_traversal(root)
  out = []
  queue = []
  queue << root
  until queue.empty?
    current = queue.shift
    out << current.data
    queue << current.left if current.left
    queue << current.right if current.right
  end
  puts out.join(" ")
end
