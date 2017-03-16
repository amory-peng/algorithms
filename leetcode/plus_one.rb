def plus_one(digits)
  (digits.length - 1).downto(0) do |num|
    if digits[num] < 9
      digits[num] += 1
      return digits
    end
    digits[num] = 0
  end
  digits.unshift(1)
end

p plus_one([9, 9, 9])
