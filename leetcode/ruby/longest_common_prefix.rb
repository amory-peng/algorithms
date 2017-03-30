def longest_common_prefix(strs)
  return "" if strs.empty?
  compare = strs[0]
  strs[1..-1].each do |str|
    idx = 0
    idx += 1 while compare[0..idx] == str[0..idx] && idx < str.length && idx < compare.length
    compare = compare[0...idx]
  end
  compare
end

p longest_common_prefix(["c", "c"])
