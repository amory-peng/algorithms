require_relative "heap"

class Array
  def heap_sort!
    self.each_index do |idx|
      BinaryMinHeap.heapify_up(self, idx, idx)
    end
    self.count.downto(1) do |idx|
      self[0], self[idx-1] = self[idx-1], self[0]
      BinaryMinHeap.heapify_down(self, 0, idx-1)
    end
    self.reverse!
  end
end
