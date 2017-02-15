def balanced?(str)
  hash = { '(' => ')', '[' => ']', '{' => '}' }
  stack = []
  str.split('').each do |char|
    if hash.include?(char)
      stack << hash[char]
    elsif !stack.empty? && stack.last == char
      stack.pop
    else
      return 'NO'
    end
  end
  'YES'
end

p balanced?("()")
