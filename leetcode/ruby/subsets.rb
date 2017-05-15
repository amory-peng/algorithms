def subsets(nums)
  return [[]] if nums.empty?
  out = []
  first = nums.pop
  prev = subsets(nums)
  prev.each do |set|
    new_set = set.dup
    new_set << first
    out << new_set
  end
  out + prev
end
