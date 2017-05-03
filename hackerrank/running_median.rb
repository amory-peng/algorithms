class MinHeap
  attr_accessor :store
  def initialize
    @store = []
  end

  def push(val)
    @store << val
    heapify_up(@store.length - 1)
  end

  def heapify_up(idx)
    parent_idx = parent(idx)
    return @store if parent_idx < 0
    if @store[idx] < @store[parent_idx]
      @store[idx], @store[parent_idx] = @store[parent_idx], @store[idx]
      heapify_up(parent_idx)
    end
    @store
  end

  def pop
    @store[0], @store[-1] = @store[-1], @store[0]
    out = @store.pop
    heapify_down(0)
    out
  end

  def heapify_down(idx)
    children = children(idx)
    child = -1
    if children.empty?
      return @store
    elsif children.length == 1
      child = children[0]
    else
      child = @store[children[0]] > @store[children[1]] ? children[1] : children[0]
    end
    if @store[idx] > @store[child]
      @store[idx], @store[child] = @store[child], @store[idx]
      heapify_down(child)
    end
    @store
  end

  def children(idx)
    c_idx1 = 2 * idx + 1 < @store.length ? 2 * idx + 1 : nil
    c_idx2 = 2 * idx + 2 < @store.length ? 2 * idx + 2 : nil
    [c_idx1, c_idx2].reject { |el| el.nil? }
  end

  def parent(idx)
    (idx - 1) / 2
  end
end

class MaxHeap
  attr_accessor :store
  def initialize
    @store = []
  end

  def push(val)
    @store << val
    heapify_up(@store.length - 1)
  end

  def heapify_up(idx)
    parent_idx = parent(idx)
    return @store if parent_idx < 0
    if @store[idx] > @store[parent_idx]
      @store[idx], @store[parent_idx] = @store[parent_idx], @store[idx]
      heapify_up(parent_idx)
    end
    @store
  end

  def pop
    @store[0], @store[-1] = @store[-1], @store[0]
    out = @store.pop
    heapify_down(0)
    out
  end

  def heapify_down(idx)
    children = children(idx)
    child = -1
    if children.empty?
      return @store
    elsif children.length == 1
      child = children[0]
    else
      child = @store[children[0]] < @store[children[1]] ? children[1] : children[0]
    end
    if @store[idx] < @store[child]
      @store[idx], @store[child] = @store[child], @store[idx]
      heapify_down(child)
    end
    @store
  end

  def children(idx)
    c_idx1 = 2 * idx + 1 < @store.length ? 2 * idx + 1 : nil
    c_idx2 = 2 * idx + 2 < @store.length ? 2 * idx + 2 : nil
    [c_idx1, c_idx2].reject { |el| el.nil? }
  end

  def parent(idx)
    (idx - 1) / 2
  end
end


def running_median(val, max, min)

  add(val, max, min)
  rebalance(max, min)
  puts median(max, min)
end

def add(val, max, min)
  if max.store.empty? || val < max.store[0]
    max.push(val)
  elsif val > max.store[0]
    min.push(val)
  end
end

def rebalance(max, min)
  if max.store.length - min.store.length > 1
    min.push(max.pop)
  elsif min.store.length - max.store.length > 1
    max.push(min.pop)
  end
end

def median(max, min)
  if max.store.length > min.store.length
    max.store[0]
  elsif min.store.length == max.store.length
    (max.store[0] + min.store[0]) / 2.0
  else
    min.store[0]
  end
end

max = MaxHeap.new
min = MinHeap.new

t = gets.strip.to_i
for _ in (0..t - 1)
  s = gets.strip.to_i
  running_median(s, max, min)
end
