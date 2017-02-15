def ransom(mag, note)
  h = Hash.new {|h,k| h[k] = 0}
  mag.each do |char|
    h[char] += 1
  end
  note.each do |char|
    return "No" if h[char] == 0
    h[char] -= 1
  end
  "Yes"
end
