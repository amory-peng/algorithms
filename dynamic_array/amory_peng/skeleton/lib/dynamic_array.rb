require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise "index out of bounds" if index >= @length
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length <= 0
    old_length = @length
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @store[@length] = val
    if @length == @capacity
      @capacity *= 2
      resize!
    end
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length <= 0
    old_store = @store
    @store = StaticArray.new(@capacity)
    (1...@length).each do |idx|
      @store[idx - 1] = old_store[idx]
    end
    @length -= 1
    old_store[0]
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1
    if @length == @capacity
      @capacity *= 2
      resize!
    end
    old_store = @store
    @store = StaticArray.new(@capacity)
    @store[0] = val
    (1...@length).each do |idx|
      @store[idx] = old_store[idx - 1]
    end
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    old_store = @store;
    @store = StaticArray.new(@capacity);
    @length.times do |idx|
      @store[idx] = old_store[idx]
    end
  end
end
