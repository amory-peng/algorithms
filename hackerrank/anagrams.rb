def make_anagram(a, b)
  hash_a = Hash.new {|h,k| h[k] = 0}
  a.chars.each do |char|
    hash_a[char] += 1
  end
  common = 0
  b.chars.each do |char|
    if hash_a[char] > 0
      common += 1
      hash_a[char] -= 1
    end
  end
  a.length + b.length - 2 * common
end

p make_anagram('bacdc', 'dcbad')
