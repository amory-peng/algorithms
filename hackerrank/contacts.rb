class Node
  def initialize
    @children = {}
    @end_of_word = false
    @size = 0
  end

  def get_node(ch)
    @children[ch]
  end

  def set_node(ch, node)
    @children[ch] = node
  end

  def add(str)
    add_helper(str, 0)
  end

  def add_helper(str, idx)
    return if idx == str.length
    @size += 1
    current = str[idx]
    child = get_node(current)
    if child.nil?
      child = Node.new
      @children[current] = child
    end
    child.add_helper(str, idx + 1)
  end

  def find(str, idx)
    return @size if idx == str.length
    child = get_node(str[idx])
    return 0 if child.nil?
    child.find(str, idx + 1)
  end
end
