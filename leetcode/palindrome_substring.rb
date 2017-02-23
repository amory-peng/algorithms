def longest_palindrome(s)
  out = ""
  (s.length).times do |i|
    idx = i
    odd = build_palindrome(s, idx, idx) #odd
    even = build_palindrome(s, idx, idx+1) #even
    out = [out, s[odd[0] .. odd[1]], s[even[0] .. even[1]]].max {|a, b| a.length <=> b.length }
  end
  out
end

def build_palindrome(str, start, stop)
  while start >= 0 && stop < str.length && str[start] == str[stop]
    stop += 1
    start -= 1
  end
  [start + 1, stop - 1]
end

p longest_palindrome("a")
