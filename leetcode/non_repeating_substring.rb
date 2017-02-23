require 'set'

def length_of_longest_substring(s)
  seen = Set.new
  length = 0
  i = 0
  j = 0
  while j < s.length
    if !seen.include?(s[j])
      seen.add(s[j])
      j += 1
      length = [length, j - i].max
    else
      seen.delete(s[i])
      i += 1
    end
  end
  length
end

p length_of_longest_substring("abcabcbb")
p length_of_longest_substring("bbbb")
p length_of_longest_substring("pwwkew")
