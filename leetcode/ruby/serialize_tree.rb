def serialize(root)
  if root.nil?
    [nil]
  else
    out = []
    out << root.val
    out += serialize(root.left)
    out += serialize(root.right)
    out
  end
end

def deserialize(arr)
  val = arr.shift
  if val.nil?
    return
  else
    root = TreeNode.new(val)
    root.left = deserialize(arr)
    root.right = deserialize(arr)
    root
  end
end
