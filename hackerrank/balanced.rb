def balanced?(str)
  hash = { '(' => ')', '[' => ']', '{' => '}' }
  stack = []
  str.split('').each do |char|
    if hash.include?(char)
      stack << hash[char]
    elsif stack.last == char
      stack.pop
    else
      return 'NO'
    end
  end
  if stack.empty?
    return 'YES'
  end
  'NO'
end

p balanced?("()")
