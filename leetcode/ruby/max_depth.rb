class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left, @right = nil, nil
  end
end


def max_depth(root)
  return 0 if root.nil?
  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)
  return [left_depth, right_depth].max + 1
end
