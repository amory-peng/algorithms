class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    out = @store.pop
    @store = BinaryMinHeap.heapify_down(@store, 0)
    out
  end

  def peek
  end

  def push(val)
    @store << val
    @store = BinaryMinHeap.heapify_up(@store, @store.length - 1)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    c_idx1 = parent_index * 2 + 1 < len ? parent_index * 2 + 1 : nil
    c_idx2 = parent_index * 2 + 2 < len ? parent_index * 2 + 2 : nil
    [c_idx1, c_idx2].reject {|el| el.nil? }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new do |el1, el2|
      el1 <=> el2
    end
    #get child indices
    children = child_indices(len, parent_idx)

    if children.length == 1
      smallest_child = children[0]
    elsif children.length == 0
      return array
    else
      smallest_child = prc.call(array[children[0]], array[children[1]]) == -1 ? children[0] : children[1]
    end
    if prc.call(array[parent_idx], array[smallest_child]) == 1
      array[parent_idx], array[smallest_child] = array[smallest_child], array[parent_idx]
      heapify_down(array, smallest_child, len, &prc)
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new do |el1, el2|
      el1 <=> el2
    end
    #get child indices
    return array if child_idx == 0
    parent_idx = parent_index(child_idx)

    if prc.call(array[parent_idx], array[child_idx]) == 1
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      heapify_up(array, parent_idx, len, &prc)
    end
    array
  end
end
