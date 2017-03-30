require 'set'

def two_sums(nums, target)
  seen = {};
  nums.each_with_index do |el, idx|
    diff = target - el
    if seen.include?(target - el)
      return [seen[diff], idx]
    else
      seen[el] = idx
    end
  end
end

p two_sum([2, 7, 11, 15], 9)
