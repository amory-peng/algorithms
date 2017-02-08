require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @start_idx = 0
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(index + @start_idx)% @capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[index + @start_idx] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    old_length = @length
    @length -= 1
    @store[(@start_idx + @length) % @capacity]
  end

  # O(1) ammortized
  def push(val)
    if @length == @capacity
      resize!
    end
    @store[(@length + @start_idx) % @capacity] = val
    @length += 1
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    @length -= 1
    old_start_idx = @start_idx
    @start_idx += 1
    @store[old_start_idx % @capacity]
  end

  # O(1) ammortized
  def unshift(val)
    @length += 1
    if @length > @capacity
      resize!
    end
    @start_idx = (@start_idx - 1) % @capacity
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= @length || @length == 0
  end

  def resize!
    old_store = @store;
    @store = StaticArray.new(@capacity * 2)
    (@capacity).times do |idx|
      @store[idx] = old_store[(@start_idx + idx) % (@capacity)]
    end
    @capacity *= 2
    @start_idx = 0
  end
end
