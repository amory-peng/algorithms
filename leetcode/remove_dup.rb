def remove_duplicates(nums)
  return nums.length if nums.length < 2
  tail = 1
  nums.each_with_index do |el, idx|
    next if idx == 0
    if el != nums[idx - 1]
      nums[tail] = el
      tail += 1
    end
  end
  nums[0...tail]
end

p remove_duplicates([1, 1])
