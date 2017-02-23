def largest_palindrome(n)
  largest = 0
  ((10**n - 1) ** 2).downto(1) do |i| 
    if  is_palindrome(i.to_s)
      return i % 1337
    end
  end
end

def is_palindrome(str)
  (0...str.length/2).each do |idx|
    return false if str[idx] != str[-(idx + 1)]
  end
  true
end

p is_palindrome("55")
p largest_palindrome(2)
