def convert(s, num_rows)
  return s if num_rows == 1
  arr = []
  row = 0
  diff = 1
  num_rows.times {arr << []}
  s.chars.each do |el|
    arr[row] << el
    row += diff
    if row + 1 == num_rows
      diff = -1
    elsif row == 0
      diff = 1
    end
  end
  arr.join
end

p convert("testing", 3)
