require 'byebug'
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @start = Link.new
    @end = Link.new
    @start.next = @end
    @end.prev = @start
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @start.next
  end

  def last
    @end.prev
  end

  def empty?
  end

  def get(key)
    each {|link| return link.val if link.key == key}
    nil
  end

  def include?(key)
    each {|link| return true if link.key == key}
    false
  end

  def insert(key, val)
    link = Link.new(key, val)
    last.next = link
    link.prev = last
    link.next = @end
    @end.prev = link
    link
  end

  def remove(key)
    removed = nil
    each do |link|
      if link.key == key
        removed = link
        removed.prev.next = removed.next
        removed.next.prev = removed.prev
      end
    end
    removed
  end

  def each
    current = first
    while current != @end
      yield current
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
