def is_valid(s)
  map = { '(' => ')', '[' => ']', '{' => '}'}
  queue = []
  s.chars.each do |char|
    if map.keys.include?(char)
      queue << char
    else
      if map[queue[-1]] == char
        queue.pop
      else
        return false
      end
    end
  end
  queue.empty? ? true : false
end

p is_valid("()[]{}")
