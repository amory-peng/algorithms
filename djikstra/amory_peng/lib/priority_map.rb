require_relative 'heap2'

class PriorityMap
  def initialize(&prc)
    @map = {}
    @queue = BinaryMinHeap.new {|key1, key2| prc.call(@map[key1], @map[key2])}
  end

  def [](key)
    @map[key] if @map.has_key?(key)
  end

  def []=(key, value)
    if @map.has_key?(key)
      update(key, value)
    else
      insert(key, value)
    end
  end

  def count
    @queue.count
  end

  def empty?
    @queue.empty?
  end

  def extract
    key = @queue.extract
    val = @map.delete(key)
    [key, val]
  end

  def has_key?(key)
    @map.has_key?(key)
  end

  protected
  attr_accessor :map, :queue

  def insert(key, value)
    @map[key] = value
    @queue.push(key)
  end

  def update(key, value)
    @map[key] = value
    @queue.reduce!(key)
  end
end
