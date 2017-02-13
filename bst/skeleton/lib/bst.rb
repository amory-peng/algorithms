class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    return BinarySearchTree.insert!(@root, value) if @root
    @root = BSTNode.new(value)
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    new_node = BSTNode.new(value)
    return new_node if node.nil?
    if node.value >= value
      node.left = BinarySearchTree.insert!(node.left, value)
    else
      node.right = BinarySearchTree.insert!(node.right, value)
    end
    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value
    if node.value >= value
      return BinarySearchTree.find!(node.left, value)
    else
      return BinarySearchTree.find!(node.right, value)
    end
  end

  def self.preorder!(node)
    arr = []
    return arr unless node
    left = BinarySearchTree.preorder!(node.left)
    right = BinarySearchTree.preorder!(node.right)
    [node.value] + left + right
  end

  def self.inorder!(node)
    arr = []
    return arr unless node
    left = BinarySearchTree.inorder!(node.left)
    right = BinarySearchTree.inorder!(node.right)
    left + [node.value] + right
  end

  def self.postorder!(node)
    arr = []
    return arr unless node
    left = BinarySearchTree.postorder!(node.left)
    right = BinarySearchTree.postorder!(node.right)
    left + right + [node.value]
  end

  def self.height!(node)
    return -1 unless node
    left = BinarySearchTree.height!(node.left)
    right = BinarySearchTree.height!(node.right)
    return [left, right].max + 1
  end

  def self.max(node)
    node = node.right while node.right
    node
  end

  def self.min(node)
    node = node.left while node.left
    node
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left
    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node
    if node.value > value
      node.left = BinarySearchTree.delete!(node.left, value)
    elsif node.value < value
      node.right = BinarySearchTree.delete!(node.right, value)
    else
      #simple cases
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      remove = node
      node = node.right.min
      BinarySearchTree.delete_min!(remove.right)
      node.left = remove.left
    end
    node
  end
end
