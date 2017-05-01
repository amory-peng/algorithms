def binary_tree_height(root)
  return -1 if root.nil?
  1 + [binary_tree_height(root.left), binary_tree_height(root.right)].max
end
