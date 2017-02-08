class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    left = []
    right = []
    array[1..-1].each do |el|
      if el < pivot
        left << el
      else
        right << el
      end
    end
    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new {|x,y| x <=> y}
    return array if length <= 1
    pivot_idx = partition(array, start, length, &prc)
    sort2!(array, start, pivot_idx - start, &prc)
    sort2!(array, pivot_idx+1, length-pivot_idx+start-1, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    return start if length == 1
    prc ||= Proc.new {|x,y| x <=> y}
    pivot = array[start]
    wall = start
    (start+1).upto(start + length - 1) do |idx|
      current = array[idx]
      if prc.call(array[idx], pivot) == -1
        array[idx] = array[wall + 1]
        array[wall + 1] = pivot
        array[wall] = current
        wall += 1
      end
    end
    wall
  end
  #sorts, wrong callstack

  # def self.partition(array, start, length, &prc)
  #   return start if length == 1
  #   prc ||= Proc.new {|x,y| x <=> y}
  #   pivot = array[start]
  #   wall = start
  #   (start+1).upto(start + length) do |idx|
  #     if prc.call(array[idx], pivot) == -1
  #       array[wall + 1], array[idx] = array[idx], array[wall + 1]
  #       wall += 1
  #     end
  #   end
  #   array.insert(wall, array.delete_at(start))
  #   wall
  # end
end
